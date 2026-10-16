{ config, lib, pkgs, ... }:

let
  cfg = config.services.csfx-cluster;
  cp = config.services.csfx-cp;

  runDir = "/run/csfx-cluster";
  haproxyDir = "/run/csfx-haproxy";
  agentConfig = "/var/lib/csfx-agent/config.json";
  etcdEndpoint = "http://127.0.0.1:2379";
  patroniMemberPrefix = "/service/csfx/members/";
  etcdPort = 2379;
  etcdPeerPort = 2380;
  postgresPort = 5433;
  patroniApiPort = 8008;
  meshCidr = "10.100.0.0/16";

  clusterEnvScript = pkgs.writeShellScript "csfx-cluster-env" ''
    set -euo pipefail

    mode="''${1:-write}"
    config="${agentConfig}"
    ip=""
    if [ -f "$config" ]; then
      ip=$(${pkgs.jq}/bin/jq -r '.wg_tunnel_ip // empty' "$config")
    fi

    if [ -n "$ip" ]; then
      bind="0.0.0.0"
      advertise="$ip"
      client_urls="http://127.0.0.1:${toString etcdPort},http://$ip:${toString etcdPort}"
    else
      bind="127.0.0.1"
      advertise="127.0.0.1"
      client_urls="http://127.0.0.1:${toString etcdPort}"
    fi

    staging=$(${pkgs.coreutils}/bin/mktemp -d)
    trap '${pkgs.coreutils}/bin/rm -rf "$staging"' EXIT

    cat > "$staging/etcd.env" <<EOF
    ETCD_LISTEN_CLIENT_URLS=$client_urls
    ETCD_ADVERTISE_CLIENT_URLS=http://$advertise:${toString etcdPort}
    ETCD_LISTEN_PEER_URLS=http://$advertise:${toString etcdPeerPort}
    ETCD_INITIAL_ADVERTISE_PEER_URLS=http://$advertise:${toString etcdPeerPort}
    EOF
    printf '%s' "$bind:${toString patroniApiPort}" > "$staging/patroni-restapi-listen"
    printf '%s' "$advertise:${toString patroniApiPort}" > "$staging/patroni-restapi-address"
    printf '%s' "$bind:${toString postgresPort}" > "$staging/patroni-postgresql-listen"
    printf '%s' "$advertise:${toString postgresPort}" > "$staging/patroni-postgresql-address"

    changed=0
    for file in "$staging"/*; do
      target="${runDir}/$(${pkgs.coreutils}/bin/basename "$file")"
      if ! ${pkgs.diffutils}/bin/cmp -s "$file" "$target" 2>/dev/null; then
        ${pkgs.coreutils}/bin/install -m 0644 "$file" "$target"
        changed=1
      fi
    done

    if [ "$mode" != "apply" ] || [ "$changed" = "0" ]; then
      exit 0
    fi

    echo "[INFO] cluster network changed advertise=$advertise"
    ETCDCTL="${pkgs.etcd}/bin/etcdctl --endpoints=${etcdEndpoint}"

    if [ -n "$ip" ]; then
      member=$($ETCDCTL member list | ${pkgs.gawk}/bin/awk -F', ' -v name="${config.networking.hostName}" '$3 == name { print $1 }')
      if [ -n "$member" ]; then
        $ETCDCTL member update "$member" --peer-urls="http://$ip:${toString etcdPeerPort}"
      fi
    fi

    ${pkgs.systemd}/bin/systemctl restart etcd.service
    for _ in $(${pkgs.coreutils}/bin/seq 1 60); do
      if $ETCDCTL endpoint health > /dev/null 2>&1; then
        break
      fi
      ${pkgs.coreutils}/bin/sleep 1
    done
    ${pkgs.systemd}/bin/systemctl restart patroni.service
  '';

  haproxyConfigScript = pkgs.writeShellScript "csfx-haproxy-config" ''
    set -euo pipefail

    target="${haproxyDir}/haproxy.cfg"
    ${pkgs.coreutils}/bin/mkdir -p "${haproxyDir}"

    backends=$(${pkgs.etcd}/bin/etcdctl --endpoints=${etcdEndpoint} get "${patroniMemberPrefix}" --prefix --print-value-only 2>/dev/null \
      | ${pkgs.jq}/bin/jq -r 'select(.conn_url != null) | .conn_url | sub("^postgres://"; "") | sub("/.*$"; "")' 2>/dev/null \
      | ${pkgs.coreutils}/bin/sort -u || true)
    if [ -z "$backends" ]; then
      backends="127.0.0.1:${toString postgresPort}"
    fi

    staging=$(${pkgs.coreutils}/bin/mktemp)
    trap '${pkgs.coreutils}/bin/rm -f "$staging"' EXIT

    {
      cat <<EOF
    global
      maxconn 500

    defaults
      mode tcp
      timeout connect 5s
      timeout client 30m
      timeout server 30m

    listen postgres
      bind 127.0.0.1:5432
      option httpchk GET /primary
      http-check expect status 200
      default-server inter 3s fall 3 rise 2 on-marked-down shutdown-sessions
    EOF
      index=0
      for backend in $backends; do
        echo "  server member$index $backend check port ${toString patroniApiPort}"
        index=$((index + 1))
      done
    } > "$staging"

    if ! ${pkgs.diffutils}/bin/cmp -s "$staging" "$target" 2>/dev/null; then
      ${pkgs.coreutils}/bin/install -m 0644 "$staging" "$target"
      if [ "''${1:-}" = "reload" ]; then
        ${pkgs.systemd}/bin/systemctl reload csfx-haproxy.service
      fi
    fi
  '';

  clusterUnit = {
    unitConfig.ConditionPathExists = cp.controlPlaneConditions;
  };

  controlPlaneUnits = [
    "etcd.service"
    "patroni.service"
    "csfx-haproxy.service"
    "csfx-db-init.service"
    "csfx-migrate.service"
    "csfx-setup-code.service"
    "csfx-setup.service"
    "csfx-registry.service"
    "csfx-api-gateway.service"
    "csfx-scheduler.service"
    "csfx-volume-manager.service"
    "csfx-failover-controller.service"
    "csfx-sdn-controller.service"
    "csfx-object-storage.service"
    "csfx-updater.service"
    "garage.service"
    "csfx-cp-ready.service"
    "keepalived.service"
  ];
in
{
  options.services.csfx-cluster = {
    enable = lib.mkEnableOption "multi master control plane (etcd and patroni over the management mesh, local postgres proxy, master join)";

    vip = {
      address = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
        example = "192.168.1.50";
        description = "Floating address that follows a healthy master, null disables keepalived";
      };

      prefixLength = lib.mkOption {
        type = lib.types.int;
        default = 24;
      };

      interface = lib.mkOption {
        type = lib.types.str;
        default = "";
        example = "eth0";
        description = "Interface that carries the floating address, requires a layer 2 segment shared by all masters";
      };

      routerId = lib.mkOption {
        type = lib.types.int;
        default = 51;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [{
      assertion = cfg.vip.address == null || cfg.vip.interface != "";
      message = "services.csfx-cluster.vip.interface must be set when vip.address is set";
    }];

    networking.firewall = {
      interfaces.wgmgmt0.allowedTCPPorts = [ etcdPort etcdPeerPort postgresPort patroniApiPort ];
      extraCommands = lib.mkIf (cfg.vip.address != null) ''
        iptables -A nixos-fw -p vrrp -j nixos-fw-accept
      '';
    };

    services = {
      patroni = {
        postgresqlPort = postgresPort;
        environmentFiles = {
          PATRONI_RESTAPI_LISTEN = "${runDir}/patroni-restapi-listen";
          PATRONI_RESTAPI_CONNECT_ADDRESS = "${runDir}/patroni-restapi-address";
          PATRONI_POSTGRESQL_LISTEN = "${runDir}/patroni-postgresql-listen";
          PATRONI_POSTGRESQL_CONNECT_ADDRESS = "${runDir}/patroni-postgresql-address";
        };
        settings.postgresql.pg_hba = [
          "local all all trust"
          "host replication replicator 127.0.0.1/32 md5"
          "host all all 127.0.0.1/32 md5"
          "host replication replicator ${meshCidr} md5"
          "host all all ${meshCidr} md5"
        ];
      };

      keepalived = lib.mkIf (cfg.vip.address != null) {
        enable = true;
        vrrpScripts.csfx-health = {
          script = "${pkgs.writeShellScript "csfx-vip-health" ''
            ${pkgs.curl}/bin/curl -sfk --max-time 3 https://localhost:8000/api/public-key > /dev/null
            ${pkgs.etcd}/bin/etcdctl --endpoints=${etcdEndpoint} endpoint health > /dev/null
          ''}";
          interval = 5;
          fall = 2;
          rise = 2;
        };
        vrrpInstances.csfx = {
          interface = cfg.vip.interface;
          virtualRouterId = cfg.vip.routerId;
          priority = 100;
          virtualIps = [{ addr = "${cfg.vip.address}/${toString cfg.vip.prefixLength}"; }];
          trackScripts = [ "csfx-health" ];
        };
      };
    };

    systemd = {
      services = {
        etcd = {
          requires = [ "csfx-cluster-env.service" ];
          after = [ "csfx-cluster-env.service" ];
          serviceConfig.EnvironmentFile = [
            "-${runDir}/etcd.env"
            "-/etc/csfx/etcd-join.env"
          ];
        };

        patroni = {
          requires = [ "csfx-cluster-env.service" ];
          after = [ "csfx-cluster-env.service" ];
        };

        keepalived = lib.mkIf (cfg.vip.address != null) clusterUnit;

        csfx-cluster-env = clusterUnit // {
          description = "CSFX cluster network environment";
          before = [ "etcd.service" "patroni.service" ];
          serviceConfig = {
            Type = "oneshot";
            RuntimeDirectory = "csfx-cluster";
            RuntimeDirectoryPreserve = "yes";
            ExecStart = "${clusterEnvScript} write";
          };
        };

        csfx-cluster-net = clusterUnit // {
          description = "CSFX cluster network reconciliation";
          after = [ "csfx-cluster-env.service" ];
          serviceConfig = {
            Type = "oneshot";
            ExecStart = "${clusterEnvScript} apply";
          };
        };

        csfx-haproxy = clusterUnit // {
          description = "CSFX postgres leader proxy";
          wantedBy = [ "multi-user.target" ];
          after = [ "network.target" ];
          before = [ "csfx-db-init.service" "csfx-migrate.service" ];
          serviceConfig = {
            Type = "notify";
            RuntimeDirectory = "csfx-haproxy";
            ExecStartPre = "${haproxyConfigScript}";
            ExecStart = "${pkgs.haproxy}/sbin/haproxy -Ws -f ${haproxyDir}/haproxy.cfg";
            ExecReload = [
              "${pkgs.haproxy}/sbin/haproxy -c -f ${haproxyDir}/haproxy.cfg"
              "${pkgs.coreutils}/bin/kill -USR2 $MAINPID"
            ];
            Restart = "on-failure";
            RestartSec = "2s";
          };
        };

        csfx-haproxy-refresh = clusterUnit // {
          description = "CSFX postgres leader proxy backend refresh";
          after = [ "csfx-haproxy.service" ];
          serviceConfig = {
            Type = "oneshot";
            ExecStart = "${haproxyConfigScript} reload";
          };
        };

        csfx-master-join = {
          description = "CSFX master join";
          wantedBy = [ "multi-user.target" ];
          after = [ "network-online.target" "csfx-agent.service" ];
          wants = [ "network-online.target" "csfx-agent.service" ];
          path = [ pkgs.coreutils pkgs.systemd ];
          unitConfig.ConditionPathExists = [
            "|${cp.masterJoinPendingMarker}"
            "|/etc/csfx/master-join-promote"
          ];
          serviceConfig = {
            Type = "oneshot";
            User = "root";
            TimeoutStartSec = "40min";
            EnvironmentFile = "/etc/csfx/agent-join.env";
            ExecStart = "${config.services.csfx-agent.package}/bin/csfx-agent --join-master";
          };
        };
      };

      timers = {
        csfx-cluster-net = {
          wantedBy = [ "timers.target" ];
          timerConfig = {
            OnBootSec = "30s";
            OnUnitActiveSec = "15s";
          };
        };

        csfx-haproxy-refresh = {
          wantedBy = [ "timers.target" ];
          timerConfig = {
            OnBootSec = "30s";
            OnUnitActiveSec = "20s";
          };
        };
      };

      targets.csfx-cp = {
        description = "CSFX control plane";
        wantedBy = [ "multi-user.target" ];
        wants = controlPlaneUnits;
      };
    };
  };
}

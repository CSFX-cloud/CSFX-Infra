{ config, lib, pkgs, ... }:

let
  cfg = config.services.csfx-cluster;
  cp = config.services.csfx-cp;

  runDir = "/run/csfx-cluster";
  haproxyDir = "/run/csfx-haproxy";
  agentConfig = "/var/lib/csfx-agent/config.json";
  joinEnvFile = "/etc/csfx/etcd-join.env";
  etcdEndpoint = "http://127.0.0.1:2379";
  patroniMemberPrefix = "/service/csfx/members/";
  etcdPort = 2379;
  etcdPeerPort = 2380;
  postgresPort = 5433;
  patroniApiPort = 8008;
  meshCidr = "10.100.0.0/16";
  clusterEnvFile = "/etc/csfx/cluster.env";
  promoteMarker = "/etc/csfx/master-join-promote";
  keepalivedDir = "/run/csfx-keepalived";

  vipEnvironment = {
    CSFX_VIP_ADDRESS = toString cfg.vip.address;
    CSFX_VIP_PREFIX = toString cfg.vip.prefixLength;
    CSFX_VIP_ROUTER_ID = toString cfg.vip.routerId;
  };

  vipHealthScript = pkgs.writeShellScript "csfx-vip-health" ''
    [ ! -e ${cp.masterJoinPendingMarker} ]
    [ ! -e ${promoteMarker} ]
    ${pkgs.curl}/bin/curl -sfk --max-time 3 https://localhost:8000/api/ready > /dev/null
    ${pkgs.etcd}/bin/etcdctl --endpoints=http://127.0.0.1:2379 endpoint health > /dev/null
  '';

  vipConfigScript = pkgs.writeShellScript "csfx-keepalived-config" ''
    set -euo pipefail

    address="${toString cfg.vip.address}"
    prefix="${toString cfg.vip.prefixLength}"
    router="${toString cfg.vip.routerId}"
    interface="${cfg.vip.interface}"
    if [ -f ${clusterEnvFile} ]; then
      set -a
      . ${clusterEnvFile}
      set +a
      address="''${CSFX_VIP_ADDRESS:-$address}"
      prefix="''${CSFX_VIP_PREFIX:-$prefix}"
      router="''${CSFX_VIP_ROUTER_ID:-$router}"
    fi

    [ -n "$address" ] || exit 1
    [ "''${1:-write}" = "write" ] || exit 0

    if [ -z "$interface" ]; then
      interface=$(${pkgs.iproute2}/bin/ip -o route get "$address" | ${pkgs.gnused}/bin/sed -n 's/.* dev \([^ ]*\).*/\1/p' | ${pkgs.coreutils}/bin/head -n 1)
    fi

    cat > ${keepalivedDir}/keepalived.conf <<EOF
    global_defs {
      script_user root
    }

    vrrp_script csfx_health {
      script "${vipHealthScript}"
      interval 5
      timeout 5
      fall 2
      rise 2
    }

    vrrp_instance csfx {
      state BACKUP
      nopreempt
      interface $interface
      virtual_router_id $router
      priority 100
      advert_int 1
      virtual_ipaddress {
        $address/$prefix dev $interface
      }
      track_script {
        csfx_health
      }
    }
    EOF
  '';

  clusterEnvScript = pkgs.writeShellScript "csfx-cluster-env" ''
    set -euo pipefail

    mode="''${1:-write}"
    config="${agentConfig}"
    ip=""
    if [ -f "$config" ]; then
      ip=$(${pkgs.jq}/bin/jq -r '.wg_tunnel_ip // empty' "$config")
    fi
    if [ -n "$ip" ] && ! ${pkgs.iproute2}/bin/ip -4 addr show dev wgmgmt0 2>/dev/null | ${pkgs.gnugrep}/bin/grep -qF "inet $ip/"; then
      ip=""
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

    member_name="${config.networking.hostName}"
    if [ -f ${joinEnvFile} ]; then
      joined_name=$(${pkgs.gnused}/bin/sed -n 's/^ETCD_NAME=//p' ${joinEnvFile})
      if [ -n "$joined_name" ]; then
        member_name="$joined_name"
      fi
    fi

    staging=$(${pkgs.coreutils}/bin/mktemp -d)
    trap '${pkgs.coreutils}/bin/rm -rf "$staging"' EXIT

    cat > "$staging/etcd.env" <<EOF
    ETCD_LISTEN_CLIENT_URLS=$client_urls
    ETCD_ADVERTISE_CLIENT_URLS=http://$advertise:${toString etcdPort}
    ETCD_LISTEN_PEER_URLS=http://$advertise:${toString etcdPeerPort}
    ETCD_INITIAL_ADVERTISE_PEER_URLS=http://$advertise:${toString etcdPeerPort}
    EOF
    if [ ! -f ${joinEnvFile} ]; then
      printf 'ETCD_INITIAL_CLUSTER=%s=http://%s:%s\n' "$member_name" "$advertise" "${toString etcdPeerPort}" >> "$staging/etcd.env"
    fi
    printf '%s' "$member_name" > "$staging/patroni-name"
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
      member=$($ETCDCTL member list 2>/dev/null | ${pkgs.gawk}/bin/awk -F', ' -v name="$member_name" '$3 == name { print $1 }' || true)
      if [ -n "$member" ]; then
        $ETCDCTL member update "$member" --peer-urls="http://$ip:${toString etcdPeerPort}" \
          || echo "[WARN] etcd member update failed member=$member"
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
    "csfx-keepalived.service"
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
        description = "Interface that carries the floating address, derived from the route to the address when empty, requires a layer 2 segment shared by all masters";
      };

      routerId = lib.mkOption {
        type = lib.types.int;
        default = 51;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    networking.firewall = {
      interfaces.wgmgmt0.allowedTCPPorts = [ etcdPort etcdPeerPort postgresPort patroniApiPort ];
      extraCommands = ''
        iptables -A nixos-fw -p vrrp -j nixos-fw-accept
      '';
    };

    services = {
      patroni = {
        postgresqlPort = postgresPort;
        environmentFiles = {
          PATRONI_NAME = "${runDir}/patroni-name";
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
    };

    systemd = {
      services = {
        etcd = {
          environment.ETCD_MAX_LEARNERS = "3";
          requires = [ "csfx-cluster-env.service" ];
          after = [ "csfx-cluster-env.service" ];
          serviceConfig.EnvironmentFile = [
            "-${runDir}/etcd.env"
            "-${joinEnvFile}"
          ];
        };

        patroni = {
          requires = [ "csfx-cluster-env.service" ];
          after = [ "csfx-cluster-env.service" ];
        };

        csfx-keepalived = clusterUnit // {
          description = "CSFX floating address";
          wantedBy = [ "multi-user.target" ];
          after = [ "network-online.target" "csfx-cluster-env.service" ];
          wants = [ "network-online.target" ];
          serviceConfig = {
            RuntimeDirectory = "csfx-keepalived";
            ExecCondition = "${vipConfigScript} check";
            ExecStartPre = "${vipConfigScript} write";
            ExecStart = "${pkgs.keepalived}/sbin/keepalived --dont-fork --log-console --use-file=${keepalivedDir}/keepalived.conf";
            Restart = "on-failure";
            RestartSec = "5s";
          };
        };

        csfx-mgmt-up = {
          description = "CSFX management interface";
          wantedBy = [ "multi-user.target" ];
          before = [ "csfx-cluster-env.service" "etcd.service" ];
          after = [ "network-online.target" ];
          wants = [ "network-online.target" ];
          path = [ pkgs.iproute2 pkgs.wireguard-tools ];
          unitConfig.ConditionPathExists = [ agentConfig "!${cp.masterJoinPendingMarker}" ];
          serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
            ExecStart = "${config.services.csfx-agent.package}/bin/csfx-agent --mgmt-up";
          };
        };

        csfx-registry = {
          environment = lib.mkIf (cfg.vip.address != null) vipEnvironment;
          serviceConfig.EnvironmentFile = lib.mkForce [ cp.envFile "-${clusterEnvFile}" ];
        };

        csfx-api-gateway = {
          environment = lib.mkIf (cfg.vip.address != null) (vipEnvironment // {
            TLS_SANS = "localhost,127.0.0.1,${cfg.vip.address}";
          });
          serviceConfig.EnvironmentFile = lib.mkForce [ cp.envFile "-${clusterEnvFile}" ];
          serviceConfig.LoadCredential = [
            "garage-env:/etc/csfx/garage.env"
            "patroni-superuser-password:/etc/csfx/patroni-superuser-password"
            "patroni-replication-password:/etc/csfx/patroni-replication-password"
          ];
        };

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

        csfx-vip-sync = clusterUnit // {
          description = "CSFX floating address sync";
          after = [ "network-online.target" "csfx-agent.service" ];
          wants = [ "network-online.target" ];
          path = [ pkgs.systemd ];
          serviceConfig = {
            Type = "oneshot";
            User = "root";
            ExecStart = "${config.services.csfx-agent.package}/bin/csfx-agent --sync-vip";
          };
        };

        csfx-master-join = {
          description = "CSFX master join";
          wantedBy = [ "multi-user.target" ];
          after = [ "network-online.target" "csfx-agent.service" ];
          wants = [ "network-online.target" "csfx-agent.service" ];
          path = [ pkgs.coreutils pkgs.systemd ];
          unitConfig = {
            ConditionPathExists = [
              "|${cp.masterJoinPendingMarker}"
              "|/etc/csfx/master-join-promote"
            ];
            StartLimitIntervalSec = 0;
          };
          serviceConfig = {
            Type = "oneshot";
            User = "root";
            Restart = "on-failure";
            RestartSec = "30s";
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

        csfx-vip-sync = {
          wantedBy = [ "timers.target" ];
          timerConfig = {
            OnBootSec = "60s";
            OnUnitActiveSec = "30s";
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

{ config, lib, pkgs, ... }:

let
  cfg = config.services.csfx-openbao;
  cp = config.services.csfx-cp;

  user = "csfx-openbao";
  runDir = "/run/csfx-openbao";
  stateDir = "/var/lib/csfx-data/openbao";
  tlsDir = "${stateDir}/tls";
  auditDir = "/var/log/csfx-openbao";
  agentConfig = "/var/lib/csfx-agent/config.json";
  clusterEnvFile = "/etc/csfx/cluster.env";
  clusterCaCert = "/var/lib/csfx-cp/ca.crt";
  clusterCaKey = "/var/lib/csfx-cp/ca.key";
  sealKeyFile = "/etc/csfx/openbao-seal-key";
  initFile = "/etc/csfx/openbao-init.json";
  roleIdFile = "/etc/csfx/openbao-role-id";
  secretIdFile = "/etc/csfx/openbao-secret-id";
  clientCertFile = "/etc/csfx/openbao-client.crt";
  clientKeyFile = "/etc/csfx/openbao-client.key";
  initLockKey = "/csfx/openbao/init";
  patroniMemberPrefix = "/service/csfx/members/";
  etcdEndpoint = "http://127.0.0.1:2379";
  apiPort = 8200;
  clusterPort = 8201;
  meshCidr = "10.100.0.0/16";
  sealKeyId = "csfx-1";
  renewBeforeSeconds = 2592000;

  bao = "${cfg.package}/bin/bao";

  gatewayPolicy = pkgs.writeText "csfx-gateway.hcl" ''
    path "csfx-kv/*" {
      capabilities = ["create", "read", "update", "patch", "delete", "list"]
    }
    path "sys/policies/acl/csfx-vault-*" {
      capabilities = ["create", "read", "update", "delete"]
    }
    path "auth/approle/role/csfx-vault-*" {
      capabilities = ["create", "read", "update", "delete"]
    }
    path "auth/approle/role/csfx-vault-*/*" {
      capabilities = ["create", "read", "update", "delete", "list"]
    }
  '';

  meshAddressScript = pkgs.writeShellScript "csfx-openbao-mesh-address" ''
    set -euo pipefail

    ip=""
    if [ -f ${agentConfig} ]; then
      ip=$(${pkgs.jq}/bin/jq -r '.wg_tunnel_ip // empty' ${agentConfig})
    fi
    if [ -n "$ip" ] && ${pkgs.iproute2}/bin/ip -4 addr show dev wgmgmt0 2>/dev/null | ${pkgs.gnugrep}/bin/grep -qF "inet $ip/"; then
      printf '%s' "$ip"
    fi
  '';

  prepareScript = pkgs.writeShellScript "csfx-openbao-prepare" ''
    set -euo pipefail

    umask 077
    mesh_ip=$(${meshAddressScript})
    vip=""
    if [ -f ${clusterEnvFile} ]; then
      vip=$(${pkgs.gnused}/bin/sed -n 's/^CSFX_VIP_ADDRESS=//p' ${clusterEnvFile})
    fi

    if [ -n "$mesh_ip" ]; then
      bind="0.0.0.0"
      advertise="$mesh_ip"
    else
      bind="127.0.0.1"
      advertise="127.0.0.1"
    fi

    sans="IP:127.0.0.1,DNS:localhost,DNS:${config.networking.hostName}"
    if [ -n "$mesh_ip" ]; then
      sans="$sans,IP:$mesh_ip"
    fi
    if [ -n "$vip" ]; then
      sans="$sans,IP:$vip"
    fi

    issue() {
      name="$1"
      common_name="$2"
      subject_alt_names="$3"
      certificate="$4"
      key="$5"
      marker="$certificate.sans"

      if [ -s "$certificate" ] && [ -s "$key" ] \
        && [ "$(${pkgs.coreutils}/bin/cat "$marker" 2>/dev/null)" = "$subject_alt_names" ] \
        && ${pkgs.openssl}/bin/openssl x509 -checkend ${toString renewBeforeSeconds} -noout -in "$certificate" > /dev/null; then
        return 0
      fi

      staging=$(${pkgs.coreutils}/bin/mktemp -d)
      ${pkgs.openssl}/bin/openssl req -new -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 -nodes \
        -keyout "$staging/key.pem" -subj "/CN=$common_name" -out "$staging/request.pem"
      printf 'subjectAltName=%s\nextendedKeyUsage=serverAuth,clientAuth\nkeyUsage=digitalSignature\n' "$subject_alt_names" > "$staging/extensions.cnf"
      ${pkgs.openssl}/bin/openssl x509 -req -in "$staging/request.pem" -CA ${clusterCaCert} -CAkey ${clusterCaKey} \
        -CAcreateserial -CAserial "$staging/serial" -days 365 -extfile "$staging/extensions.cnf" -out "$staging/certificate.pem"
      ${pkgs.coreutils}/bin/install -m 0600 "$staging/key.pem" "$key"
      ${pkgs.coreutils}/bin/install -m 0644 "$staging/certificate.pem" "$certificate"
      printf '%s' "$subject_alt_names" > "$marker"
      ${pkgs.coreutils}/bin/rm -rf "$staging"
      echo "[INFO] certificate issued name=$name"
    }

    ${pkgs.coreutils}/bin/mkdir -p /etc/csfx
    if [ ! -s ${sealKeyFile} ]; then
      ${pkgs.openssl}/bin/openssl rand -base64 32 > ${sealKeyFile}
      echo "[INFO] seal key generated file=${sealKeyFile}"
    fi
    for file in ${roleIdFile} ${secretIdFile}; do
      [ -e "$file" ] || ${pkgs.coreutils}/bin/install -m 0600 /dev/null "$file"
    done

    ${pkgs.coreutils}/bin/install -d -m 0700 -o ${user} -g ${user} ${stateDir} ${tlsDir}
    ${pkgs.coreutils}/bin/install -d -m 0700 -o ${user} -g ${user} ${auditDir}

    ${pkgs.coreutils}/bin/install -m 0644 ${clusterCaCert} ${tlsDir}/ca.crt
    issue server "${config.networking.hostName}" "$sans" ${tlsDir}/server.crt ${tlsDir}/server.key
    issue gateway csfx-gateway "DNS:csfx-gateway" ${clientCertFile} ${clientKeyFile}
    ${pkgs.coreutils}/bin/chown ${user}:${user} ${tlsDir}/server.crt ${tlsDir}/server.key ${tlsDir}/ca.crt

    ${pkgs.coreutils}/bin/install -m 0400 -o ${user} -g ${user} /dev/null ${runDir}/seal-key
    ${pkgs.coreutils}/bin/base64 -d < ${sealKeyFile} > ${runDir}/seal-key

    peers=""
    if [ ! -e ${stateDir}/raft/raft.db ]; then
      peers=$(${pkgs.etcd}/bin/etcdctl --endpoints=${etcdEndpoint} get "${patroniMemberPrefix}" --prefix --print-value-only 2>/dev/null \
        | ${pkgs.jq}/bin/jq -r 'select(.conn_url != null) | .conn_url | sub("^postgres://"; "") | sub(":.*$"; "")' 2>/dev/null \
        | ${pkgs.coreutils}/bin/sort -u | ${pkgs.gnugrep}/bin/grep -vxF "$advertise" || true)
    fi

    staging=$(${pkgs.coreutils}/bin/mktemp)
    {
      cat <<EOF
    ui = false
    log_format = "json"
    api_addr = "https://$advertise:${toString apiPort}"
    cluster_addr = "https://$advertise:${toString clusterPort}"

    storage "raft" {
      path = "${stateDir}"
      node_id = "${config.networking.hostName}"
    }

    listener "tcp" {
      address = "$bind:${toString apiPort}"
      cluster_address = "$bind:${toString clusterPort}"
      tls_cert_file = "${tlsDir}/server.crt"
      tls_key_file = "${tlsDir}/server.key"
      tls_client_ca_file = "${tlsDir}/ca.crt"
      tls_require_and_verify_client_cert = true
      tls_min_version = "tls13"
    }

    seal "static" {
      current_key_id = "${sealKeyId}"
      current_key = "file://${runDir}/seal-key"
    }

    audit "file" "csfx" {
      description = "csfx audit log"
      options {
        file_path = "${auditDir}/audit.log"
        mode = "0600"
      }
    }
    EOF
      for peer in $peers; do
        cat <<EOF

    retry_join {
      leader_api_addr = "https://$peer:${toString apiPort}"
      leader_ca_cert_file = "${tlsDir}/ca.crt"
      leader_client_cert_file = "${tlsDir}/server.crt"
      leader_client_key_file = "${tlsDir}/server.key"
    }
    EOF
      done
    } > "$staging"
    ${pkgs.coreutils}/bin/install -m 0640 -o root -g ${user} "$staging" ${runDir}/config.hcl
    ${pkgs.coreutils}/bin/rm -f "$staging"
  '';

  reconcileScript = pkgs.writeShellScript "csfx-openbao-reconcile" ''
    set -euo pipefail

    if ! ${pkgs.systemd}/bin/systemctl is-active --quiet csfx-openbao.service; then
      exit 0
    fi

    fingerprint() {
      ${pkgs.coreutils}/bin/sha256sum ${runDir}/config.hcl ${tlsDir}/server.crt | ${pkgs.coreutils}/bin/sha256sum
    }

    before=$(fingerprint)
    ${prepareScript}
    if [ "$before" != "$(fingerprint)" ]; then
      echo "[INFO] openbao configuration changed action=restart"
      ${pkgs.systemd}/bin/systemctl restart csfx-openbao.service
    fi
  '';

  initScript = pkgs.writeShellScript "csfx-openbao-init" ''
    set -euo pipefail

    export BAO_ADDR="https://127.0.0.1:${toString apiPort}"
    export BAO_CACERT="${tlsDir}/ca.crt"
    export BAO_CLIENT_CERT="${tlsDir}/server.crt"
    export BAO_CLIENT_KEY="${tlsDir}/server.key"
    umask 077

    status() {
      ${bao} status -format=json 2>/dev/null || true
    }

    initialized() {
      [ "$(status | ${pkgs.jq}/bin/jq -r '.initialized // false')" = "true" ]
    }

    wait_until() {
      for _ in $(${pkgs.coreutils}/bin/seq 1 "$1"); do
        if "$2"; then
          return 0
        fi
        ${pkgs.coreutils}/bin/sleep 2
      done
      return 1
    }

    reachable() {
      [ -n "$(status)" ]
    }

    wait_until 60 reachable

    if ! initialized; then
      outcome=$(printf 'create("${initLockKey}") = "0"\n\nput ${initLockKey} "${config.networking.hostName}"\n\n\n' \
        | ${pkgs.etcd}/bin/etcdctl --endpoints=${etcdEndpoint} txn | ${pkgs.coreutils}/bin/head -n 1)
      holder=$(${pkgs.etcd}/bin/etcdctl --endpoints=${etcdEndpoint} get ${initLockKey} --print-value-only)
      if [ "$outcome" != "SUCCESS" ] && [ "$holder" != "${config.networking.hostName}" ]; then
        echo "[INFO] openbao initialized by another master action=join holder=$holder"
        wait_until 300 initialized
        exit 0
      fi
      ${bao} operator init -recovery-shares=5 -recovery-threshold=3 -format=json > ${initFile}
      echo "[INFO] openbao initialized recovery_shares=5 recovery_threshold=3"
    fi

    if [ ! -s ${initFile} ] || [ -s ${roleIdFile} ]; then
      exit 0
    fi

    wait_until 60 initialized
    BAO_TOKEN=$(${pkgs.jq}/bin/jq -r '.root_token' ${initFile})
    export BAO_TOKEN
    if ! ${bao} secrets list -format=json | ${pkgs.jq}/bin/jq -e '."csfx-kv/"' > /dev/null; then
      ${bao} secrets enable -path=csfx-kv -version=2 kv
    fi
    if ! ${bao} auth list -format=json | ${pkgs.jq}/bin/jq -e '."approle/"' > /dev/null; then
      ${bao} auth enable approle
    fi
    ${bao} policy write csfx-gateway ${gatewayPolicy}
    ${bao} write auth/approle/role/csfx-gateway token_policies=csfx-gateway token_ttl=1h token_max_ttl=24h \
      token_bound_cidrs=127.0.0.1/32,${meshCidr} secret_id_bound_cidrs=127.0.0.1/32,${meshCidr} secret_id_num_uses=0 secret_id_ttl=0
    ${bao} read -field=role_id auth/approle/role/csfx-gateway/role-id > ${roleIdFile}
    ${bao} write -f -field=secret_id auth/approle/role/csfx-gateway/secret-id > ${secretIdFile}
    ${bao} token revoke -self
    ${pkgs.jq}/bin/jq 'del(.root_token)' ${initFile} > ${initFile}.next
    ${pkgs.coreutils}/bin/mv ${initFile}.next ${initFile}
    echo "[INFO] openbao bootstrap complete mount=csfx-kv role=csfx-gateway"
    ${pkgs.systemd}/bin/systemctl try-restart csfx-api-gateway.service
  '';
in
{
  options.services.csfx-openbao = {
    enable = lib.mkEnableOption "highly available OpenBao secrets service (raft over the management mesh, static auto-unseal, mutual tls)";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.openbao;
      description = "OpenBao package providing the bao binary";
    };
  };

  config = lib.mkIf cfg.enable {
    users = {
      groups.${user} = { };
      users.${user} = {
        isSystemUser = true;
        group = user;
      };
    };

    networking.firewall.interfaces.wgmgmt0.allowedTCPPorts = [ apiPort clusterPort ];

    systemd = {
      services = {
        csfx-openbao = {
          description = "CSFX OpenBao secrets service";
          wantedBy = [ "multi-user.target" ];
          after = [ "network-online.target" "csfx-mount-data.service" "etcd.service" ];
          wants = [ "network-online.target" ];
          requires = [ "csfx-mount-data.service" ];
          unitConfig.ConditionPathExists = cp.controlPlaneConditions;
          serviceConfig = {
            User = user;
            Group = user;
            RuntimeDirectory = "csfx-openbao";
            RuntimeDirectoryMode = "0750";
            ExecStartPre = "+${prepareScript}";
            ExecStart = "${bao} server -config=${runDir}/config.hcl";
            Restart = "on-failure";
            RestartSec = "5s";
            LimitCORE = 0;
            AmbientCapabilities = [ "CAP_IPC_LOCK" ];
            CapabilityBoundingSet = [ "CAP_IPC_LOCK" ];
            NoNewPrivileges = true;
            PrivateTmp = true;
            ProtectSystem = "strict";
            ProtectHome = true;
            ReadWritePaths = [ "-${stateDir}" "-${auditDir}" ];
          };
        };

        csfx-openbao-init = {
          description = "CSFX OpenBao initialization and bootstrap";
          wantedBy = [ "multi-user.target" ];
          path = [ pkgs.bash ];
          environment.HOME = runDir;
          after = [ "csfx-openbao.service" ];
          requires = [ "csfx-openbao.service" ];
          unitConfig = {
            ConditionPathExists = cp.controlPlaneConditions;
            StartLimitIntervalSec = 0;
          };
          serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
            Restart = "on-failure";
            RestartSec = "15s";
            TimeoutStartSec = "15min";
            ExecStart = initScript;
          };
        };

        csfx-openbao-reconcile = {
          description = "CSFX OpenBao configuration reconciliation";
          unitConfig.ConditionPathExists = cp.controlPlaneConditions;
          serviceConfig = {
            Type = "oneshot";
            ExecStart = reconcileScript;
          };
        };

        csfx-api-gateway = {
          after = [ "csfx-openbao.service" ];
          wants = [ "csfx-openbao.service" ];
          serviceConfig.LoadCredential = [
            "openbao-ca:${clusterCaCert}"
            "openbao-seal-key:${sealKeyFile}"
            "openbao-client-certificate:${clientCertFile}"
            "openbao-client-key:${clientKeyFile}"
            "openbao-role-id:${roleIdFile}"
            "openbao-secret-id:${secretIdFile}"
          ];
        };
      };

      timers.csfx-openbao-reconcile = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnBootSec = "60s";
          OnUnitActiveSec = "30s";
        };
      };

      targets.csfx-cp.wants = [ "csfx-openbao.service" "csfx-openbao-init.service" ];
    };
  };
}

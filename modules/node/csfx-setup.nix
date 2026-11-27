{ config, lib, pkgs, utils, ... }:

let
  cfg = config.services.csfx-setup;

  diskSetupScript = pkgs.writeShellScript "csfx-disk-setup" ''
    set -euo pipefail

    PART="${cfg.dataPart}"
    DISK=$(${pkgs.util-linux}/bin/lsblk -no PKNAME "$PART" 2>/dev/null || echo "''${PART%[0-9]*}")
    MOUNT="/var/lib/csfx-data"

    if ${pkgs.util-linux}/bin/mountpoint -q "$MOUNT"; then
      exit 0
    fi

    if ! ${pkgs.util-linux}/bin/blkid "$PART" > /dev/null 2>&1; then
      if [ ! -b "$PART" ]; then
        echo "[ERROR] partition does not exist part=''${PART} — disk was not partitioned by installer"
        exit 1
      fi
      echo "[INFO] formatting data partition part=''${PART}"
      ${pkgs.e2fsprogs}/bin/mkfs.ext4 -L csfx-data "$PART"
      echo "[INFO] data partition formatted part=''${PART}"
    fi

    mkdir -p "$MOUNT"
    ${pkgs.util-linux}/bin/mount "$PART" "$MOUNT"
    echo "[INFO] disk mounted mount=''${MOUNT}"

    mkdir -p \
      "$MOUNT/csfx" \
      "$MOUNT/postgresql" \
      "$MOUNT/etcd" \
      "$MOUNT/csfx-updater"

    chown patroni:patroni "$MOUNT/postgresql"
    chown etcd:etcd "$MOUNT/etcd" 2>/dev/null || true
    chown csfx-updater:csfx-updater "$MOUNT/csfx-updater" 2>/dev/null || true
    chmod 0700 "$MOUNT/postgresql"
  '';

  etcdPeerCaStep = lib.optionalString (lib.attrByPath [ "services" "csfx-cluster" "enable" ] false config) ''
    if [ ! -s /etc/csfx/etcd-peer-ca.crt ]; then
      ${pkgs.openssl}/bin/openssl req -x509 -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 -nodes \
        -keyout /etc/csfx/etcd-peer-ca.key -out /etc/csfx/etcd-peer-ca.crt \
        -days 3650 -subj "/CN=csfx-etcd-peer-ca"
      chmod 0600 /etc/csfx/etcd-peer-ca.key
      chmod 0644 /etc/csfx/etcd-peer-ca.crt
      echo "[INFO] etcd peer ca created file=/etc/csfx/etcd-peer-ca.crt"
    fi
  '';

  setupScript = pkgs.writeShellScript "csfx-setup" ''
        set -euo pipefail

        DONE_FILE="/var/lib/csfx-data/csfx/.setup-complete"
        ENV_FILE="/etc/csfx/cp.env"
        JOIN_ENV_FILE="/etc/csfx/etcd-join.env"

        if [ -f "$ENV_FILE" ] && [ ! -f "$JOIN_ENV_FILE" ] && ! ${pkgs.gnugrep}/bin/grep -q '^CSFX_SITE_SECRET=' "$ENV_FILE"; then
          printf 'CSFX_SITE_SECRET=%s\n' "$(${pkgs.openssl}/bin/openssl rand -hex 32)" >> "$ENV_FILE"
          echo "[INFO] site secret added file=$ENV_FILE"
        fi

        if [ -f "$ENV_FILE" ] && ! ${pkgs.gnugrep}/bin/grep -q '^CSFX_INTERNAL_TOKEN=' "$ENV_FILE"; then
          printf 'CSFX_INTERNAL_TOKEN=%s\n' "$(${pkgs.openssl}/bin/openssl rand -hex 32)" >> "$ENV_FILE"
          echo "[INFO] internal token added file=$ENV_FILE"
        fi

        if [ -f "$DONE_FILE" ]; then
          exit 0
        fi

        mkdir -p /etc/csfx /var/lib/csfx
        umask 0077

        JWT_SECRET=$(${pkgs.openssl}/bin/openssl rand -hex 32)
        DB_PASSWORD=$(${pkgs.openssl}/bin/openssl rand -hex 16)
        PG_SUPERUSER_PASSWORD=$(${pkgs.openssl}/bin/openssl rand -hex 16)
        PG_REPLICATION_PASSWORD=$(${pkgs.openssl}/bin/openssl rand -hex 16)
        GARAGE_ADMIN_TOKEN=$(${pkgs.openssl}/bin/openssl rand -hex 32)
        GARAGE_RPC_SECRET=$(${pkgs.openssl}/bin/openssl rand -hex 32)
        OBJECT_STORAGE_ENCRYPTION_KEY=$(${pkgs.openssl}/bin/openssl rand -hex 32)
        SITE_SECRET=$(${pkgs.openssl}/bin/openssl rand -hex 32)
        INTERNAL_TOKEN=$(${pkgs.openssl}/bin/openssl rand -hex 32)

        ${etcdPeerCaStep}

        cat > "$ENV_FILE" <<EOF
    DATABASE_URL=postgres://csfx:$DB_PASSWORD@127.0.0.1:6432/csfx
    DATABASE_DIRECT_URL=postgres://csfx:$DB_PASSWORD@127.0.0.1:5432/csfx
    JWT_SECRET=$JWT_SECRET
    ETCD_ENDPOINTS=http://localhost:2379
    GARAGE_ADMIN_TOKEN=$GARAGE_ADMIN_TOKEN
    OBJECT_STORAGE_ENCRYPTION_KEY=$OBJECT_STORAGE_ENCRYPTION_KEY
    CSFX_SITE_SECRET=$SITE_SECRET
    CSFX_INTERNAL_TOKEN=$INTERNAL_TOKEN
    EOF
        chmod 0600 "$ENV_FILE"

        cat > /etc/csfx/garage.env <<EOF
    GARAGE_RPC_SECRET=$GARAGE_RPC_SECRET
    GARAGE_ADMIN_TOKEN=$GARAGE_ADMIN_TOKEN
    EOF
        chmod 0600 /etc/csfx/garage.env

        printf '%s' "$PG_SUPERUSER_PASSWORD"   > /etc/csfx/patroni-superuser-password
        printf '%s' "$PG_REPLICATION_PASSWORD" > /etc/csfx/patroni-replication-password
        chown root:patroni /etc/csfx/patroni-superuser-password /etc/csfx/patroni-replication-password
        chmod 0640 /etc/csfx/patroni-superuser-password /etc/csfx/patroni-replication-password

        touch "$DONE_FILE"
  '';

  mountScript = pkgs.writeShellScript "csfx-mount-data" ''
    set -euo pipefail

    PART="${cfg.dataPart}"
    MOUNT="/var/lib/csfx-data"

    if ${pkgs.util-linux}/bin/mountpoint -q "$MOUNT"; then
      exit 0
    fi

    mkdir -p "$MOUNT"
    ${pkgs.util-linux}/bin/mount "$PART" "$MOUNT"
    echo "[INFO] data partition mounted mount=''${MOUNT}"
  '';

  dataBindScript = pkgs.writeShellScript "csfx-data-binds" ''
    set -euo pipefail

    DATA="/var/lib/csfx-data"

    qemu_running() {
      [ -n "$(systemctl list-units --state=active --plain --no-legend 'csfx-qemu-*')" ]
    }

    guard_active() {
      if [ "$1" = "qemu" ]; then
        qemu_running
      else
        systemctl is-active --quiet "$1"
      fi
    }

    bind_to_data() {
      name="$1"
      dst="$2"
      owner="$3"
      shift 3
      src="$DATA/$name"

      mkdir -p "$src" "$dst"

      if mountpoint -q "$dst"; then
        return 0
      fi

      if [ -n "$(ls -A "$dst")" ]; then
        for guard in "$@"; do
          if guard_active "$guard"; then
            echo "[WARN] bind deferred until restart, workload active dst=$dst guard=$guard"
            return 0
          fi
        done
        cp -a "$dst"/. "$src"/
        find "$dst" -mindepth 1 -delete
        echo "[INFO] migrated existing data src=$src dst=$dst"
      else
        chown "$owner" "$src"
      fi

      mount --bind "$src" "$dst"
      echo "[INFO] bind mounted src=$src dst=$dst"
    }

    bind_to_data csfx-agent/qemu /var/lib/csfx-agent/qemu csfx-agent:csfx-agent csfx-agent.service qemu
    bind_to_data csfx-agent/rootfs /var/lib/csfx-agent/rootfs csfx-agent:csfx-agent csfx-agent.service qemu
    bind_to_data csfx-agent/firecracker /var/lib/csfx-agent/firecracker csfx-agent:csfx-agent csfx-agent.service qemu
    bind_to_data csfx-garage /var/lib/csfx-garage root:root garage.service
    bind_to_data csfx-registry-mirror /var/lib/private/csfx-registry-mirror root:root csfx-registry-mirror.service
    bind_to_data csfx-site-registry /var/lib/private/csfx-site-registry root:root csfx-site-registry.service
  '';

  agentRegistration = "/var/lib/csfx-agent/config.json";
  localAgentJoinEnv = "/run/csfx/local-agent-join.env";
  localJoinSkipPaths = map (lib.removePrefix "!") config.services.csfx-cp.controlPlaneConditions
    ++ [ agentRegistration "/etc/csfx/agent-join.env" ];

  localAgentJoinScript = pkgs.writeShellScript "csfx-local-agent-join" ''
    set -euo pipefail

    for path in ${lib.escapeShellArgs localJoinSkipPaths}; do
      if [ -e "$path" ]; then
        exit 0
      fi
    done

    set -a
    . ${config.services.csfx-cp.envFile}
    set +a

    output=$(${pkgs.coreutils}/bin/timeout 60 ${cfg.gatewayBinary} --local-join)
    case "$output" in
      join_string=csfx-join.*) ;;
      *)
        echo "[ERROR] local join string not issued"
        exit 1
        ;;
    esac

    ${pkgs.coreutils}/bin/mkdir -p "$(${pkgs.coreutils}/bin/dirname ${localAgentJoinEnv})"
    umask 0077
    printf 'CSFX_JOIN=%s\n' "''${output#join_string=}" > ${localAgentJoinEnv}.tmp
    ${pkgs.coreutils}/bin/mv ${localAgentJoinEnv}.tmp ${localAgentJoinEnv}
    echo "[INFO] founding node agent join issued file=${localAgentJoinEnv}"
  '';

in
{
  options.services.csfx-setup = {
    enable = lib.mkEnableOption "CSFX first-boot bootstrap";

    dataPart = lib.mkOption {
      type = lib.types.str;
      default = "/dev/sda3";
      description = "Partition device for persistent data (PostgreSQL, etcd, config). Must not be the boot partition.";
    };

    gatewayBinary = lib.mkOption {
      type = lib.types.str;
      default = "${config.services.csfx-cp.gatewayPackage}/bin/api-gateway";
      description = "API gateway binary that issues the founding node agent join ticket";
    };

    dataSize = lib.mkOption {
      type = lib.types.str;
      default = "100%";
      example = "50GiB";
      description = "Size of the data partition. Use '100%' to fill remaining disk space, or a fixed size like '20GiB'.";
    };
  };

  config = lib.mkIf cfg.enable {
    users = {
      mutableUsers = false;
      allowNoPasswordLogin = true;
      users.root.hashedPassword = "!";
    };

    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 8000 ];
    };

    environment.etc."profile.d/csfx-motd.sh".source = pkgs.writeShellScript "csfx-motd" ''
      printf 'Access this node only via the CSFX API or CLI.\n'
      printf "Run 'csfx-status' for control plane overview.\n\n"
    '';

    systemd.services = {
      csfx-disk-setup = {
        description = "CSFX first-boot disk partitioning and formatting";
        wantedBy = [ "multi-user.target" ];
        before = [ "csfx-mount-data.service" "patroni.service" "etcd.service" ];
        after = [ "local-fs.target" "${utils.escapeSystemdPath cfg.dataPart}.device" ];
        wants = [ "${utils.escapeSystemdPath cfg.dataPart}.device" ];
        unitConfig.StartLimitIntervalSec = 0;
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          Restart = "on-failure";
          RestartSec = "5s";
          ExecStart = diskSetupScript;
          User = "root";
        };
      };

      csfx-mount-data = {
        description = "CSFX mount persistent data partition";
        wantedBy = [ "multi-user.target" ];
        after = [ "csfx-disk-setup.service" ];
        requires = [ "csfx-disk-setup.service" ];
        before = [ "patroni.service" "etcd.service" "csfx-setup.service" ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = mountScript;
          User = "root";
        };
      };

      csfx-data-binds = {
        description = "CSFX bind large state directories onto the data partition";
        wantedBy = [ "multi-user.target" ];
        after = [ "csfx-mount-data.service" ];
        requires = [ "csfx-mount-data.service" ];
        before = [ "csfx-agent.service" "garage.service" "csfx-registry-mirror.service" "csfx-site-registry.service" ];
        path = [ pkgs.coreutils pkgs.util-linux pkgs.findutils pkgs.systemd ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = dataBindScript;
          User = "root";
        };
      };

      csfx-setup = {
        description = "CSFX first-boot bootstrap";
        wantedBy = [ "multi-user.target" ];
        after = [ "network-online.target" "csfx-mount-data.service" ];
        wants = [ "network-online.target" ];
        requires = [ "csfx-mount-data.service" ];
        before = [ "csfx-migrate.service" ];
        unitConfig.ConditionPathExists = config.services.csfx-cp.controlPlaneConditions;
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = setupScript;
          User = "root";
        };
      };

      csfx-agent.serviceConfig.ExecStartPre = [ "-+${localAgentJoinScript}" ];

      patroni = {
        after = [ "csfx-mount-data.service" ];
        requires = [ "csfx-mount-data.service" ];
      };

      csfx-cp-ready = {
        description = "CSFX Control Plane readiness check";
        wantedBy = [ "multi-user.target" ];
        after = [ "csfx-api-gateway.service" ];
        requires = [ "csfx-api-gateway.service" ];
        unitConfig.ConditionPathExists = config.services.csfx-cp.controlPlaneConditions;
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          TimeoutStartSec = 360;
          User = "root";
          ExecStart = pkgs.writeShellScript "csfx-cp-ready" ''
            set -euo pipefail

            CURL=${pkgs.curl}/bin/curl
            TIMEOUT=300
            ELAPSED=0

            while [ "$ELAPSED" -lt "$TIMEOUT" ]; do
              if "$CURL" -sfk https://localhost:8000/api/public-key > /dev/null 2>&1; then
                echo "[INFO] control plane ready port=8000"
                exit 0
              fi
              echo "[INFO] control plane not ready elapsed=''${ELAPSED}s timeout=''${TIMEOUT}s"
              sleep 5
              ELAPSED=$((ELAPSED + 5))
            done

            echo "[ERROR] control plane readiness timeout elapsed=''${TIMEOUT}s"
            exit 1
          '';
        };
      };
    };
  };
}

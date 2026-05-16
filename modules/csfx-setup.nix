{ config, lib, pkgs, versions, ... }:

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

  setupScript = pkgs.writeShellScript "csfx-setup" ''
    set -euo pipefail

    DONE_FILE="/var/lib/csfx-data/csfx/.setup-complete"
    ENV_FILE="/etc/csfx/cp.env"

    if [ -f "$DONE_FILE" ]; then
      exit 0
    fi

    mkdir -p /etc/csfx /var/lib/csfx

    JWT_SECRET=$(${pkgs.openssl}/bin/openssl rand -hex 32)
    DB_PASSWORD=$(${pkgs.openssl}/bin/openssl rand -hex 16)
    PG_SUPERUSER_PASSWORD=$(${pkgs.openssl}/bin/openssl rand -hex 16)
    PG_REPLICATION_PASSWORD=$(${pkgs.openssl}/bin/openssl rand -hex 16)

    cat > "$ENV_FILE" <<EOF
DATABASE_URL=postgres://csfx:$DB_PASSWORD@localhost:5432/csfx
JWT_SECRET=$JWT_SECRET
ETCD_ENDPOINTS=http://localhost:2379
EOF
    chmod 0600 "$ENV_FILE"

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

    ln -sfn "$MOUNT/postgresql" /var/lib/postgresql
    ln -sfn "$MOUNT/csfx" /var/lib/csfx-persistent
    ln -sfn "$MOUNT/csfx-updater" /var/lib/csfx-updater-data
  '';

  logo = ''
     ██████╗███████╗███████╗██╗  ██╗
    ██╔════╝██╔════╝██╔════╝╚██╗██╔╝
    ██║     ███████╗█████╗   ╚███╔╝
    ██║     ╚════██║██╔══╝   ██╔██╗
    ╚██████╗███████║██║     ██╔╝ ██╗
     ╚═════╝╚══════╝╚═╝     ╚═╝  ╚═╝
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

    dataSize = lib.mkOption {
      type = lib.types.str;
      default = "100%";
      example = "50GiB";
      description = "Size of the data partition. Use '100%' to fill remaining disk space, or a fixed size like '20GiB'.";
    };
  };

  config = lib.mkIf cfg.enable {
    services.openssh.enable = lib.mkForce false;

    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 8000 ];
    };

    environment.etc."issue".text = ''
      ${logo}
      CSFX Node — v${versions.csfx.version}

    '';

    environment.etc."motd".text = ''
      ${logo}
      CSFX Node — v${versions.csfx.version}
      Access this node only via the CSFX API or CLI.
      Run 'csfx-status' for control plane overview.

    '';

    systemd.services = {
      csfx-disk-setup = {
        description = "CSFX first-boot disk partitioning and formatting";
        wantedBy = [ "multi-user.target" ];
        before = [ "csfx-mount-data.service" "patroni.service" "etcd.service" ];
        after = [ "local-fs.target" ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
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

      csfx-setup = {
        description = "CSFX first-boot bootstrap";
        wantedBy = [ "multi-user.target" ];
        after = [ "network-online.target" "csfx-mount-data.service" ];
        wants = [ "network-online.target" ];
        requires = [ "csfx-mount-data.service" ];
        before = [ "csfx-migrate.service" ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = setupScript;
          User = "root";
        };
      };

      patroni = {
        after = [ "csfx-mount-data.service" ];
        requires = [ "csfx-mount-data.service" ];
      };

      csfx-cp-ready = {
        description = "CSFX Control Plane readiness check";
        wantedBy = [ "multi-user.target" ];
        after = [ "csfx-api-gateway.service" ];
        requires = [ "csfx-api-gateway.service" ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          User = "root";
          ExecStart = pkgs.writeShellScript "csfx-cp-ready" ''
            set -euo pipefail

            CURL=${pkgs.curl}/bin/curl
            TIMEOUT=120
            ELAPSED=0

            while [ "$ELAPSED" -lt "$TIMEOUT" ]; do
              if "$CURL" -sf http://localhost:8000/api/public-key > /dev/null 2>&1; then
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

      "getty@tty1" = {
        after = [ "csfx-cp-ready.service" ];
        wants = [ "csfx-cp-ready.service" ];
      };
    };
  };
}

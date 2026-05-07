{ config, lib, pkgs, versions, ... }:

let
  cfg = config.services.csfx-setup;

  setupScript = pkgs.writeShellScript "csfx-setup" ''
    set -euo pipefail

    DONE_FILE="/var/lib/csfx/.setup-complete"
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

    systemd.services.csfx-setup = {
      description = "CSFX first-boot bootstrap";
      wantedBy = [ "multi-user.target" ];
      after    = [ "network-online.target" ];
      wants    = [ "network-online.target" ];
      before   = [ "csfx-migrate.service" ];

      serviceConfig = {
        Type             = "oneshot";
        RemainAfterExit  = true;
        ExecStart        = setupScript;
        User             = "root";
      };
    };

    systemd.services.csfx-cp-ready = {
      description = "CSFX Control Plane readiness check";
      wantedBy = [ "multi-user.target" ];
      after    = [ "csfx-api-gateway.service" ];
      requires = [ "csfx-api-gateway.service" ];

      serviceConfig = {
        Type             = "oneshot";
        RemainAfterExit  = true;
        User             = "root";
        ExecStart        = pkgs.writeShellScript "csfx-cp-ready" ''
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

    systemd.services."getty@tty1" = {
      after = [ "csfx-cp-ready.service" ];
      wants = [ "csfx-cp-ready.service" ];
    };
  };
}

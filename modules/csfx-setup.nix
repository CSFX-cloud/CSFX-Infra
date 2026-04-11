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

    cat > "$ENV_FILE" <<EOF
DATABASE_URL=postgres://csfx:csfx@localhost/csfx
JWT_SECRET=$JWT_SECRET
ETCD_ENDPOINTS=http://localhost:2379
SCHEDULER_SERVICE_URL=http://localhost:8002
VOLUME_MANAGER_URL=http://localhost:8003
FAILOVER_CONTROLLER_URL=http://localhost:8004
SDN_CONTROLLER_URL=http://localhost:8005
REGISTRY_SERVICE_URL=http://localhost:8001
EOF
    chmod 0600 "$ENV_FILE"

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
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = lib.mkForce "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };

    environment.etc."issue".text = ''
      ${logo}
      CSFX Node — v${versions.csfx.version}

    '';

    environment.etc."motd".text = ''
      ${logo}
      CSFX Node — v${versions.csfx.version}
      Access this node only via the CSFX API or CLI.

    '';

    systemd.services.csfx-setup = {
      description = "CSFX first-boot bootstrap";
      wantedBy = [ "multi-user.target" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      before = [ "csfx-daemon.service" ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = setupScript;
        User = "root";
      };
    };

    systemd.services.csfx-cp = {
      description = "CSFX Control Plane (Docker Compose)";
      wantedBy = [ "multi-user.target" ];
      after = [ "docker.service" "csfx-setup.service" ];
      requires = [ "docker.service" ];
      wants = [ "csfx-setup.service" ];
      unitConfig.ConditionPathExists = "/var/lib/csfx/.setup-complete";

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        EnvironmentFile = "/etc/csfx/cp.env";
        ExecStart = "${pkgs.docker-compose}/bin/docker-compose -f /etc/csfx/docker-compose.yml up -d";
        ExecStop = "${pkgs.docker-compose}/bin/docker-compose -f /etc/csfx/docker-compose.yml down";
        User = "root";
      };
    };

    systemd.services.csfx-cp-ready = {
      description = "CSFX Control Plane readiness check";
      wantedBy = [ "multi-user.target" ];
      after = [ "csfx-cp.service" ];
      requires = [ "csfx-cp.service" ];

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

    systemd.services."getty@tty1" = {
      after = [ "csfx-cp-ready.service" ];
      wants = [ "csfx-cp-ready.service" ];
    };

    virtualisation.docker.enable = true;

    environment.systemPackages = [ pkgs.docker-compose ];
  };
}

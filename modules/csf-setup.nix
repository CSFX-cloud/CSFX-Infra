{ config, lib, pkgs, versions, ... }:

let
  cfg = config.services.csf-setup;

  setupScript = pkgs.writeShellScript "csf-setup" ''
    set -euo pipefail

    DONE_FILE="/var/lib/csf/.setup-complete"
    ENV_FILE="/etc/csf/cp.env"

    if [ -f "$DONE_FILE" ]; then
      exit 0
    fi

    mkdir -p /etc/csf /var/lib/csf

    JWT_SECRET=$(${pkgs.openssl}/bin/openssl rand -hex 32)

    cat > "$ENV_FILE" <<EOF
DATABASE_URL=postgres://csf:csf@localhost/csf
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
  options.services.csf-setup = {
    enable = lib.mkEnableOption "CSF first-boot bootstrap";
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
      CSF Node — v${versions.csf.version}

    '';

    environment.etc."motd".text = ''
      ${logo}
      CSF Node — v${versions.csf.version}
      Access this node only via the CSF API or CLI.

    '';

    systemd.services.csf-setup = {
      description = "CSF first-boot bootstrap";
      wantedBy = [ "multi-user.target" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      before = [ "csf-daemon.service" ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = setupScript;
        User = "root";
      };
    };

    systemd.services.csf-cp = {
      description = "CSF Control Plane (Docker Compose)";
      wantedBy = [ "multi-user.target" ];
      after = [ "docker.service" "csf-setup.service" ];
      requires = [ "docker.service" ];
      wants = [ "csf-setup.service" ];
      unitConfig.ConditionPathExists = "/var/lib/csf/.setup-complete";

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        EnvironmentFile = "/etc/csf/cp.env";
        ExecStart = "${pkgs.docker-compose}/bin/docker-compose -f /etc/csf/docker-compose.yml up -d";
        ExecStop = "${pkgs.docker-compose}/bin/docker-compose -f /etc/csf/docker-compose.yml down";
        User = "root";
      };
    };

    systemd.services.csf-cp-ready = {
      description = "CSF Control Plane readiness check";
      wantedBy = [ "multi-user.target" ];
      after = [ "csf-cp.service" ];
      requires = [ "csf-cp.service" ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        User = "root";
        StandardOutput = "journal+console";
        StandardError = "journal+console";
        ExecStart = pkgs.writeShellScript "csf-cp-ready" ''
          set -euo pipefail

          CURL=${pkgs.curl}/bin/curl
          TIMEOUT=120
          ELAPSED=0

          while [ "$ELAPSED" -lt "$TIMEOUT" ]; do
            if "$CURL" -sf http://localhost:8000/api/public-key > /dev/null 2>&1; then
              IP=$(${pkgs.iproute2}/bin/ip route get 1.1.1.1 2>/dev/null | awk '/src/{print $7; exit}' || true)
              echo "[INFO] csf control plane ready host=$IP port=8000"
              exit 0
            fi

            echo "[INFO] csf control plane not ready elapsed=''${ELAPSED}s timeout=''${TIMEOUT}s"
            sleep 5
            ELAPSED=$((ELAPSED + 5))
          done

          echo "[ERROR] csf control plane readiness timeout elapsed=''${TIMEOUT}s"
          exit 1
        '';
      };
    };

    virtualisation.docker.enable = true;

    environment.systemPackages = [ pkgs.docker-compose ];
  };
}

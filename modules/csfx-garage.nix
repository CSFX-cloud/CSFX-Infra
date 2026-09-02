{ config, lib, pkgs, ... }:

let
  cfg = config.services.csfx-garage;
in
{
  options.services.csfx-garage = {
    enable = lib.mkEnableOption "CSFX Garage object storage node";

    zone = lib.mkOption {
      type = lib.types.str;
      default = config.networking.hostName;
      description = "Garage cluster layout zone for this node";
    };

    capacityBytes = lib.mkOption {
      type = lib.types.nullOr lib.types.ints.positive;
      default = null;
      description = "Storage capacity in bytes to contribute to the Garage layout. Leave null for a gateway-only node (serves the S3 API but stores no data).";
    };

    dataDir = lib.mkOption {
      type = lib.types.path;
      default = "/var/lib/csfx-garage/data";
      description = "Directory Garage stores object data in";
    };

    metadataDir = lib.mkOption {
      type = lib.types.path;
      default = "/var/lib/csfx-garage/meta";
      description = "Directory Garage stores its metadata database in. Should be on fast (SSD) storage.";
    };

    s3BindAddr = lib.mkOption {
      type = lib.types.str;
      default = "0.0.0.0:3900";
      description = "Bind address for the S3 API listener";
    };

    adminBindAddr = lib.mkOption {
      type = lib.types.str;
      default = "127.0.0.1:3903";
      description = "Bind address for the Garage admin API, used by the CSFX object-storage control-plane service";
    };

    secretsFile = lib.mkOption {
      type = lib.types.path;
      default = "/etc/csfx/garage.env";
      description = "EnvironmentFile providing GARAGE_RPC_SECRET and GARAGE_ADMIN_TOKEN";
    };
  };

  config = lib.mkIf cfg.enable {
    services.garage = {
      enable = true;
      package = pkgs.garage_1;
      environmentFile = cfg.secretsFile;
      settings = {
        data_dir = cfg.dataDir;
        metadata_dir = cfg.metadataDir;
        db_engine = "lmdb";
        replication_factor = 3;
        compression_level = 1;

        rpc_bind_addr = "0.0.0.0:3901";
        rpc_public_addr = "127.0.0.1:3901";

        s3_api = {
          s3_region = "csfx";
          api_bind_addr = cfg.s3BindAddr;
          root_domain = "";
        };

        admin = {
          api_bind_addr = cfg.adminBindAddr;
        };
      };
    };

    systemd.services.garage = {
      after = [ "csfx-agent.service" "csfx-setup.service" ];
      requires = [ "csfx-agent.service" "csfx-setup.service" ];
      serviceConfig = {
        RuntimeDirectory = "csfx-garage";
        ExecStartPre = [
          (pkgs.writeShellScript "csfx-garage-set-rpc-addr" ''
            set -euo pipefail

            IFACE="wgmgmt0"
            RUNTIME_CONFIG="''${RUNTIME_DIRECTORY}/garage.toml"
            TIMEOUT=60
            ELAPSED=0

            while ! ${pkgs.iproute2}/bin/ip -4 addr show dev "$IFACE" 2>/dev/null | ${pkgs.gnugrep}/bin/grep -q inet; do
              if [ "$ELAPSED" -ge "$TIMEOUT" ]; then
                echo "[ERROR] wgmgmt0 has no address after timeout elapsed=''${TIMEOUT}s"
                exit 1
              fi
              sleep 1
              ELAPSED=$((ELAPSED + 1))
            done

            TUNNEL_IP=$(${pkgs.iproute2}/bin/ip -4 addr show dev "$IFACE" \
              | ${pkgs.gnugrep}/bin/grep -oP '(?<=inet\s)\d+(\.\d+){3}')

            ${pkgs.gnused}/bin/sed \
              "s|^rpc_public_addr = .*|rpc_public_addr = \"''${TUNNEL_IP}:3901\"|" \
              /etc/garage.toml > "$RUNTIME_CONFIG"

            echo "[INFO] garage rpc_public_addr set tunnel_ip=''${TUNNEL_IP}"
          '')
        ];
        ExecStart = lib.mkForce "${config.services.garage.package}/bin/garage -c /run/csfx-garage/garage.toml server";
      };
    };

    networking.firewall.interfaces."wgmgmt0".allowedTCPPorts = [ 3901 3903 ];
  };
}

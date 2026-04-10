{ config, lib, pkgs, ... }:

let
  cfg = config.services.csf-binary-cache;
in
{
  options.services.csf-binary-cache = {
    enable = lib.mkEnableOption "CSF Harmonia binary cache";

    port = lib.mkOption {
      type = lib.types.port;
      default = 5000;
      description = "Port for the Harmonia binary cache HTTP server";
    };

    secretKeyFile = lib.mkOption {
      type = lib.types.str;
      default = "/etc/nix/csf-cache-key.sec";
      description = "Path to the Nix signing private key";
    };

    publicKeyFile = lib.mkOption {
      type = lib.types.str;
      default = "/etc/nix/csf-cache-key.pub";
      description = "Path to the Nix signing public key";
    };
  };

  config = lib.mkIf cfg.enable {
    services.harmonia = {
      enable = true;
      signKeyPaths = [ cfg.secretKeyFile ];
      settings.bind = "0.0.0.0:${toString cfg.port}";
    };

    systemd.services.csf-cache-keygen = {
      description = "Generate CSF Nix binary cache signing key if missing";
      wantedBy = [ "multi-user.target" ];
      before = [ "harmonia.service" ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = pkgs.writeShellScript "csf-cache-keygen" ''
          set -euo pipefail

          SEC="${cfg.secretKeyFile}"
          PUB="${cfg.publicKeyFile}"

          if [ -f "$SEC" ] && [ -f "$PUB" ]; then
            exit 0
          fi

          mkdir -p "$(dirname "$SEC")"
          ${pkgs.nix}/bin/nix-store --generate-binary-cache-key csf-cp-1 "$SEC" "$PUB"
          chmod 0400 "$SEC"
          chmod 0444 "$PUB"
        '';
        User = "root";
      };
    };

    systemd.services.harmonia = {
      after = [ "csf-cache-keygen.service" ];
      requires = [ "csf-cache-keygen.service" ];
    };

    networking.firewall.allowedTCPPorts = [ cfg.port ];
  };
}

{ config, lib, pkgs, versions, ... }:

let
  cfg = config.services.csfx-agent;
  arch = if pkgs.stdenv.isAarch64 then "arm64" else "amd64";
  agentSrc = pkgs.fetchurl {
    inherit (versions.csfx.agent.${arch}) url sha256;
  };

  agentBin = pkgs.runCommand "csfx-agent" { } ''
    mkdir -p $out/bin
    cp ${agentSrc} $out/bin/csfx-agent
    chmod +x $out/bin/csfx-agent
  '';
in
{
  options.services.csfx-agent = {
    enable = lib.mkEnableOption "CSFX agent daemon";

    gatewayUrl = lib.mkOption {
      type = lib.types.str;
      description = "URL of the CSFX API gateway";
    };

    heartbeatInterval = lib.mkOption {
      type = lib.types.int;
      default = 60;
      description = "Heartbeat interval in seconds";
    };

    registrationToken = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Pre-registration token (leave empty to use bootstrap token)";
    };
  };

  config = lib.mkIf cfg.enable {
    users = {
      users = {
        csfx-agent = {
          isSystemUser = true;
          group = "csfx-agent";
          home = "/var/lib/csfx-agent";
          createHome = true;
        };
        csfx-updater = {
          isSystemUser = true;
          group = "csfx-updater";
          home = "/var/lib/csfx-updater";
          createHome = true;
        };
      };
      groups = {
        csfx-agent = { };
        csfx-updater = { };
      };
    };

    systemd = {
      tmpfiles.rules = [
        "d /var/lib/csfx-agent 0750 csfx-agent csfx-agent -"
        "d /var/lib/csfx-updater 0750 csfx-updater csfx-updater -"
        "f /var/lib/csfx/update_trigger 0660 csfx-agent csfx-updater -"
        "d /var/lib/csfx 0750 csfx-agent csfx-updater -"
      ];
      services.csfx-agent = {
        description = "CSFX Agent";
        wantedBy = [ "multi-user.target" ];
        after = [ "network-online.target" "csfx-cp-ready.service" ];
        wants = [ "network-online.target" ];
        requires = [ "csfx-cp-ready.service" ];

        serviceConfig = {
          ExecStart = "${agentBin}/bin/csfx-agent";
          User = "csfx-agent";
          Group = "csfx-agent";
          Restart = "on-failure";
          RestartSec = "10s";
          PrivateTmp = true;
          ProtectSystem = "strict";
          ReadWritePaths = [ "/var/lib/csfx-agent" "/var/lib/csfx" ];
          NoNewPrivileges = true;
          CapabilityBoundingSet = "";
        };

        environment = {
          CSFX_GATEWAY_URL = cfg.gatewayUrl;
          CSFX_HEARTBEAT_INTERVAL = toString cfg.heartbeatInterval;
        } // lib.optionalAttrs (cfg.registrationToken != "") {
          CSFX_REGISTRATION_TOKEN = cfg.registrationToken;
        };
      };
    };
  };
}

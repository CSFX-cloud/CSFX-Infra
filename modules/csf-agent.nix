{ config, lib, pkgs, versions, ... }:

let
  cfg = config.services.csf-agent;
  arch = if pkgs.stdenv.isAarch64 then "arm64" else "amd64";
  agentPkg = pkgs.fetchurl {
    url = versions.csf.agent.${arch}.url;
    sha256 = versions.csf.agent.${arch}.sha256;
  };
in
{
  options.services.csf-agent = {
    enable = lib.mkEnableOption "CSF agent daemon";

    gatewayUrl = lib.mkOption {
      type = lib.types.str;
      description = "URL of the CSF API gateway";
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
    users.users.csf-agent = {
      isSystemUser = true;
      group = "csf-agent";
      home = "/var/lib/csf-daemon";
      createHome = true;
    };

    users.groups.csf-agent = {};
    users.groups.csf-updater = {};

    systemd.tmpfiles.rules = [
      "d /var/lib/csf-daemon 0750 csf-agent csf-agent -"
      "f /var/lib/csf/update_trigger 0660 csf-agent csf-updater -"
      "d /var/lib/csf 0750 csf-agent csf-updater -"
    ];

    systemd.services.csf-daemon = {
      description = "CSF Agent Daemon";
      wantedBy = [ "multi-user.target" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];

      serviceConfig = {
        ExecStart = "${agentPkg}/bin/csf-agent";
        User = "csf-agent";
        Group = "csf-agent";
        Restart = "on-failure";
        RestartSec = "10s";
        PrivateTmp = true;
        ProtectSystem = "strict";
        ReadWritePaths = [ "/var/lib/csf-daemon" "/var/lib/csf" ];
        NoNewPrivileges = true;
        CapabilityBoundingSet = "";
      };

      environment = {
        CSF_GATEWAY_URL = cfg.gatewayUrl;
        CSF_HEARTBEAT_INTERVAL = toString cfg.heartbeatInterval;
        CSF_REGISTRATION_TOKEN = cfg.registrationToken;
      };
    };
  };
}

{ config, lib, pkgs, ... }:

let
  cfg = config.services.csfx-registry-mirror;
  zot = pkgs.callPackage ../pkgs/zot.nix { };

  zotConfig = {
    distSpecVersion = "1.1.0";
    storage.rootDirectory = cfg.storagePath;
    http = {
      address = "0.0.0.0";
      port = builtins.toString cfg.port;
    };
    log.level = "info";
    extensions.sync = {
      enable = true;
      registries = [
        {
          urls = [ cfg.remoteUrl ];
          onDemand = true;
          tlsVerify = true;
          maxRetries = 6;
          retryDelay = "5m";
        }
      ];
    };
  };

  zotConfigFile = pkgs.writeText "zot-config.json" (builtins.toJSON zotConfig);
in
{
  options.services.csfx-registry-mirror = {
    enable = lib.mkEnableOption "CSFX OCI registry pull-through cache";

    port = lib.mkOption {
      type = lib.types.port;
      default = 5050;
      description = "Port for the registry mirror HTTP server";
    };

    remoteUrl = lib.mkOption {
      type = lib.types.str;
      default = "https://index.docker.io";
      description = "Upstream registry the mirror proxies and caches images from";
    };

    storagePath = lib.mkOption {
      type = lib.types.str;
      default = "/var/lib/csfx-registry-mirror";
      description = "Directory used to store cached image layers";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.csfx-registry-mirror = {
      description = "CSFX OCI registry pull-through cache (zot)";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      serviceConfig = {
        ExecStart = "${lib.getExe zot} serve ${zotConfigFile}";
        Restart = "on-failure";
        RestartSec = "5s";
        DynamicUser = true;
        StateDirectory = "csfx-registry-mirror";
      };
    };

    networking.firewall.allowedTCPPorts = [ cfg.port ];
  };
}

{ config, lib, pkgs, ... }:

let
  cfg = config.services.csfx-registry-mirror;
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
      default = "https://registry-1.docker.io";
      description = "Upstream registry the mirror proxies and caches images from";
    };

    storagePath = lib.mkOption {
      type = lib.types.str;
      default = "/var/lib/csfx-registry-mirror";
      description = "Directory used to store cached image layers";
    };

    ttl = lib.mkOption {
      type = lib.types.str;
      default = "168h";
      description = "How long a cached blob is kept before it is refetched from upstream";
    };
  };

  config = lib.mkIf cfg.enable {
    services.dockerRegistry = {
      enable = true;
      listenAddress = "0.0.0.0";
      port = cfg.port;
      storagePath = cfg.storagePath;
      enableGarbageCollect = true;
      extraConfig = {
        proxy = {
          remoteurl = cfg.remoteUrl;
          ttl = cfg.ttl;
        };
      };
    };

    networking.firewall.allowedTCPPorts = [ cfg.port ];
  };
}

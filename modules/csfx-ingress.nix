{ config, lib, ... }:

let
  cfg = config.services.csfx-ingress;
  cp = config.services.csfx-cp;
  certResolver = "letsencrypt";
  acmeStorage = "${config.services.traefik.dataDir}/acme.json";
in
{
  options.services.csfx-ingress = {
    enable = lib.mkEnableOption "CSFX ingress, a Traefik instance that follows the ingress routes stored in etcd";

    acmeEmail = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      example = "admin@example.com";
      description = ''
        Registers a Lets Encrypt resolver using the HTTP challenge, null serves the Traefik default certificate.
        Every master keeps its own certificate store, so only the master that holds the floating address obtains certificates.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ 80 443 ];

    services.traefik = {
      enable = true;
      staticConfigOptions = {
        log.level = "INFO";
        entryPoints = {
          web.address = ":80";
          websecure.address = ":443";
        };
        providers.etcd = {
          endpoints = [ "127.0.0.1:2379" ];
          rootKey = "traefik";
        };
      } // lib.optionalAttrs (cfg.acmeEmail != null) {
        certificatesResolvers.${certResolver}.acme = {
          email = cfg.acmeEmail;
          storage = acmeStorage;
          httpChallenge.entryPoint = "web";
        };
      };
    };

    systemd.services = {
      traefik = {
        after = [ "etcd.service" ];
        wants = [ "etcd.service" ];
        unitConfig.ConditionPathExists = cp.controlPlaneConditions;
      };

      csfx-api-gateway.environment = lib.mkIf (cfg.acmeEmail != null) {
        INGRESS_CERT_RESOLVER = certResolver;
      };
    };
  };
}

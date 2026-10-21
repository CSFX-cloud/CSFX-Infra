{ config, lib, ... }:

let
  cfg = config.services.csfx-ingress;
  cp = config.services.csfx-cp;
  vipAddress = config.services.csfx-cluster.vip.address;
  certResolver = "letsencrypt";
  acmeStorage = "${config.services.traefik.dataDir}/acme.json";
  corefile = ''
    ${cfg.localZone}:53 {
      bind ${lib.concatStringsSep " " cfg.dnsListenAddresses}
      etcd ${cfg.localZone} {
        path /skydns
        endpoint http://127.0.0.1:2379
      }
      cache 10
      errors
    }
  '';
in
{
  options.services.csfx-ingress = {
    enable = lib.mkEnableOption "CSFX ingress, the platform Traefik and a CoreDNS that serves the local zone from etcd";

    localZone = lib.mkOption {
      type = lib.types.str;
      default = "csfx.internal";
      example = "csfx.internal";
      description = ''
        DNS zone that CoreDNS serves from the records the control plane keeps in etcd, gateway endpoints and routes inside the zone resolve to the agent running the gateway.
        Avoid the local suffix, it is reserved for multicast DNS.
      '';
    };

    dnsListenAddresses = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ "127.0.0.1" ] ++ lib.optional (vipAddress != null) vipAddress;
      defaultText = lib.literalExpression ''[ "127.0.0.1" ] ++ the floating address when one is configured'';
      example = [ "127.0.0.1" "192.168.1.50" "eth0" ];
      description = "Addresses or interface names CoreDNS binds. Never use a wildcard address on a host that also runs an agent, the per resource group resolvers bind their own gateway address on port 53 and fail while the wildcard is taken.";
    };

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
    networking.firewall = {
      allowedTCPPorts = [ 53 80 443 ];
      allowedUDPPorts = [ 53 ];
    };

    boot.kernel.sysctl."net.ipv4.ip_nonlocal_bind" = 1;

    services.coredns = {
      enable = true;
      config = corefile;
    };

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

      coredns = {
        after = [ "etcd.service" "network-online.target" ];
        wants = [ "etcd.service" "network-online.target" ];
        unitConfig.ConditionPathExists = cp.controlPlaneConditions;
      };

      csfx-api-gateway.environment = {
        CSFX_LOCAL_ZONE = cfg.localZone;
        CSFX_LOCAL_DNS_ADDRESSES = lib.concatStringsSep "," (lib.filter (address: address != "127.0.0.1" && address != "0.0.0.0") cfg.dnsListenAddresses);
      } // lib.optionalAttrs (cfg.acmeEmail != null) {
        INGRESS_CERT_RESOLVER = certResolver;
        INGRESS_ACME_EMAIL = cfg.acmeEmail;
      };
    };
  };
}

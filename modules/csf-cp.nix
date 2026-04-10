{ config, lib, pkgs, versions, ... }:

let
  cfg = config.services.csf-cp;
  v = versions.csf;
  ghcrOrg = "csfx-cloud";
  imageRef = svc: "ghcr.io/${ghcrOrg}/csf-ce-${svc}@${v.images.${svc}.digest}";
in
{
  options.services.csf-cp = {
    enable = lib.mkEnableOption "CSF control plane";

    etcdEndpoints = lib.mkOption {
      type = lib.types.str;
      default = "http://etcd:2379";
    };

    dbUrl = lib.mkOption {
      type = lib.types.str;
      description = "PostgreSQL connection URL";
    };

    jwtSecret = lib.mkOption {
      type = lib.types.str;
      description = "JWT signing secret";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.oci-containers.backend = "docker";

    virtualisation.oci-containers.containers = {
      csf-api-gateway = {
        image = imageRef "api-gateway";
        ports = [ "8000:8000" ];
        environment = {
          DATABASE_URL = cfg.dbUrl;
          ETCD_ENDPOINTS = cfg.etcdEndpoints;
          JWT_SECRET = cfg.jwtSecret;
          SCHEDULER_SERVICE_URL = "http://csf-scheduler:8002";
          VOLUME_MANAGER_URL = "http://csf-volume-manager:8003";
          FAILOVER_CONTROLLER_URL = "http://csf-failover-controller:8004";
          SDN_CONTROLLER_URL = "http://csf-sdn-controller:8005";
          REGISTRY_SERVICE_URL = "http://csf-registry:8001";
        };
        extraOptions = [ "--network=csf" ];
      };

      csf-registry = {
        image = imageRef "registry";
        ports = [ "8001:8001" ];
        environment = {
          DATABASE_URL = cfg.dbUrl;
          ETCD_ENDPOINTS = cfg.etcdEndpoints;
        };
        extraOptions = [ "--network=csf" ];
      };

      csf-scheduler = {
        image = imageRef "scheduler";
        ports = [ "8002:8002" ];
        environment = {
          DATABASE_URL = cfg.dbUrl;
          ETCD_ENDPOINTS = cfg.etcdEndpoints;
        };
        extraOptions = [ "--network=csf" ];
      };

      csf-volume-manager = {
        image = imageRef "volume-manager";
        ports = [ "8003:8003" ];
        environment = {
          DATABASE_URL = cfg.dbUrl;
          ETCD_ENDPOINTS = cfg.etcdEndpoints;
        };
        extraOptions = [ "--network=csf" ];
      };

      csf-failover-controller = {
        image = imageRef "failover-controller";
        ports = [ "8004:8004" ];
        environment = {
          DATABASE_URL = cfg.dbUrl;
          ETCD_ENDPOINTS = cfg.etcdEndpoints;
          SCHEDULER_SERVICE_URL = "http://csf-scheduler:8002";
          VOLUME_MANAGER_URL = "http://csf-volume-manager:8003";
        };
        extraOptions = [ "--network=csf" ];
      };

      csf-sdn-controller = {
        image = imageRef "sdn-controller";
        ports = [ "8005:8005" ];
        environment = {
          DATABASE_URL = cfg.dbUrl;
          ETCD_ENDPOINTS = cfg.etcdEndpoints;
        };
        extraOptions = [ "--network=csf" ];
      };
    };
  };
}

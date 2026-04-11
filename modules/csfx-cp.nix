{ config, lib, pkgs, versions, ... }:

let
  cfg = config.services.csfx-cp;
  v = versions.csfx;
  ghcrOrg = "csfx-cloud";
  imageRef = svc: "ghcr.io/${ghcrOrg}/csfx-ce-${svc}@${v.images.${svc}.digest}";
in
{
  options.services.csfx-cp = {
    enable = lib.mkEnableOption "CSFX control plane";

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
      csfx-api-gateway = {
        image = imageRef "api-gateway";
        ports = [ "8000:8000" ];
        environment = {
          DATABASE_URL = cfg.dbUrl;
          ETCD_ENDPOINTS = cfg.etcdEndpoints;
          JWT_SECRET = cfg.jwtSecret;
          SCHEDULER_SERVICE_URL = "http://csfx-scheduler:8002";
          VOLUME_MANAGER_URL = "http://csfx-volume-manager:8003";
          FAILOVER_CONTROLLER_URL = "http://csfx-failover-controller:8004";
          SDN_CONTROLLER_URL = "http://csfx-sdn-controller:8005";
          REGISTRY_SERVICE_URL = "http://csfx-registry:8001";
        };
        extraOptions = [ "--network=csfx" ];
      };

      csfx-registry = {
        image = imageRef "registry";
        ports = [ "8001:8001" ];
        environment = {
          DATABASE_URL = cfg.dbUrl;
          ETCD_ENDPOINTS = cfg.etcdEndpoints;
        };
        extraOptions = [ "--network=csfx" ];
      };

      csfx-scheduler = {
        image = imageRef "scheduler";
        ports = [ "8002:8002" ];
        environment = {
          DATABASE_URL = cfg.dbUrl;
          ETCD_ENDPOINTS = cfg.etcdEndpoints;
        };
        extraOptions = [ "--network=csfx" ];
      };

      csfx-volume-manager = {
        image = imageRef "volume-manager";
        ports = [ "8003:8003" ];
        environment = {
          DATABASE_URL = cfg.dbUrl;
          ETCD_ENDPOINTS = cfg.etcdEndpoints;
        };
        extraOptions = [ "--network=csfx" ];
      };

      csfx-failover-controller = {
        image = imageRef "failover-controller";
        ports = [ "8004:8004" ];
        environment = {
          DATABASE_URL = cfg.dbUrl;
          ETCD_ENDPOINTS = cfg.etcdEndpoints;
          SCHEDULER_SERVICE_URL = "http://csfx-scheduler:8002";
          VOLUME_MANAGER_URL = "http://csfx-volume-manager:8003";
        };
        extraOptions = [ "--network=csfx" ];
      };

      csfx-sdn-controller = {
        image = imageRef "sdn-controller";
        ports = [ "8005:8005" ];
        environment = {
          DATABASE_URL = cfg.dbUrl;
          ETCD_ENDPOINTS = cfg.etcdEndpoints;
        };
        extraOptions = [ "--network=csfx" ];
      };
    };
  };
}

{ config, lib, pkgs, versions, ... }:

let
  cfg = config.services.csfx-cp;
  v = versions.csfx;
  cp = v.controlPlane;

  arch = if pkgs.stdenv.hostPlatform.system == "aarch64-linux" then "arm64" else "amd64";

  fetchBin = name: entry:
    pkgs.fetchurl {
      url = entry.${arch}.url;
      sha256 = entry.${arch}.sha256;
    };

  mkBin = name: entry:
    pkgs.stdenv.mkDerivation {
      pname = name;
      version = v.version;
      src = fetchBin name entry;
      dontUnpack = true;
      installPhase = ''
        install -Dm755 $src $out/bin/${name}
      '';
    };

  migrateBin = mkBin "csfx-migrate" cp.migrate;
  gatewayBin = mkBin "api-gateway" cp."api-gateway";
  registryBin = mkBin "registry" cp.registry;
  schedulerBin = mkBin "scheduler" cp.scheduler;
  volumeManagerBin = mkBin "volume-manager" cp."volume-manager";
  failoverBin = mkBin "failover-controller" cp."failover-controller";
  sdnBin = mkBin "sdn-controller" cp."sdn-controller";

  commonEnv = {
    DATABASE_URL = cfg.dbUrl;
    ETCD_ENDPOINTS = cfg.etcdEndpoints;
  };

  mkService = { description, bin, binName, extraEnv ? {}, after ? [], requires ? [] }:
    {
      inherit description;
      after = [ "network.target" "etcd.service" ] ++ after;
      requires = requires;
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = "${bin}/bin/${binName}";
        Restart = "on-failure";
        RestartSec = "5s";
        DynamicUser = true;
        EnvironmentFile = cfg.envFile;
      };
      environment = commonEnv // extraEnv;
    };
in
{
  options.services.csfx-cp = {
    enable = lib.mkEnableOption "CSFX control plane";

    dbUrl = lib.mkOption {
      type = lib.types.str;
      description = "PostgreSQL connection URL";
    };

    etcdEndpoints = lib.mkOption {
      type = lib.types.str;
      default = "http://localhost:2379";
    };

    envFile = lib.mkOption {
      type = lib.types.path;
      default = "/etc/csfx/cp.env";
      description = "Path to environment file with secrets (DATABASE_URL, JWT_SECRET, etc.)";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.csfx-migrate = {
      description = "CSFX database migration";
      after = [ "network.target" "patroni.service" ];
      requires = [ "patroni.service" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${migrateBin}/bin/csfx-migrate";
        EnvironmentFile = cfg.envFile;
      };
      environment = commonEnv;
    };

    systemd.services.csfx-api-gateway = mkService {
      description = "CSFX API Gateway";
      bin = gatewayBin;
      binName = "api-gateway";
      after = [ "csfx-migrate.service" ];
      requires = [ "csfx-migrate.service" ];
      extraEnv = {
        SCHEDULER_SERVICE_URL = "http://localhost:8002";
        VOLUME_MANAGER_URL = "http://localhost:8003";
        FAILOVER_CONTROLLER_URL = "http://localhost:8004";
        SDN_CONTROLLER_URL = "http://localhost:8005";
        REGISTRY_SERVICE_URL = "http://localhost:8001";
      };
    };

    systemd.services.csfx-registry = mkService {
      description = "CSFX Registry";
      bin = registryBin;
      binName = "registry";
      after = [ "csfx-migrate.service" ];
      requires = [ "csfx-migrate.service" ];
      extraEnv = {
        SCHEDULER_SERVICE_URL = "http://localhost:8002";
        API_GATEWAY_URL = "http://localhost:8000";
      };
    };

    systemd.services.csfx-scheduler = mkService {
      description = "CSFX Scheduler";
      bin = schedulerBin;
      binName = "scheduler";
      after = [ "csfx-migrate.service" ];
      requires = [ "csfx-migrate.service" ];
    };

    systemd.services.csfx-volume-manager = mkService {
      description = "CSFX Volume Manager";
      bin = volumeManagerBin;
      binName = "volume-manager";
      after = [ "csfx-migrate.service" ];
      requires = [ "csfx-migrate.service" ];
    };

    systemd.services.csfx-failover-controller = mkService {
      description = "CSFX Failover Controller";
      bin = failoverBin;
      binName = "failover-controller";
      after = [ "csfx-migrate.service" ];
      requires = [ "csfx-migrate.service" ];
      extraEnv = {
        SCHEDULER_SERVICE_URL = "http://localhost:8002";
        VOLUME_MANAGER_URL = "http://localhost:8003";
      };
    };

    systemd.services.csfx-sdn-controller = mkService {
      description = "CSFX SDN Controller";
      bin = sdnBin;
      binName = "sdn-controller";
      after = [ "csfx-migrate.service" ];
      requires = [ "csfx-migrate.service" ];
      extraEnv = {
        ETCD_URL = cfg.etcdEndpoints;
      };
    };
  };
}

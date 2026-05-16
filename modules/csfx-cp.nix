{ config, lib, pkgs, versions, ... }:

let
  cfg = config.services.csfx-cp;
  v = versions.csfx;
  cp = v.controlPlane;

  arch = if pkgs.stdenv.hostPlatform.system == "aarch64-linux" then "arm64" else "amd64";

  mkBin = name: entry:
    pkgs.stdenv.mkDerivation {
      pname = name;
      inherit (v) version;
      src = pkgs.fetchurl {
        inherit (entry.${arch}) url sha256;
      };
      dontUnpack = true;
      installPhase = ''
        install -Dm755 $src $out/bin/${name}
      '';
    };

  migrateBin      = mkBin "csfx-migrate"        cp.migrate;
  gatewayBin      = mkBin "api-gateway"          cp."api-gateway";
  registryBin     = mkBin "registry"             cp.registry;
  schedulerBin    = mkBin "scheduler"            cp.scheduler;
  volumeManagerBin = mkBin "volume-manager"      cp."volume-manager";
  failoverBin     = mkBin "failover-controller"  cp."failover-controller";
  sdnBin          = mkBin "sdn-controller"       cp."sdn-controller";
  hasUpdater      = cp ? "csfx-updater";
  updaterBin      = if hasUpdater then mkBin "csfx-updater" cp."csfx-updater" else null;

  commonEnv = {
    DATABASE_URL    = cfg.dbUrl;
    ETCD_ENDPOINTS  = cfg.etcdEndpoints;
  };

  mkService = { description, bin, binName, extraEnv ? {}, after ? [], requires ? [], listenAddr ? "127.0.0.1" }: {
    inherit description;
    after    = [ "network.target" "etcd.service" "csfx-migrate.service" ] ++ after;
    requires = [ "csfx-migrate.service" ] ++ requires;
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart     = "${bin}/bin/${binName}";
      Restart       = "on-failure";
      RestartSec    = "5s";
      DynamicUser   = true;
      EnvironmentFile = cfg.envFile;
    };
    environment = commonEnv // extraEnv // { LISTEN_ADDR = listenAddr; };
  };

  statusScript = pkgs.writeShellScriptBin "csfx-status" ''
    set -euo pipefail

    CYAN='\033[0;36m'
    GREEN='\033[0;32m'
    RED='\033[0;31m'
    YELLOW='\033[0;33m'
    RESET='\033[0m'
    BOLD='\033[1m'

    services=(
      "patroni:5432:PostgreSQL HA"
      "etcd:2379:etcd"
      "csfx-db-init::DB Init"
      "csfx-migrate::DB Migration"
      "csfx-api-gateway:8000:API Gateway"
      "csfx-registry:8001:Registry"
      "csfx-scheduler:8002:Scheduler"
      "csfx-volume-manager:8003:Volume Manager"
      "csfx-failover-controller:8004:Failover Controller"
      "csfx-sdn-controller:8005:SDN Controller"
      "csfx-agent::Agent"
      "csfx-updater::Updater"
    )

    printf "\n''${BOLD}''${CYAN}CSFX Control Plane — $(hostname)''${RESET}\n"
    printf "%-30s %-12s %-8s %s\n" "SERVICE" "STATUS" "PORT" "UPTIME"
    printf '%0.s─' {1..70}; printf '\n'

    for entry in "''${services[@]}"; do
      IFS=':' read -r svc port label <<< "$entry"

      raw=$(${pkgs.systemd}/bin/systemctl show "$svc" --property=ActiveState,SubState,ExecMainStartTimestamp 2>/dev/null || true)
      active=$(echo "$raw" | grep '^ActiveState=' | cut -d= -f2)
      sub=$(echo "$raw" | grep '^SubState=' | cut -d= -f2)
      ts=$(echo "$raw" | grep '^ExecMainStartTimestamp=' | cut -d= -f2-)

      if [ -z "$active" ]; then
        status_str="''${RED}not-found''${RESET}"
        uptime_str="-"
      elif [ "$active" = "active" ] && [ "$sub" = "running" ]; then
        status_str="''${GREEN}active''${RESET}"
        if [ -n "$ts" ] && [ "$ts" != "n/a" ]; then
          start_epoch=$(date -d "$ts" +%s 2>/dev/null || echo 0)
          now_epoch=$(date +%s)
          diff=$((now_epoch - start_epoch))
          h=$((diff / 3600)); m=$(((diff % 3600) / 60)); s=$((diff % 60))
          uptime_str=$(printf "%dh%02dm%02ds" $h $m $s)
        else
          uptime_str="-"
        fi
      elif [ "$active" = "active" ] && [ "$sub" = "exited" ]; then
        status_str="''${GREEN}done''${RESET}"
        uptime_str="-"
      elif [ "$active" = "activating" ]; then
        status_str="''${YELLOW}starting''${RESET}"
        uptime_str="-"
      elif [ "$active" = "failed" ]; then
        status_str="''${RED}failed''${RESET}"
        uptime_str="-"
      else
        status_str="''${YELLOW}$active/$sub''${RESET}"
        uptime_str="-"
      fi

      port_str="''${port:-  -  }"
      printf "%-30s %-22b %-8s %s\n" "$label ($svc)" "$status_str" "$port_str" "$uptime_str"
    done

    printf '%0.s─' {1..70}; printf '\n'
    printf "etcd: "
    if ${pkgs.curl}/bin/curl -sf http://localhost:2379/health > /dev/null 2>&1; then
      printf "''${GREEN}healthy''${RESET}\n"
    else
      printf "''${RED}unreachable''${RESET}\n"
    fi
    printf "api-gateway: "
    if ${pkgs.curl}/bin/curl -sf http://localhost:8000/api/public-key > /dev/null 2>&1; then
      printf "''${GREEN}healthy''${RESET}\n"
    else
      printf "''${RED}unreachable''${RESET}\n"
    fi
    printf '\n'
  '';
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
      description = "Path to environment file with secrets";
    };

    updater = {
      infraRepoMirrorUrl = lib.mkOption {
        type = lib.types.str;
        description = "Git remote URL to mirror CSFX-Infra from";
      };

      infraRepoGithub = lib.mkOption {
        type = lib.types.str;
        default = "CSFX-cloud/CSFX-Infra";
        description = "GitHub repo slug for tag resolution (owner/repo)";
      };

      infraRepoBranch = lib.mkOption {
        type = lib.types.str;
        default = "main";
      };

      pollIntervalSecs = lib.mkOption {
        type = lib.types.int;
        default = 120;
      };

      mirrorDir = lib.mkOption {
        type = lib.types.str;
        default = "/var/lib/csfx-updater/infra.git";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      patroni = {
        enable = true;
        scope = "csfx";
        name = config.networking.hostName;
        nodeIp = "127.0.0.1";
        postgresqlPackage = pkgs.postgresql_16;

        settings = {
          etcd3.hosts = [ "127.0.0.1:2379" ];
          bootstrap = {
            dcs = {
              ttl = 30;
              loop_wait = 10;
              retry_timeout = 10;
              maximum_lag_on_failover = 1048576;
            };
            initdb = [
              { encoding = "UTF8"; }
              "data-checksums"
            ];
            pg_hba = [
              "local all all trust"
              "host replication replicator 127.0.0.1/32 md5"
              "host all all 127.0.0.1/32 md5"
            ];
          };
          postgresql.authentication = {
            replication.username = "replicator";
            superuser.username = "postgres";
          };
        };

        environmentFiles = {
          PATRONI_SUPERUSER_PASSWORD = "/etc/csfx/patroni-superuser-password";
          PATRONI_REPLICATION_PASSWORD = "/etc/csfx/patroni-replication-password";
        };
      };

      etcd = {
        enable = true;
        listenClientUrls = [ "http://127.0.0.1:2379" ];
        advertiseClientUrls = [ "http://127.0.0.1:2379" ];
      };
    };

    systemd = {
      services = {
        patroni = {
          after = [ "etcd.service" "network-online.target" ];
          wants = [ "network-online.target" ];
          requires = [ "etcd.service" ];
        };

        csfx-db-init = {
          description = "CSFX database user and schema init";
          after = [ "network.target" "patroni.service" ];
          requires = [ "patroni.service" ];
          wantedBy = [ "multi-user.target" ];
          serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
            User = "root";
            EnvironmentFile = cfg.envFile;
            ExecStart = pkgs.writeShellScript "csfx-db-init" ''
              set -euo pipefail

              PSQL="${pkgs.postgresql_16}/bin/psql"
              TIMEOUT=60
              ELAPSED=0

              while [ "$ELAPSED" -lt "$TIMEOUT" ]; do
                if "$PSQL" -U postgres -h 127.0.0.1 -c "SELECT 1" postgres > /dev/null 2>&1; then
                  break
                fi
                sleep 2
                ELAPSED=$((ELAPSED + 2))
              done

              if [ "$ELAPSED" -ge "$TIMEOUT" ]; then
                echo "[ERROR] postgres not ready after timeout elapsed=''${TIMEOUT}s"
                exit 1
              fi

              DB_PASS=$(echo "$DATABASE_URL" | sed 's|.*://[^:]*:\([^@]*\)@.*|\1|')

              "$PSQL" -U postgres -h 127.0.0.1 postgres <<SQL
              DO \$\$
              BEGIN
                IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'csfx') THEN
                  CREATE ROLE csfx WITH LOGIN PASSWORD '$DB_PASS' CREATEDB;
                ELSE
                  ALTER ROLE csfx WITH PASSWORD '$DB_PASS';
                END IF;
              END
              \$\$;
              SELECT 'CREATE DATABASE csfx OWNER csfx' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'csfx')\gexec
              SQL

              "$PSQL" -U postgres -h 127.0.0.1 csfx <<SQL
              GRANT ALL ON SCHEMA public TO csfx;
              ALTER SCHEMA public OWNER TO csfx;
              SQL
            '';
          };
          environment = { DATABASE_URL = cfg.dbUrl; };
        };

        csfx-migrate = {
          description = "CSFX database migration";
          after = [ "network.target" "csfx-db-init.service" ];
          requires = [ "csfx-db-init.service" ];
          wantedBy = [ "multi-user.target" ];
          serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
            ExecStart = "${migrateBin}/bin/csfx-migrate";
            EnvironmentFile = cfg.envFile;
          };
          environment = commonEnv;
        };

        csfx-api-gateway = mkService {
          description = "CSFX API Gateway";
          bin = gatewayBin;
          binName = "api-gateway";
          listenAddr = "0.0.0.0";
          extraEnv = {
            SCHEDULER_SERVICE_URL = "http://localhost:8002";
            VOLUME_MANAGER_URL = "http://localhost:8003";
            FAILOVER_CONTROLLER_URL = "http://localhost:8004";
            SDN_CONTROLLER_URL = "http://localhost:8005";
            REGISTRY_SERVICE_URL = "http://localhost:8001";
          };
        };

        csfx-registry = mkService {
          description = "CSFX Registry";
          bin = registryBin;
          binName = "registry";
          extraEnv = {
            SCHEDULER_SERVICE_URL = "http://localhost:8002";
            API_GATEWAY_URL = "http://localhost:8000";
          };
        };

        csfx-scheduler = mkService {
          description = "CSFX Scheduler";
          bin = schedulerBin;
          binName = "scheduler";
        };

        csfx-volume-manager = mkService {
          description = "CSFX Volume Manager";
          bin = volumeManagerBin;
          binName = "volume-manager";
        };

        csfx-failover-controller = mkService {
          description = "CSFX Failover Controller";
          bin = failoverBin;
          binName = "failover-controller";
          extraEnv = {
            SCHEDULER_SERVICE_URL = "http://localhost:8002";
            VOLUME_MANAGER_URL = "http://localhost:8003";
          };
        };

        csfx-sdn-controller = mkService {
          description = "CSFX SDN Controller";
          bin = sdnBin;
          binName = "sdn-controller";
          extraEnv = {
            ETCD_URL = cfg.etcdEndpoints;
          };
        };

        csfx-updater = lib.mkIf hasUpdater {
          description = "CSFX Updater — resolves versions and coordinates node updates via etcd";
          wantedBy = [ "multi-user.target" ];
          after = [ "network-online.target" "etcd.service" ];
          wants = [ "network-online.target" ];
          requires = [ "etcd.service" ];
          path = [ pkgs.git ];
          serviceConfig = {
            ExecStart = "${updaterBin}/bin/csfx-updater";
            Restart = "on-failure";
            RestartSec = "10s";
            User = "csfx-updater";
            Group = "csfx-updater";
          };
          environment = {
            ETCD_ENDPOINTS = cfg.etcdEndpoints;
            INFRA_REPO_MIRROR_URL = cfg.updater.infraRepoMirrorUrl;
            INFRA_REPO_GITHUB = cfg.updater.infraRepoGithub;
            INFRA_REPO_BRANCH = cfg.updater.infraRepoBranch;
            INFRA_REPO_MIRROR_DIR = cfg.updater.mirrorDir;
            POLL_INTERVAL_SECS = toString cfg.updater.pollIntervalSecs;
          };
        };
      };

      tmpfiles.rules = [
        "d /run/postgresql 0755 patroni patroni -"
      ];
    };

    environment.systemPackages = [ statusScript ];
  };
}

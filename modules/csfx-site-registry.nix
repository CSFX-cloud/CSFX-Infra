{ config, lib, pkgs, ... }:

let
  cfg = config.services.csfx-site-registry;
  cp = config.services.csfx-cp;
  garage = config.services.csfx-garage;
  zot = pkgs.callPackage ../pkgs/zot.nix { };
  prepareScript = pkgs.writeShellScript "csfx-site-registry-prepare" (builtins.readFile ../scripts/site-registry-prepare.sh);
  useGarage = cfg.storage == "garage";
  runtimeDir = "/run/csfx-site-registry";
  stateDir = "/var/lib/private/csfx-site-registry";
in
{
  options.services.csfx-site-registry = {
    enable = lib.mkEnableOption "CSFX OCI registry for web app container images";

    port = lib.mkOption {
      type = lib.types.port;
      default = 5060;
      description = "Port for the site registry HTTP server";
    };

    storage = lib.mkOption {
      type = lib.types.enum [ "garage" "local" ];
      default = if garage.enable then "garage" else "local";
      description = "Where image layers are stored. Garage keeps one shared copy for every control plane node, local keeps them on this node only.";
    };

    bucket = lib.mkOption {
      type = lib.types.str;
      default = "csfx-site-images";
      description = "Garage bucket that holds the image layers";
    };

    siteBuilderUrl = lib.mkOption {
      type = lib.types.str;
      default = "http://127.0.0.1:8007";
      description = "Local site builder that issues the registry tokens";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.csfx-site-registry = {
      description = "CSFX OCI registry for web app images (zot)";
      wantedBy = [ "multi-user.target" ];
      after = [ "network-online.target" "csfx-site-env.service" "csfx-site-builder.service" ]
        ++ lib.optional useGarage "garage.service";
      wants = [ "network-online.target" ];
      requires = [ "csfx-site-env.service" "csfx-site-builder.service" ]
        ++ lib.optional useGarage "garage.service";
      unitConfig.ConditionPathExists = cp.controlPlaneConditions;
      path = [ pkgs.curl pkgs.jq pkgs.openssl pkgs.gawk pkgs.coreutils pkgs.gnugrep ];

      environment = {
        REGISTRY_PORT = toString cfg.port;
        STORAGE_MODE = cfg.storage;
        BUCKET = cfg.bucket;
        STATE_DIR = stateDir;
        SITE_BUILDER_URL = cfg.siteBuilderUrl;
        GARAGE_REGION = "csfx";
      };

      serviceConfig = {
        ExecStartPre = "+${prepareScript}";
        ExecStart = "${lib.getExe zot} serve ${runtimeDir}/config.json";
        Restart = "on-failure";
        RestartSec = "10s";
        DynamicUser = true;
        RuntimeDirectory = "csfx-site-registry";
        StateDirectory = "csfx-site-registry";
      };
    };

    networking.firewall.allowedTCPPorts = [ cfg.port ];
  };
}

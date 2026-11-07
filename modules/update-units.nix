{ config, lib, pkgs, ... }:

let
  cfg = config.services.csfx-update-units;
  cp = config.services.csfx-cp;
  updaterRun = import ./update-run.nix { inherit pkgs; updater = cp.updaterPackage; };
  manifestFile = "/var/lib/csfx/update/manifest.json";
in
{
  options.services.csfx-update-units = {
    enable = lib.mkEnableOption "CSFX worker update path unit applying signed release closures";

    releasePublicKeys = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      description = "Nix style public keys (name:base64) trusted to sign releases, manifests and closures; list old and new key during a rotation";
    };

    releaseBaseUrl = lib.mkOption {
      type = lib.types.str;
      default = "https://github.com/CSFX-cloud/CSFX-Infra/releases";
      description = "Release channel base URL serving bundles when no cluster peer has the closure";
    };
  };

  config = lib.mkIf cfg.enable {
    nix.settings.trusted-public-keys = cfg.releasePublicKeys;

    environment.etc."csfx/release-public-key".text = lib.concatStringsSep "\n" cfg.releasePublicKeys;

    systemd = {
      services.csfx-apply-update = {
        description = "CSFX apply signed release closure on worker";
        after = [ "network-online.target" ];
        wants = [ "network-online.target" ];
        unitConfig.ConditionPathExists = [ cp.workerMarker manifestFile ];
        path = [ config.nix.package pkgs.systemd pkgs.gnutar pkgs.zstd pkgs.coreutils ];
        environment = {
          RELEASE_BASE_URL = cfg.releaseBaseUrl;
          STATE_DIR = "/var/lib/csfx-node-updater";
        };
        serviceConfig = {
          Type = "oneshot";
          User = "root";
          ExecStart = "${updaterRun} apply ${manifestFile}";
        };
      };

      paths.csfx-update-trigger = {
        description = "Watch for staged CSFX release manifest";
        wantedBy = [ "multi-user.target" ];
        pathConfig = {
          PathChanged = manifestFile;
          Unit = "csfx-apply-update.service";
        };
      };

      services.csfx-apply-update-resume = {
        description = "CSFX finish interrupted worker update after boot";
        wantedBy = [ "multi-user.target" ];
        unitConfig.ConditionPathExists = [ cp.workerMarker manifestFile "/var/lib/csfx-node-updater/pending.json" ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = "${config.systemd.package}/bin/systemctl start csfx-apply-update.service";
        };
      };
    };
  };
}

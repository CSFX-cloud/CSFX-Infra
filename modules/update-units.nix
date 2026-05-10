{ config, lib, pkgs, ... }:

let
  cfg = config.services.csfx-update-units;
in
{
  options.services.csfx-update-units = {
    enable = lib.mkEnableOption "CSFX update path units and watchdog";

    nixCacheUrl = lib.mkOption {
      type = lib.types.str;
      description = "URL of the CP Harmonia binary cache";
    };

    nixCachePublicKey = lib.mkOption {
      type = lib.types.str;
      description = "Public key of the CP Harmonia binary cache";
    };

    infraRepoMirrorDir = lib.mkOption {
      type = lib.types.str;
      default = "/var/lib/csfx-updater/infra.git";
      description = "Path to the local git mirror of CSFX-Infra used by csfx-updater";
    };

    nixosConfig = lib.mkOption {
      type = lib.types.str;
      description = "Name of the nixosConfiguration to activate (e.g. csfx-worker or csfx-control-plane)";
    };

    watchdogHeartbeats = lib.mkOption {
      type = lib.types.int;
      default = 3;
      description = "Number of successful heartbeats required before watchdog clears";
    };

    watchdogTimeoutSecs = lib.mkOption {
      type = lib.types.int;
      default = 300;
      description = "Seconds before watchdog triggers rollback";
    };
  };

  config = lib.mkIf cfg.enable {
    nix.settings = lib.mkMerge [
      (lib.mkIf (cfg.nixCacheUrl != "") {
        substituters = [ cfg.nixCacheUrl ];
      })
      (lib.mkIf (cfg.nixCachePublicKey != "") {
        trusted-public-keys = [ cfg.nixCachePublicKey ];
      })
    ];

    systemd.services.csfx-node-updater = {
      description = "CSFX Node Updater — nixos-rebuild switch on new flake rev";
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      onSuccess = [ "csfx-watchdog.timer" ];

      serviceConfig = {
        Type = "oneshot";
        User = "root";
        ExecStart = pkgs.writeShellScript "csfx-node-updater" ''
          set -euo pipefail

          TRIGGER_FILE="/var/lib/csfx/update_trigger"
          MIRROR_DIR="${cfg.infraRepoMirrorDir}"
          CONFIG="${cfg.nixosConfig}"

          REV=$(cat "$TRIGGER_FILE" | tr -d '[:space:]')

          if ! echo "$REV" | grep -qE '^[0-9a-f]{40}$'; then
            echo "invalid rev: $REV" >&2
            exit 1
          fi

          FLAKE_URL="git+file://${"\${MIRROR_DIR}"}?rev=${"\${REV}"}"

          nixos-rebuild switch --flake "$FLAKE_URL#$CONFIG"
        '';
      };
    };

    systemd.paths.csfx-update-trigger = {
      description = "Watch for CSFX update trigger file";
      wantedBy = [ "multi-user.target" ];
      pathConfig = {
        PathModified = "/var/lib/csfx/update_trigger";
        Unit = "csfx-node-updater.service";
      };
    };

    systemd.timers.csfx-watchdog = {
      description = "CSFX update watchdog timer";
      timerConfig = {
        OnActiveSec = "${toString cfg.watchdogTimeoutSecs}s";
        RemainAfterElapse = false;
      };
    };

    systemd.services.csfx-watchdog = {
      description = "CSFX update watchdog — rollback if heartbeats missing";
      serviceConfig = {
        Type = "oneshot";
        User = "root";
        ExecStart = pkgs.writeShellScript "csfx-watchdog" ''
          set -euo pipefail

          COUNTER_FILE="/var/lib/csfx/post_update_heartbeats"
          REQUIRED=${toString cfg.watchdogHeartbeats}

          if [ ! -f "$COUNTER_FILE" ]; then
            echo "no heartbeat counter found, triggering rollback" >&2
            nixos-rebuild switch --rollback
            exit 0
          fi

          COUNT=$(cat "$COUNTER_FILE" | tr -d '[:space:]')

          if [ "$COUNT" -lt "$REQUIRED" ] 2>/dev/null; then
            echo "only $COUNT/$REQUIRED heartbeats received, triggering rollback" >&2
            nixos-rebuild switch --rollback
          fi
        '';
      };
    };
  };
}

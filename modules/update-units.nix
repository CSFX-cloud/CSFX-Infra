{ config, lib, pkgs, ... }:

let
  cfg = config.services.csf-update-units;
in
{
  options.services.csf-update-units = {
    enable = lib.mkEnableOption "CSF update path units and watchdog";

    nixCacheUrl = lib.mkOption {
      type = lib.types.str;
      description = "URL of the CP Harmonia binary cache";
    };

    nixCachePublicKey = lib.mkOption {
      type = lib.types.str;
      description = "Public key of the CP Harmonia binary cache";
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
    nix.settings = {
      substituters = [ cfg.nixCacheUrl ];
      trusted-public-keys = [ cfg.nixCachePublicKey ];
    };

    systemd.paths.csf-update-trigger = {
      description = "Watch for CSF update trigger file";
      wantedBy = [ "multi-user.target" ];
      pathConfig = {
        PathModified = "/var/lib/csf/update_trigger";
        Unit = "csf-os-updater.service";
      };
    };

    systemd.services.csf-os-updater = {
      description = "CSF OS updater — runs nixos-rebuild switch on trigger";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = pkgs.writeShellScript "csf-os-updater" ''
          set -euo pipefail

          TRIGGER_FILE="/var/lib/csf/update_trigger"
          REV=$(cat "$TRIGGER_FILE" | tr -d '[:space:]')

          if ! echo "$REV" | grep -qE '^[0-9a-f]{40}$'; then
            echo "invalid rev: $REV" >&2
            exit 1
          fi

          nixos-rebuild switch --flake "git+http://@csf-cp-internal/infra.git?rev=$REV"
        '';
        User = "root";
      };
    };

    systemd.timers.csf-watchdog = {
      description = "CSF update watchdog timer";
      timerConfig = {
        OnActiveSec = "${toString cfg.watchdogTimeoutSecs}s";
        RemainAfterElapse = false;
      };
    };

    systemd.services.csf-watchdog = {
      description = "CSF update watchdog — rollback if heartbeats missing";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = pkgs.writeShellScript "csf-watchdog" ''
          set -euo pipefail

          COUNTER_FILE="/var/lib/csf/post_update_heartbeats"
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
          else
            echo "watchdog cleared: $COUNT heartbeats confirmed"
          fi
        '';
        User = "root";
      };
    };

    systemd.services.csf-os-updater = {
      onSuccess = [ "csf-watchdog.timer" ];
    };
  };
}

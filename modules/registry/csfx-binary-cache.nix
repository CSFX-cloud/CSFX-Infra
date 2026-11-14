{ config, lib, ... }:

let
  cfg = config.services.csfx-binary-cache;
in
{
  options.services.csfx-binary-cache = {
    enable = lib.mkEnableOption "CSFX Harmonia binary cache serving release closures to cluster peers";

    port = lib.mkOption {
      type = lib.types.port;
      default = 5000;
      description = "Port for the Harmonia binary cache HTTP server";
    };
  };

  config = lib.mkIf cfg.enable {
    services.harmonia = {
      enable = true;
      settings.bind = "0.0.0.0:${toString cfg.port}";
    };

    systemd.services.harmonia.unitConfig.ConditionPathExists =
      config.services.csfx-cp.controlPlaneConditions;

    networking.firewall.allowedTCPPorts = [ cfg.port ];
  };
}

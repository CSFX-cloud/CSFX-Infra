{ config, lib, pkgs, ... }:

let
  cfg = config.services.csfx-dev-ssh;
in
{
  options.services.csfx-dev-ssh = {
    enable = lib.mkEnableOption "development-only SSH root password login (disable for production)";
  };

  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = lib.mkOverride 40 true;
      settings = {
        PermitRootLogin = lib.mkForce "yes";
        PasswordAuthentication = lib.mkForce true;
      };
    };
  };
}

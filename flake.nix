{
  description = "CSFX Infrastructure — NixOS configurations for control plane and worker nodes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }: let
    versions = import ./versions.nix;

    mkSystem = { system, modules }: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit versions; };
      modules = modules;
    };
  in {
    nixosModules = {
      csf-agent        = import ./modules/csf-agent.nix;
      csf-cp           = import ./modules/csf-cp.nix;
      csf-binary-cache = import ./modules/csf-binary-cache.nix;
      csf-compose      = import ./modules/csf-compose.nix;
      csf-setup        = import ./modules/csf-setup.nix;
      update-units     = import ./modules/update-units.nix;
    };

    nixosConfigurations = {
      csf-node = mkSystem {
        system = "x86_64-linux";
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          self.nixosModules.csf-agent
          self.nixosModules.csf-compose
          self.nixosModules.csf-setup
          self.nixosModules.csf-binary-cache
          self.nixosModules.update-units
          ({ lib, ... }: {
            system.stateVersion = "24.11";
            services.csf-agent.enable = true;
            services.csf-agent.gatewayUrl = "http://localhost:8000";
            services.csf-setup.enable = true;
            services.csf-binary-cache.enable = true;
            services.csf-update-units.enable = true;
            services.csf-update-units.nixCacheUrl = "http://localhost:5000";
            services.csf-update-units.nixCachePublicKey = "";
            services.csf-update-units.nixosConfig = "csf-node";
            isoImage.isoName = lib.mkForce "csf-node.iso";
          })
        ];
      };

      csf-node-arm64 = mkSystem {
        system = "aarch64-linux";
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          self.nixosModules.csf-agent
          self.nixosModules.csf-compose
          self.nixosModules.csf-setup
          self.nixosModules.csf-binary-cache
          self.nixosModules.update-units
          ({ lib, ... }: {
            system.stateVersion = "24.11";
            services.csf-agent.enable = true;
            services.csf-agent.gatewayUrl = "http://localhost:8000";
            services.csf-setup.enable = true;
            services.csf-binary-cache.enable = true;
            services.csf-update-units.enable = true;
            services.csf-update-units.nixCacheUrl = "http://localhost:5000";
            services.csf-update-units.nixCachePublicKey = "";
            services.csf-update-units.nixosConfig = "csf-node-arm64";
            isoImage.isoName = lib.mkForce "csf-node-arm64.iso";
          })
        ];
      };
    };
  };
}

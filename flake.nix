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
      update-units     = import ./modules/update-units.nix;
    };

    nixosConfigurations = {
      csf-worker = mkSystem {
        system = "x86_64-linux";
        modules = [
          self.nixosModules.csf-agent
          self.nixosModules.update-units
          ({ ... }: {
            system.stateVersion = "24.11";
            services.csf-agent.enable = true;
            services.csf-agent.gatewayUrl = "http://csf-cp:8000";
            services.csf-update-units.enable = true;
            services.csf-update-units.nixCacheUrl = "http://csf-cp:5000";
            services.csf-update-units.nixCachePublicKey = "";
          })
        ];
      };

      csf-worker-arm64 = mkSystem {
        system = "aarch64-linux";
        modules = [
          self.nixosModules.csf-agent
          self.nixosModules.update-units
          ({ ... }: {
            system.stateVersion = "24.11";
            services.csf-agent.enable = true;
            services.csf-agent.gatewayUrl = "http://csf-cp:8000";
            services.csf-update-units.enable = true;
            services.csf-update-units.nixCacheUrl = "http://csf-cp:5000";
            services.csf-update-units.nixCachePublicKey = "";
          })
        ];
      };

      csf-control-plane = mkSystem {
        system = "x86_64-linux";
        modules = [
          self.nixosModules.csf-cp
          self.nixosModules.csf-agent
          self.nixosModules.csf-binary-cache
          self.nixosModules.update-units
          ({ ... }: {
            system.stateVersion = "24.11";
            services.csf-cp.enable = true;
            services.csf-cp.etcdEndpoints = "http://localhost:2379";
            services.csf-cp.dbUrl = "";
            services.csf-cp.jwtSecret = "";
            services.csf-agent.enable = true;
            services.csf-agent.gatewayUrl = "http://localhost:8000";
            services.csf-binary-cache.enable = true;
            services.csf-update-units.enable = true;
            services.csf-update-units.nixCacheUrl = "http://localhost:5000";
            services.csf-update-units.nixCachePublicKey = "";
          })
        ];
      };
    };
  };
}

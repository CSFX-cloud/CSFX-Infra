{
  description = "CSFX Infrastructure — NixOS configurations for control plane and worker nodes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, pre-commit-hooks }: let
    versions = import ./versions.nix;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    mkSystem = { system, modules, extraSpecialArgs ? {} }: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit versions; } // extraSpecialArgs;
      modules = modules;
    };

    serverModules = { hostPlatform, nixosConfig }: [
      self.nixosModules.csfx-agent
      self.nixosModules.csfx-cp
      self.nixosModules.csfx-setup
      self.nixosModules.csfx-binary-cache
      self.nixosModules.update-units
      ({ lib, ... }: {
        system.stateVersion = "24.11";
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;
        boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod" ];
        fileSystems."/" = { device = "/dev/disk/by-label/nixos"; fsType = "ext4"; };
        fileSystems."/boot" = { device = "/dev/disk/by-label/boot"; fsType = "vfat"; options = [ "umask=0077" ]; };
        swapDevices = [];
        nixpkgs.hostPlatform = hostPlatform;
        networking.hostName = "csfx-node";
        networking.useDHCP = true;
        networking.firewall.enable = true;
        networking.firewall.allowedTCPPorts = [ 22 8000 ];
        time.timeZone = "UTC";
        services.openssh.enable = true;
        services.openssh.settings.PermitRootLogin = "prohibit-password";
        services.openssh.settings.PasswordAuthentication = false;
        services.csfx-agent.enable = true;
        services.csfx-agent.gatewayUrl = "http://localhost:8000";
        services.csfx-cp.enable = true;
        services.csfx-cp.dbUrl = "";
        services.csfx-cp.etcdEndpoints = "http://localhost:2379";
        services.csfx-cp.updater.infraRepoMirrorUrl = "https://github.com/CSFX-cloud/CSFX-Infra.git";
        services.csfx-cp.updater.infraRepoGithub = "CSFX-cloud/CSFX-Infra";
        services.csfx-cp.updater.infraRepoBranch = "main";
        services.csfx-setup.enable = true;
        services.csfx-setup.dataPart = "/dev/sda3";
        services.csfx-binary-cache.enable = true;
        services.csfx-update-units.enable = true;
        services.csfx-update-units.nixCacheUrl = "http://localhost:5000";
        services.csfx-update-units.nixCachePublicKey = "";
        services.csfx-update-units.nixosConfig = nixosConfig;
      })
    ];

    serverSystem = mkSystem {
      system = "x86_64-linux";
      modules = serverModules { hostPlatform = "x86_64-linux"; nixosConfig = "csfx-node"; };
    };

    serverSystemArm64 = mkSystem {
      system = "aarch64-linux";
      modules = serverModules { hostPlatform = "aarch64-linux"; nixosConfig = "csfx-node-arm64"; };
    };
  in {
    checks.${system}.pre-commit = pre-commit-hooks.lib.${system}.run {
      src = ./.;
      hooks = {
        nixpkgs-fmt.enable = true;
        statix.enable = true;
        deadnix.enable = true;
      };
    };

    devShells.${system}.default = pkgs.mkShell {
      inherit (self.checks.${system}.pre-commit) shellHook;
      packages = [ pkgs.nixpkgs-fmt pkgs.statix pkgs.deadnix ];
    };

    nixosModules = {
      csfx-agent        = import ./modules/csfx-agent.nix;
      csfx-cp           = import ./modules/csfx-cp.nix;
      csfx-binary-cache = import ./modules/csfx-binary-cache.nix;
      csfx-setup        = import ./modules/csfx-setup.nix;
      csfx-installer    = import ./modules/csfx-installer.nix;
      update-units      = import ./modules/update-units.nix;
    };

    nixosConfigurations = {
      csfx-node = mkSystem {
        system = "x86_64-linux";
        extraSpecialArgs = { serverToplevel = serverSystem.config.system.build.toplevel; };
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          self.nixosModules.csfx-installer
          ({ lib, ... }: {
            system.stateVersion = "24.11";
            services.csfx-installer.enable = true;
            image.fileName = lib.mkForce "csfx-node.iso";
          })
        ];
      };

      csfx-node-arm64 = mkSystem {
        system = "aarch64-linux";
        extraSpecialArgs = { serverToplevel = serverSystemArm64.config.system.build.toplevel; };
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          self.nixosModules.csfx-installer
          ({ lib, ... }: {
            system.stateVersion = "24.11";
            services.csfx-installer.enable = true;
            image.fileName = lib.mkForce "csfx-node-arm64.iso";
          })
        ];
      };
    };
  };
}

{
  description = "CSFX Infrastructure — NixOS configurations for control plane and worker nodes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, pre-commit-hooks }:
    let
      versions = import ./versions.nix;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkSystem = { system, modules, extraSpecialArgs ? { } }:
        nixpkgs.lib.nixosSystem {
          inherit system modules;
          specialArgs = { inherit versions; } // extraSpecialArgs;
        };

      nodeModules = [
        self.nixosModules.csfx-agent
        self.nixosModules.csfx-cp
        self.nixosModules.csfx-setup
        self.nixosModules.csfx-binary-cache
        self.nixosModules.update-units
      ];

      nodeConfig = nixosConfig: _: {
        system.stateVersion = "25.05";

        networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];

        fileSystems."/" = { device = "/dev/disk/by-label/nixos"; fsType = "ext4"; };
        fileSystems."/boot" = { device = "/dev/disk/by-label/boot"; fsType = "vfat"; options = [ "umask=0077" ]; };
        swapDevices = [ ];

        boot = {
          initrd.availableKernelModules = [
            "virtio_pci"
            "virtio_blk"
            "virtio_net"
            "virtio_scsi"
            "ahci"
            "sd_mod"
            "xhci_pci"
            "usb_storage"
            "nvme"
          ];
          loader = {
            grub = {
              enable = true;
              efiSupport = true;
              efiInstallAsRemovable = true;
              device = "nodev";
              useOSProber = false;
            };
            efi.efiSysMountPoint = "/boot";
          };
        };

        services = {
          csfx-agent = {
            enable = true;
            gatewayUrl = "https://localhost:8000";
          };
          csfx-cp = {
            enable = true;
            dbUrl = "";
            etcdEndpoints = "http://localhost:2379";
            updater = {
              infraRepoMirrorUrl = "https://github.com/CSFX-cloud/CSFX-Infra.git";
              infraRepoGithub = "CSFX-cloud/CSFX-Infra";
              infraRepoBranch = "main";
            };
          };
          csfx-setup = {
            enable = true;
            dataPart = "/dev/disk/by-label/csfx-data";
          };
          csfx-binary-cache.enable = true;
          csfx-update-units = {
            enable = true;
            nixCacheUrl = "http://localhost:5000";
            nixCachePublicKey = "";
            inherit nixosConfig;
          };
        };
      };

      isoConfig = _installedSys: isoFileName: { lib, ... }: {
        system.stateVersion = "25.05";
        services.csfx-autoinstall = {
          enable = true;
          disk = "auto";
        };
        image.fileName = lib.mkForce isoFileName;
      };
    in
    {
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
        csfx-agent = import ./modules/csfx-agent.nix;
        csfx-cp = import ./modules/csfx-cp.nix;
        csfx-binary-cache = import ./modules/csfx-binary-cache.nix;
        csfx-setup = import ./modules/csfx-setup.nix;
        csfx-autoinstall = import ./modules/csfx-autoinstall.nix;
        update-units = import ./modules/update-units.nix;
      };

      nixosConfigurations = {
        csfx-node = mkSystem {
          system = "x86_64-linux";
          modules = nodeModules ++ [ (nodeConfig "csfx-node") ];
        };

        csfx-node-arm64 = mkSystem {
          system = "aarch64-linux";
          modules = nodeModules ++ [ (nodeConfig "csfx-node-arm64") ];
        };

        csfx-node-iso = mkSystem {
          system = "x86_64-linux";
          extraSpecialArgs = {
            installedSystem = self.nixosConfigurations.csfx-node;
          };
          modules = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
            self.nixosModules.csfx-autoinstall
            (isoConfig self.nixosConfigurations.csfx-node "csfx-node.iso")
          ];
        };

        csfx-node-iso-arm64 = mkSystem {
          system = "aarch64-linux";
          extraSpecialArgs = {
            installedSystem = self.nixosConfigurations.csfx-node-arm64;
          };
          modules = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
            self.nixosModules.csfx-autoinstall
            (isoConfig self.nixosConfigurations.csfx-node-arm64 "csfx-node-arm64.iso")
          ];
        };
      };
    };
}

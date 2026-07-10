{ config, lib, pkgs, versions, ... }:

let
  cfg = config.services.csfx-agent;
  arch = if pkgs.stdenv.isAarch64 then "arm64" else "amd64";
  agentSrc = pkgs.fetchurl {
    inherit (versions.csfx.agent.${arch}) url sha256;
  };

  agentBin = pkgs.runCommand "csfx-agent" { } ''
    mkdir -p $out/bin
    cp ${agentSrc} $out/bin/csfx-agent
    chmod +x $out/bin/csfx-agent
  '';
in
{
  options.services.csfx-agent = {
    enable = lib.mkEnableOption "CSFX agent daemon";

    gatewayUrl = lib.mkOption {
      type = lib.types.str;
      description = "URL of the CSFX API gateway";
    };

    heartbeatInterval = lib.mkOption {
      type = lib.types.int;
      default = 60;
      description = "Heartbeat interval in seconds";
    };

    registrationToken = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Pre-registration token (leave empty to use bootstrap token)";
    };

    enableSsh = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Configure sshd AuthorizedKeysCommand to fetch authorized keys from the CSFX gateway";
    };

    enableFirecracker = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Firecracker microVM workload support (requires KVM)";
    };

    guestKernelPath = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      description = "Path to the uncompressed guest kernel image (vmlinux) used to boot microVMs";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = lib.mkDefault true;
      enableOnBoot = lib.mkDefault false;
    };

    boot.kernelModules = [ "wireguard" ]
      ++ lib.optionals cfg.enableFirecracker [ "kvm" "kvm-intel" "kvm-amd" "tun" "vhost_net" ];

    services.udev.extraRules = lib.mkIf cfg.enableFirecracker ''
      KERNEL=="kvm", GROUP="kvm", MODE="0660"
    '';

    security.polkit.extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.systemd1.manage-units" &&
            action.lookup("unit") == "docker.service" &&
            subject.user == "csfx-agent") {
          return polkit.Result.YES;
        }
      });
    '';

    users = {
      users = {
        csfx-agent = {
          isSystemUser = true;
          group = "csfx-agent";
          home = "/var/lib/csfx-agent";
          createHome = true;
          extraGroups = lib.optionals cfg.enableFirecracker [ "kvm" ];
        };
        csfx-updater = {
          isSystemUser = true;
          group = "csfx-updater";
          home = "/var/lib/csfx-updater";
          createHome = true;
        };
      };
      groups = {
        csfx-agent = { };
        csfx-updater = { };
      };
    };

    systemd = {
      tmpfiles.rules = [
        "d /var/lib/csfx-agent 0750 csfx-agent csfx-agent -"
        "d /var/lib/csfx-updater 0750 csfx-updater csfx-updater -"
        "f /var/lib/csfx/update_trigger 0660 csfx-agent csfx-updater -"
        "d /var/lib/csfx 0750 csfx-agent csfx-updater -"
      ];
      services.csfx-agent = {
        description = "CSFX Agent";
        wantedBy = [ "multi-user.target" ];
        after = [ "network-online.target" "csfx-cp-ready.service" ];
        wants = [ "network-online.target" "csfx-cp-ready.service" ];

        path = [ pkgs.nftables pkgs.wireguard-tools pkgs.iproute2 ]
          ++ lib.optionals cfg.enableFirecracker [ pkgs.firecracker ];

        serviceConfig = {
          ExecStart = "${agentBin}/bin/csfx-agent";
          User = "csfx-agent";
          Group = "csfx-agent";
          Restart = "on-failure";
          RestartSec = "10s";
          PrivateTmp = true;
          ProtectSystem = "strict";
          ReadWritePaths = [ "/var/lib/csfx-agent" "/var/lib/csfx" ];
          NoNewPrivileges = true;
          CapabilityBoundingSet = [ "CAP_NET_ADMIN" "CAP_NET_RAW" ]
            ++ lib.optionals cfg.enableFirecracker [ "CAP_SYS_ADMIN" "CAP_MKNOD" "CAP_SETPCAP" "CAP_CHOWN" ];
          AmbientCapabilities = [ "CAP_NET_ADMIN" "CAP_NET_RAW" ]
            ++ lib.optionals cfg.enableFirecracker [ "CAP_SYS_ADMIN" "CAP_MKNOD" "CAP_SETPCAP" "CAP_CHOWN" ];
        };

        environment = {
          CSFX_GATEWAY_URL = cfg.gatewayUrl;
          CSFX_HEARTBEAT_INTERVAL = toString cfg.heartbeatInterval;
        } // lib.optionalAttrs (cfg.registrationToken != "") {
          CSFX_REGISTRATION_TOKEN = cfg.registrationToken;
        };
      };

      services.csfx-guest-kernel-link = lib.mkIf (cfg.enableFirecracker && cfg.guestKernelPath != null) {
        description = "Link CSFX guest kernel image into agent state directory";
        wantedBy = [ "csfx-agent.service" ];
        before = [ "csfx-agent.service" ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = "${pkgs.coreutils}/bin/ln -sf ${cfg.guestKernelPath} /var/lib/csfx-agent/vmlinux";
        };
      };
    };

    services.openssh = lib.mkIf cfg.enableSsh {
      enable = true;
      settings = {
        AuthorizedKeysCommand = "${agentBin}/bin/csfx-agent --authorized-keys %u";
        AuthorizedKeysCommandUser = "csfx-agent";
      };
    };
  };
}

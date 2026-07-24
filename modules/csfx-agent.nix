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

  guestInitSrc = pkgs.fetchurl {
    inherit (versions.csfx.guestInit.${arch}) url sha256;
  };

  guestInitBin = pkgs.runCommand "csfx-guest-init" { } ''
    mkdir -p $out/bin
    cp ${guestInitSrc} $out/bin/csfx-guest-init
    chmod +x $out/bin/csfx-guest-init
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

    wgEndpoint = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "WireGuard endpoint (host:port) this agent is reachable at for VPN/tunnel peering. Required for VPN and node-reboot features.";
    };

    agentPort = lib.mkOption {
      type = lib.types.port;
      default = 7443;
      description = "Port the agent's inbound HTTP server (logs, exec, power, metrics stream) listens on. Must match the port the control plane uses to reach this agent over the management tunnel.";
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

    cephMonHosts = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Comma-separated Ceph monitor hosts (e.g. ceph-mon1:6789,ceph-mon2:6789). Leave empty to disable RBD volume support.";
    };

    cephClientName = lib.mkOption {
      type = lib.types.str;
      default = "admin";
      description = "Ceph client name used for RBD authentication";
    };

    cephKeyringPath = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      description = "Path to the Ceph client keyring file for this node";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = lib.mkDefault true;
      enableOnBoot = lib.mkDefault false;
    };

    environment.systemPackages = [ pkgs.wireguard-tools pkgs.iproute2 ];

    networking.firewall = {
      allowedUDPPorts = [ 51820 ];
      interfaces."wgmgmt0".allowedTCPPorts = [ cfg.agentPort ];
    };

    boot.kernelModules = [ "wireguard" ]
      ++ lib.optionals cfg.enableFirecracker [ "kvm" "kvm-intel" "kvm-amd" "tun" "vhost_net" ];

    services.udev.extraRules = lib.mkIf cfg.enableFirecracker ''
      KERNEL=="kvm", GROUP="kvm", MODE="0660"
    '';

    security.polkit.enable = true;

    security.polkit.extraConfig = ''
      polkit.addRule(function(action, subject) {
        var managedUnits = ["docker.service", "reboot.target", "poweroff.target"];
        if (action.id == "org.freedesktop.systemd1.manage-units" &&
            managedUnits.indexOf(action.lookup("unit")) !== -1 &&
            subject.user == "csfx-agent") {
          return polkit.Result.YES;
        }
        if ((action.id == "org.freedesktop.login1.reboot" ||
             action.id == "org.freedesktop.login1.power-off") &&
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
          extraGroups = [ "docker" ] ++ lib.optionals cfg.enableFirecracker [ "kvm" ];
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
      ] ++ lib.optionals (cfg.cephMonHosts != "") [
        "d /mnt/csfx-volumes 0750 csfx-agent csfx-agent -"
      ];
      services.csfx-agent = {
        description = "CSFX Agent";
        wantedBy = [ "multi-user.target" ];
        after = [ "network-online.target" "csfx-cp-ready.service" ];
        wants = [ "network-online.target" "csfx-cp-ready.service" ];

        path = [ pkgs.nftables pkgs.wireguard-tools pkgs.iproute2 pkgs.util-linux ]
          ++ lib.optionals cfg.enableFirecracker [ pkgs.firecracker ]
          ++ lib.optionals (cfg.cephMonHosts != "") [ pkgs.ceph-client ];

        serviceConfig = {
          ExecStart = "${agentBin}/bin/csfx-agent";
          User = "csfx-agent";
          Group = "csfx-agent";
          Restart = "on-failure";
          RestartSec = "10s";
          PrivateTmp = true;
          ProtectSystem = "strict";
          ReadWritePaths = [ "/var/lib/csfx-agent" "/var/lib/csfx" ]
            ++ lib.optionals (cfg.cephMonHosts != "") [ "/mnt/csfx-volumes" ];
          NoNewPrivileges = true;
          CapabilityBoundingSet = [ "CAP_NET_ADMIN" "CAP_NET_RAW" "CAP_SYS_ADMIN" ]
            ++ lib.optionals cfg.enableFirecracker [ "CAP_MKNOD" "CAP_SETPCAP" "CAP_CHOWN" ];
          AmbientCapabilities = [ "CAP_NET_ADMIN" "CAP_NET_RAW" "CAP_SYS_ADMIN" ]
            ++ lib.optionals cfg.enableFirecracker [ "CAP_MKNOD" "CAP_SETPCAP" "CAP_CHOWN" ];
        };

        environment = {
          CSFX_GATEWAY_URL = cfg.gatewayUrl;
          CSFX_HEARTBEAT_INTERVAL = toString cfg.heartbeatInterval;
          CSFX_AGENT_PORT = toString cfg.agentPort;
        } // lib.optionalAttrs (cfg.registrationToken != "") {
          CSFX_REGISTRATION_TOKEN = cfg.registrationToken;
        } // lib.optionalAttrs (cfg.wgEndpoint != null) {
          CSFX_WG_ENDPOINT = cfg.wgEndpoint;
        } // lib.optionalAttrs (cfg.cephMonHosts != "") {
          CEPH_MON_HOSTS = cfg.cephMonHosts;
          CEPH_CLIENT_NAME = cfg.cephClientName;
        } // lib.optionalAttrs (cfg.cephKeyringPath != null) {
          CEPH_KEYRING = toString cfg.cephKeyringPath;
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

      services.csfx-guest-init-link = lib.mkIf cfg.enableFirecracker {
        description = "Link CSFX guest-init binary into agent state directory";
        wantedBy = [ "csfx-agent.service" ];
        before = [ "csfx-agent.service" ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = "${pkgs.coreutils}/bin/ln -sf ${guestInitBin}/bin/csfx-guest-init /var/lib/csfx-agent/csfx-guest-init";
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

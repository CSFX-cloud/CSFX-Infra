{ config, lib, pkgs, serverToplevel, ... }:

let
  cfg = config.services.csfx-installer;

  installScript = pkgs.writeShellScript "csfx-install" ''
    set -euo pipefail

    DISK=""
    for dev in sda vda nvme0n1; do
      if [ -b "/dev/$dev" ]; then
        DISK="/dev/$dev"
        break
      fi
    done

    if [ -z "$DISK" ]; then
      echo "[ERROR] no suitable disk found"
      exit 1
    fi

    echo "[INFO] target disk=$DISK"

    if [[ "$DISK" == *nvme* ]]; then
      PART_BOOT="''${DISK}p1"
      PART_ROOT="''${DISK}p2"
      PART_DATA="''${DISK}p3"
    else
      PART_BOOT="''${DISK}1"
      PART_ROOT="''${DISK}2"
      PART_DATA="''${DISK}3"
    fi

    parted "$DISK" -- mklabel gpt
    parted "$DISK" -- mkpart ESP fat32 1MB 512MB
    parted "$DISK" -- mkpart primary ext4 512MB 20GB
    parted "$DISK" -- mkpart primary ext4 20GB 100%
    parted "$DISK" -- set 1 esp on

    partprobe "$DISK"
    udevadm settle --timeout=15

    WAIT=0
    while [ ! -b "$PART_DATA" ] && [ "$WAIT" -lt 30 ]; do
      sleep 1
      WAIT=$((WAIT + 1))
    done

    if [ ! -b "$PART_DATA" ]; then
      echo "[ERROR] partition nodes did not appear disk=$DISK"
      exit 1
    fi

    mkfs.fat -F 32 -n boot "$PART_BOOT"
    mkfs.ext4 -L nixos "$PART_ROOT"
    mkfs.ext4 -L csfx-data "$PART_DATA"

    echo "[INFO] partitioning complete boot=$PART_BOOT root=$PART_ROOT data=$PART_DATA"

    mount "$PART_ROOT" /mnt
    mkdir -p /mnt/boot
    mount "$PART_BOOT" /mnt/boot

    echo "[INFO] installing system toplevel=${serverToplevel}"

    nixos-install \
      --no-root-passwd \
      --no-channel-copy \
      --system "${serverToplevel}"

    echo "[INFO] installation complete, rebooting in 5s"
    sleep 5
    reboot
  '';
in
{
  options.services.csfx-installer = {
    enable = lib.mkEnableOption "CSFX automatic node installer";

    delaySeconds = lib.mkOption {
      type = lib.types.int;
      default = 10;
      description = "Seconds to wait before starting installation";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      parted
      dosfstools
      e2fsprogs
      util-linux
      nixos-install-tools
    ];

    systemd.services.csfx-autoinstall = {
      description = "CSFX automatic node installer";
      after = [ "network-online.target" "getty.target" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];

      path = with pkgs; [ parted dosfstools e2fsprogs util-linux systemd coreutils nixos-install-tools ];

      serviceConfig = {
        Type = "oneshot";
        ExecStartPre = "${pkgs.coreutils}/bin/sleep ${toString cfg.delaySeconds}";
        ExecStart = installScript;
        StandardOutput = "journal+console";
        StandardError = "journal+console";
      };
    };
  };
}

{ config, lib, pkgs, installedSystem, ... }:

let
  cfg = config.services.csfx-autoinstall;

  parted = "${pkgs.parted}/bin/parted";
  partprobe = "${pkgs.parted}/bin/partprobe";
  udevadm = "${pkgs.systemd}/bin/udevadm";
  mkfsVfat = "${pkgs.dosfstools}/bin/mkfs.vfat";
  mkfsExt4 = "${pkgs.e2fsprogs}/bin/mkfs.ext4";
  nixosInstall = "${pkgs.nixos-install-tools}/bin/nixos-install";
  grubInstall = "${pkgs.grub2}/bin/grub-install";
  mount = "${pkgs.util-linux}/bin/mount";
  mkdir = "${pkgs.coreutils}/bin/mkdir";
  sleep = "${pkgs.coreutils}/bin/sleep";

  installScript = pkgs.writeShellScript "csfx-autoinstall" ''
    set -euo pipefail

    DISK="${cfg.disk}"
    TOPLEVEL="${installedSystem.config.system.build.toplevel}"

    if [ -d /sys/firmware/efi/efivars ]; then
      EFI=1
    else
      EFI=0
    fi

    echo "[INFO] starting autoinstall disk=''${DISK} efi=''${EFI}"

    ${parted} -s "$DISK" mklabel gpt
    ${parted} -s "$DISK" mkpart bios-boot 1MiB 2MiB
    ${parted} -s "$DISK" set 1 bios_grub on
    ${parted} -s "$DISK" mkpart ESP fat32 2MiB 514MiB
    ${parted} -s "$DISK" set 2 esp on
    ${parted} -s "$DISK" mkpart primary ext4 514MiB 20GiB
    ${parted} -s "$DISK" mkpart primary ext4 20GiB 100%

    ${partprobe} "$DISK"
    ${udevadm} settle --timeout=10

    WAIT=0
    while [ ! -b "''${DISK}4" ] && [ "$WAIT" -lt 30 ]; do
      ${sleep} 1
      WAIT=$((WAIT + 1))
    done

    if [ ! -b "''${DISK}4" ]; then
      echo "[ERROR] partition nodes did not appear disk=''${DISK}"
      exit 1
    fi

    ${mkfsVfat} -n boot "''${DISK}2"
    ${mkfsExt4} -L nixos "''${DISK}3"
    ${mkfsExt4} -L csfx-data "''${DISK}4"

    echo "[INFO] partitions formatted disk=''${DISK}"

    ${mkdir} -p /mnt
    ${mount} "''${DISK}3" /mnt
    ${mkdir} -p /mnt/boot
    ${mount} "''${DISK}2" /mnt/boot

    echo "[INFO] mounts ready target=/mnt"

    ${nixosInstall} \
      --system "$TOPLEVEL" \
      --no-root-password \
      --no-channel-copy \
      --no-bootloader \
      --root /mnt

    if [ "''${EFI}" = "1" ]; then
      echo "[INFO] installing GRUB EFI target=x86_64-efi"
      ${grubInstall} \
        --boot-directory=/mnt/boot \
        --efi-directory=/mnt/boot \
        --target=x86_64-efi \
        --removable \
        --recheck \
        "$DISK"
    else
      echo "[INFO] installing GRUB BIOS target=i386-pc"
      ${grubInstall} \
        --boot-directory=/mnt/boot \
        --target=i386-pc \
        --recheck \
        "$DISK"
    fi

    echo "[INFO] generating grub config"
    ${pkgs.nixos-install-tools}/bin/nixos-enter \
      --root /mnt -- \
      /run/current-system/bin/switch-to-configuration boot

    echo "[INFO] install complete rebooting"
    ${sleep} 2
    ${pkgs.systemd}/bin/systemctl reboot
  '';
in
{
  options.services.csfx-autoinstall = {
    enable = lib.mkEnableOption "CSFX automated disk installer";

    disk = lib.mkOption {
      type = lib.types.str;
      default = "/dev/sda";
      description = "Target disk for installation";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.csfx-autoinstall = {
      description = "CSFX automated disk installer";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" "local-fs.target" ];
      conflicts = [ "shutdown.target" ];

      environment = {
        PATH = lib.mkForce (lib.concatStringsSep ":" [
          "${pkgs.nix}/bin"
          "${pkgs.coreutils}/bin"
          "${pkgs.util-linux}/bin"
          "${pkgs.parted}/bin"
          "${pkgs.dosfstools}/bin"
          "${pkgs.e2fsprogs}/bin"
          "${pkgs.systemd}/bin"
          "${pkgs.grub2}/bin"
          "${pkgs.nixos-install-tools}/bin"
        ]);
      };

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = installScript;
        User = "root";
        StandardOutput = "journal+console";
        StandardError = "journal+console";
      };
    };
  };
}

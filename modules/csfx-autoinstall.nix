{ config, lib, pkgs, installedSystem, ... }:

let
  cfg = config.services.csfx-autoinstall;

  parted = "${pkgs.parted}/bin/parted";
  partprobe = "${pkgs.parted}/bin/partprobe";
  udevadm = "${pkgs.systemd}/bin/udevadm";
  mkfsVfat = "${pkgs.dosfstools}/bin/mkfs.vfat";
  mkfsExt4 = "${pkgs.e2fsprogs}/bin/mkfs.ext4";
  nixosInstall = "${pkgs.nixos-install-tools}/bin/nixos-install";
  mount = "${pkgs.util-linux}/bin/mount";
  mkdir = "${pkgs.coreutils}/bin/mkdir";
  sleep = "${pkgs.coreutils}/bin/sleep";

  installScript = pkgs.writeShellScript "csfx-autoinstall" ''
    set -euo pipefail

    DISK="${cfg.disk}"
    TOPLEVEL="${installedSystem.config.system.build.toplevel}"

    echo "[INFO] starting autoinstall disk=''${DISK}"

    ${parted} -s "$DISK" mklabel gpt
    ${parted} -s "$DISK" mkpart ESP fat32 1MiB 512MiB
    ${parted} -s "$DISK" set 1 esp on
    ${parted} -s "$DISK" mkpart primary ext4 512MiB 20GiB
    ${parted} -s "$DISK" mkpart primary ext4 20GiB 100%

    ${partprobe} "$DISK"
    ${udevadm} settle --timeout=10

    WAIT=0
    while [ ! -b "''${DISK}3" ] && [ "$WAIT" -lt 30 ]; do
      ${sleep} 1
      WAIT=$((WAIT + 1))
    done

    if [ ! -b "''${DISK}3" ]; then
      echo "[ERROR] partition nodes did not appear disk=''${DISK}"
      exit 1
    fi

    ${mkfsVfat} -n boot "''${DISK}1"
    ${mkfsExt4} -L nixos "''${DISK}2"
    ${mkfsExt4} -L csfx-data "''${DISK}3"

    echo "[INFO] partitions formatted disk=''${DISK}"

    ${mkdir} -p /mnt
    ${mount} "''${DISK}2" /mnt
    ${mkdir} -p /mnt/boot
    ${mount} "''${DISK}1" /mnt/boot

    echo "[INFO] mounts ready target=/mnt"

    ${nixosInstall} \
      --system "$TOPLEVEL" \
      --no-root-password \
      --no-channel-copy \
      --root /mnt

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

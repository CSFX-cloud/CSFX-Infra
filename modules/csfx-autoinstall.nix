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
  whiptail = "${pkgs.newt}/bin/whiptail";

  installScript = pkgs.writeShellScript "csfx-autoinstall" ''
    set -euo pipefail

    DISK="${cfg.disk}"
    TOPLEVEL="${installedSystem.config.system.build.toplevel}"

    list_candidates() {
      for candidate in /dev/vda /dev/nvme0n1 /dev/nvme1n1 /dev/sda /dev/sdb /dev/sdc /dev/xvda; do
        if [ ! -b "$candidate" ]; then
          continue
        fi
        DEVNAME="$(${pkgs.coreutils}/bin/basename "$candidate")"
        REMOVABLE="/sys/block/''${DEVNAME}/removable"
        if [ -f "$REMOVABLE" ] && [ "$(cat "$REMOVABLE")" = "1" ]; then
          echo "[INFO] skipping removable device=$candidate" >&2
          continue
        fi
        CDROM="/sys/block/''${DEVNAME}/device/type"
        if [ -f "$CDROM" ] && [ "$(cat "$CDROM")" = "5" ]; then
          echo "[INFO] skipping cdrom device=$candidate" >&2
          continue
        fi
        echo "$candidate"
      done
    }

    select_disk() {
      local choice index=1
      echo ""
      echo "CSFX installer: every disk listed below will lose all data once selected."
      for candidate in "$@"; do
        echo "  [$index] $candidate"
        lsblk -dno SIZE,MODEL "$candidate" | sed 's/^/        /'
        lsblk -no NAME,FSTYPE,LABEL "$candidate" | tail -n +2 | sed 's/^/        /'
        index=$((index + 1))
      done
      choice=1
      if [ "$#" -gt 1 ]; then
        read -r -p "Select target disk number: " choice 2> /dev/tty
      fi
      case "$choice" in
        ""|*[!0-9]*) echo "[ERROR] invalid selection"; exit 1 ;;
      esac
      DISK="$(printf '%s\n' "$@" | sed -n "''${choice}p")"
      if [ -z "$DISK" ]; then
        echo "[ERROR] invalid selection"
        exit 1
      fi
      if ! ${whiptail} --title "CSFX installer" --defaultno --yesno "Erase $DISK and install CSFX?\n\nAll data on this disk will be lost." 10 60 > /dev/tty; then
        echo "[ERROR] installation aborted by user disk=''${DISK}"
        exit 1
      fi
    }

    if [ "$DISK" = "auto" ]; then
      mapfile -t CANDIDATES < <(list_candidates)
    else
      CANDIDATES=("$DISK")
    fi

    if [ "''${#CANDIDATES[@]}" -eq 0 ]; then
      echo "[ERROR] no target disk found"
      exit 1
    fi

    if grep -qw 'csfx.autoinstall=yes' /proc/cmdline; then
      DISK="''${CANDIDATES[0]}"
      echo "[WARN] unattended install selected by kernel parameter disk=''${DISK}"
    else
      select_disk "''${CANDIDATES[@]}"
    fi

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
    ${udevadm} settle --timeout=15

    case "$DISK" in
      /dev/nvme*|/dev/mmcblk*) PART="''${DISK}p" ;;
      *) PART="$DISK" ;;
    esac

    WAIT=0
    while [ ! -b "''${PART}4" ] && [ "$WAIT" -lt 30 ]; do
      ${sleep} 1
      WAIT=$((WAIT + 1))
    done

    if [ ! -b "''${PART}4" ]; then
      echo "[ERROR] partition nodes did not appear disk=''${DISK}"
      exit 1
    fi

    ${mkfsVfat} -n boot "''${PART}2"
    ${mkfsExt4} -L nixos "''${PART}3"
    ${mkfsExt4} -L csfx-data "''${PART}4"

    ${udevadm} settle --timeout=10

    echo "[INFO] partitions formatted disk=''${DISK}"

    ${mkdir} -p /mnt
    ${mount} "''${PART}3" /mnt
    ${mkdir} -p /mnt/boot
    ${mount} "''${PART}2" /mnt/boot

    echo "[INFO] mounts ready target=/mnt"

    if [ "$EFI" = "0" ]; then
      echo "[INFO] BIOS mode: embedding GRUB i386-pc before nixos-install disk=''${DISK}"
      ${pkgs.grub2}/bin/grub-install \
        --boot-directory=/mnt/boot \
        --target=i386-pc \
        --directory="${pkgs.grub2}/lib/grub/i386-pc" \
        --recheck \
        "$DISK"
    fi

    ${nixosInstall} \
      --system "$TOPLEVEL" \
      --no-root-password \
      --no-channel-copy \
      --root /mnt

    if [ "$EFI" = "0" ]; then
      echo "[INFO] BIOS mode: re-embedding GRUB after nixos-install disk=''${DISK}"
      ${pkgs.grub2}/bin/grub-install \
        --boot-directory=/mnt/boot \
        --target=i386-pc \
        --directory="${pkgs.grub2}/lib/grub/i386-pc" \
        --recheck \
        "$DISK"
    fi

    echo "[INFO] verifying install"
    ${pkgs.util-linux}/bin/lsblk -o NAME,LABEL,FSTYPE,SIZE,MOUNTPOINT
    ls /mnt/boot/grub/ 2>/dev/null && echo "[INFO] grub dir exists" || echo "[WARN] grub dir missing"
    ls /mnt/boot/grub/grub.cfg 2>/dev/null && echo "[INFO] grub.cfg exists" || echo "[WARN] grub.cfg missing"

    echo "[INFO] install complete rebooting"
    ${sleep} 5
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
      conflicts = [ "shutdown.target" "getty@tty1.service" "autovt@tty1.service" ];

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
          "${pkgs.gnused}/bin"
          "${pkgs.gnugrep}/bin"
        ]);
        TERM = "linux";
        NEWT_COLORS = lib.concatStringsSep ";" [
          "root=white,black"
          "window=white,black"
          "border=white,black"
          "shadow=black,black"
          "title=white,black"
          "textbox=white,black"
          "button=black,white"
          "actbutton=black,cyan"
          "compactbutton=white,black"
          "roottext=white,black"
          "emptyscale=,black"
          "fullscale=,white"
        ];
      };

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = installScript;
        User = "root";
        Restart = "on-failure";
        RestartSec = "5s";
        StandardInput = "tty-force";
        TTYPath = "/dev/tty1";
        TTYReset = true;
        TTYVHangup = true;
        StandardOutput = "journal+console";
        StandardError = "journal+console";
      };
    };
  };
}

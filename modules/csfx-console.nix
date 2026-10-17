{ config, lib, pkgs, versions, ... }:

let
  cfg = config.services.csfx-console;
  gateway = "${config.services.csfx-cp.gatewayPackage}/bin/api-gateway";

  logoFile = pkgs.writeText "csfx-logo" ''
     ██████╗███████╗███████╗██╗  ██╗
    ██╔════╝██╔════╝██╔════╝╚██╗██╔╝
    ██║     ███████╗█████╗   ╚███╔╝
    ██║     ╚════██║██╔══╝   ██╔██╗
    ╚██████╗███████║██║     ██╔╝ ██╗
     ╚═════╝╚══════╝╚═╝     ╚═╝  ╚═╝
  '';

  helper = pkgs.writeShellScript "csfx-console-helper" ''
    set -euo pipefail

    case "''${1:-}" in
      console-auth|console-pin-change|console-pin-init|reset-admin|ssh-disable)
        set -a
        . ${config.services.csfx-cp.envFile}
        set +a
        command="--$1"
        shift
        exec ${gateway} "$command" "$@"
        ;;
      setup-code)
        exec ${pkgs.coreutils}/bin/cat /run/csfx/setup-code
        ;;
      reboot)
        exec ${pkgs.systemd}/bin/systemctl reboot
        ;;
      poweroff)
        exec ${pkgs.systemd}/bin/systemctl poweroff
        ;;
      *)
        echo "[ERROR] unsupported helper command command=''${1:-}" >&2
        exit 64
        ;;
    esac
  '';

  menu = (pkgs.writeShellScriptBin "csfx-console-menu" ''
    trap "" INT TSTP QUIT

    CURL=${pkgs.curl}/bin/curl
    JQ=${pkgs.jq}/bin/jq
    SUDO=/run/wrappers/bin/sudo
    HELPER=${helper}
    LOGGER=${pkgs.util-linux}/bin/logger
    MIN_PIN_LENGTH=8

    log() {
      $LOGGER -t csfx-console "$*"
    }

    clear_screen() {
      printf '\033[2J\033[H'
    }

    primary_ip() {
      ${pkgs.iproute2}/bin/ip -4 addr show scope global 2>/dev/null \
        | ${pkgs.gnugrep}/bin/grep -oP '(?<=inet\s)\d+(\.\d+){3}' \
        | ${pkgs.coreutils}/bin/head -1
    }

    pause() {
      printf '\nPress ENTER to continue.'
      read -r _
    }

    confirm() {
      local answer
      read -r -p 'Type YES to confirm: ' answer
      [ "$answer" = "YES" ]
    }

    draw_header() {
      clear_screen
      ${pkgs.coreutils}/bin/cat ${logoFile}
      printf 'CSFX Node -- v%s\n' '${versions.csfx.version}'
      printf 'IP: %s\n\n' "''${1:-unknown}"
    }

    draw_state() {
      local state="$1" status="$2" ip="$3"
      case "$state" in
        setup_required)
          printf 'Setup required.\n\n'
          printf 'Open:         https://%s:8000/setup\n' "$ip"
          printf 'Setup code:   %s\n\n' "$($SUDO $HELPER setup-code)"
          printf 'CA fingerprint (SHA-256), compare with the browser warning:\n%s\n' \
            "$(printf '%s' "$status" | $JQ -r '.ca_fingerprint // "unavailable"')"
          printf '\nTo join an existing cluster instead, choose the join option on the setup page.\n'
          ;;
        ready)
          printf 'Web UI: https://%s:8000\n\nPress ENTER for the console menu.\n' "$ip"
          ;;
        worker)
          printf 'Worker node. Managed from the cluster web UI.\n'
          printf 'Agent: %s\n' "$(${pkgs.systemd}/bin/systemctl is-active csfx-agent.service)"
          ;;
        *)
          if [ -z "$ip" ]; then
            printf 'No network address. Check cable and DHCP.\n'
            ${pkgs.iproute2}/bin/ip -br link 2>/dev/null
          else
            printf 'CSFX is starting. This can take a few minutes.\n'
          fi
          ;;
      esac
    }

    read_new_pin() {
      local -n result=$1
      local first second
      read -r -s -p "New console PIN (min $MIN_PIN_LENGTH characters): " first
      printf '\n'
      read -r -s -p 'Repeat PIN: ' second
      printf '\n'
      if [ "$first" != "$second" ] || [ "''${#first}" -lt "$MIN_PIN_LENGTH" ]; then
        printf 'PINs differ or are too short.\n'
        return 1
      fi
      result=$first
    }

    show_recovery_key() {
      local key
      key=$(printf '%s' "$1" | ${pkgs.gnused}/bin/sed -n 's/^recovery_key=//p')
      printf '\nRecovery key, shown once. Store it offline:\n\n  %s\n' "$key"
      pause
    }

    provision_pin() {
      local email password pin output
      printf 'No console PIN is set. Authenticate as a cluster admin to set one.\n'
      read -r -p 'Admin email: ' email
      read -r -s -p 'Admin password: ' password
      printf '\n'
      read_new_pin pin || return 1
      if ! output=$(printf '%s\n%s\n%s\n' "$email" "$password" "$pin" | $SUDO $HELPER console-pin-init 2>&1); then
        printf 'Failed: %s\n' "$output"
        return 1
      fi
      log "event=console.pin_provisioned"
      show_recovery_key "$output"
    }

    authenticate() {
      local pin output code
      printf '\nConsole PIN or recovery key: '
      read -r -s pin
      printf '\n'
      output=$(printf '%s\n' "$pin" | $SUDO $HELPER console-auth 2>&1)
      code=$?
      case $code in
        0) return 0 ;;
        2) printf '%s\n' "$output" ;;
        3) provision_pin && return 0 ;;
        *) log "event=console.pin_failed"; printf 'Rejected.\n' ;;
      esac
      sleep 2
      return 1
    }

    reset_admin() {
      local email output
      printf 'Admin accounts:\n'
      $SUDO $HELPER reset-admin | ${pkgs.gnused}/bin/sed 's/^admin=/  /'
      read -r -p 'Email to reset (empty to cancel): ' email
      [ -n "$email" ] || return 0
      if ! output=$($SUDO $HELPER reset-admin "$email" 2>&1); then
        printf 'Failed: %s\n' "$output"
        pause
        return 0
      fi
      log "event=console.admin_reset user=$email"
      printf 'Temporary password: %s\n' \
        "$(printf '%s' "$output" | ${pkgs.gnused}/bin/sed -n 's/^temporary_password=//p')"
      printf 'The user must change it at next login. Two-factor was disabled.\n'
      pause
    }

    disable_ssh() {
      if confirm && $SUDO $HELPER ssh-disable; then
        log "event=console.ssh_disabled"
        printf 'SSH access disabled for the whole cluster.\n'
      fi
      pause
    }

    change_pin() {
      local current new output
      read -r -s -p 'Current PIN or recovery key: ' current
      printf '\n'
      read_new_pin new || { pause; return 0; }
      if ! output=$(printf '%s\n%s\n' "$current" "$new" | $SUDO $HELPER console-pin-change 2>&1); then
        printf 'Failed: %s\n' "$output"
        pause
        return 0
      fi
      log "event=console.pin_changed"
      show_recovery_key "$output"
    }

    run_console() {
      local choice
      authenticate || return 0
      log "event=console.login"
      while true; do
        clear_screen
        printf 'CSFX console\n\n'
        printf '  1  Service status\n'
        printf '  2  Reset admin password\n'
        printf '  3  Disable SSH access\n'
        printf '  4  Change console PIN\n'
        printf '  5  Reboot\n'
        printf '  6  Shut down\n'
        printf '  0  Lock console\n\n'
        read -r -p 'Select: ' choice
        case "$choice" in
          1) /run/current-system/sw/bin/csfx-status; pause ;;
          2) reset_admin ;;
          3) disable_ssh ;;
          4) change_pin ;;
          5) if confirm; then $SUDO $HELPER reboot; fi ;;
          6) if confirm; then $SUDO $HELPER poweroff; fi ;;
          0) return 0 ;;
        esac
      done
    }

    while true; do
      ip=$(primary_ip)
      status=$($CURL -sk --max-time 3 https://localhost:8000/api/setup/status 2>/dev/null)
      state=$(printf '%s' "$status" | $JQ -r '.state // empty' 2>/dev/null)
      [ -e ${config.services.csfx-cp.workerMarker} ] && state=worker
      draw_header "$ip"
      draw_state "$state" "$status" "$ip"
      if read -r -t 10 -s -n 1 key; then
        if [ "$state" = "ready" ]; then
          run_console
        fi
      fi
    done
  '') // { shellPath = "/bin/csfx-console-menu"; };
in
{
  options.services.csfx-console = {
    enable = lib.mkEnableOption "CSFX restricted local console";
  };

  config = lib.mkIf cfg.enable {
    users.groups.csfx-console = { };

    users.users.csfx-console = {
      isNormalUser = true;
      group = "csfx-console";
      createHome = false;
      home = "/var/empty";
      hashedPassword = "!";
      shell = menu;
    };

    environment.shells = [ menu ];

    security.sudo.extraRules = [{
      users = [ "csfx-console" ];
      commands = [{ command = "${helper}"; options = [ "NOPASSWD" ]; }];
    }];

    boot.kernelParams = [ "console=ttyS0,115200" "console=tty0" ];

    services.getty.autologinUser = "csfx-console";
    services.getty.helpLine = lib.mkForce "";
  };
}

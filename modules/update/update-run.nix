{ pkgs, updater }:
pkgs.writeShellScript "csfx-updater-run" ''
  set -euo pipefail

  vip=$(${pkgs.gnused}/bin/sed -n 's/^CSFX_VIP_ADDRESS=//p' /etc/csfx/cluster.env 2>/dev/null || true)
  if [ -z "$vip" ] && [ -f /var/lib/csfx-agent/config.json ]; then
    vip=$(${pkgs.jq}/bin/jq -r '.gateway_url // empty | sub("^https?://"; "") | sub(":.*$"; "")' /var/lib/csfx-agent/config.json)
  fi

  case "$vip" in
    ""|localhost|127.*) ;;
    *) export PEER_SUBSTITUTERS="http://$vip:5000" ;;
  esac

  exec ${updater}/bin/csfx-updater "$@"
''

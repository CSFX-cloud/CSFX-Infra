{ pkgs, chain, mastersFile, agentConfig, joinEnvFile, etcdEndpoint, etcdPeerPort }:

pkgs.writeShellScript "csfx-mesh-acl" ''
  set -euo pipefail

  IPTABLES=${pkgs.iptables}/bin/iptables
  ip_pattern='[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'

  $IPTABLES -n -L ${chain} > /dev/null 2>&1 || exit 0

  own=""
  if [ -f ${agentConfig} ]; then
    own=$(${pkgs.jq}/bin/jq -r '.wg_tunnel_ip // empty' ${agentConfig})
  fi

  from_join=""
  if [ -f ${joinEnvFile} ]; then
    from_join=$(${pkgs.gnugrep}/bin/grep '^ETCD_INITIAL_CLUSTER=' ${joinEnvFile} | ${pkgs.gnugrep}/bin/grep -oE "$ip_pattern" || true)
  fi

  from_etcd=$(${pkgs.etcd}/bin/etcdctl --endpoints=${etcdEndpoint} member list 2>/dev/null | ${pkgs.gnugrep}/bin/grep -oE "https?://$ip_pattern:${toString etcdPeerPort}" | ${pkgs.gnugrep}/bin/grep -oE "$ip_pattern" || true)
  if [ -n "$from_etcd" ]; then
    printf '%s\n' "$from_etcd" | ${pkgs.coreutils}/bin/sort -u > ${mastersFile}
  fi
  cached=$(${pkgs.coreutils}/bin/cat ${mastersFile} 2>/dev/null || true)

  masters=$(printf '%s\n' "$own" "$from_join" "$from_etcd" "$cached" | ${pkgs.gnugrep}/bin/grep -E "^$ip_pattern$" | ${pkgs.coreutils}/bin/sort -u || true)

  staging=$(${pkgs.coreutils}/bin/mktemp)
  trap '${pkgs.coreutils}/bin/rm -f "$staging"' EXIT
  {
    echo "*filter"
    echo ":${chain} - [0:0]"
    if [ -z "$masters" ]; then
      echo "-A ${chain} -j ACCEPT"
    else
      for master in $masters; do
        echo "-A ${chain} -s $master/32 -j ACCEPT"
      done
      echo "-A ${chain} -j DROP"
    fi
    echo "COMMIT"
  } > "$staging"
  ${pkgs.iptables}/bin/iptables-restore --noflush < "$staging"
  echo "[INFO] mesh acl applied masters=$(echo $masters | ${pkgs.coreutils}/bin/tr ' ' ',')"
''

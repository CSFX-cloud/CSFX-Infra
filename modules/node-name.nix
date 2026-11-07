pkgs:
pkgs.writeShellScript "csfx-node-name" ''
  printf 'csfx-%s' "$(${pkgs.coreutils}/bin/cut -c1-8 /etc/machine-id)"
''

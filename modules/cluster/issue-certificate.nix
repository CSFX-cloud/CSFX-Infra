{ pkgs, caCert, caKey, renewBeforeSeconds }:

''
  issue() {
    local name="$1" common_name="$2" subject_alt_names="$3" certificate="$4" key="$5"
    local marker="$certificate.sans" workdir

    if [ -s "$certificate" ] && [ -s "$key" ] \
      && [ "$(${pkgs.coreutils}/bin/cat "$marker" 2>/dev/null)" = "$subject_alt_names" ] \
      && ${pkgs.openssl}/bin/openssl x509 -checkend ${toString renewBeforeSeconds} -noout -in "$certificate" > /dev/null; then
      return 0
    fi

    workdir=$(${pkgs.coreutils}/bin/mktemp -d)
    ${pkgs.openssl}/bin/openssl req -new -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 -nodes \
      -keyout "$workdir/key.pem" -subj "/CN=$common_name" -out "$workdir/request.pem"
    printf 'subjectAltName=%s\nextendedKeyUsage=serverAuth,clientAuth\nkeyUsage=digitalSignature\n' "$subject_alt_names" > "$workdir/extensions.cnf"
    ${pkgs.openssl}/bin/openssl x509 -req -in "$workdir/request.pem" -CA ${caCert} -CAkey ${caKey} \
      -CAcreateserial -CAserial "$workdir/serial" -days 365 -extfile "$workdir/extensions.cnf" -out "$workdir/certificate.pem"
    ${pkgs.coreutils}/bin/install -m 0600 "$workdir/key.pem" "$key"
    ${pkgs.coreutils}/bin/install -m 0644 "$workdir/certificate.pem" "$certificate"
    printf '%s' "$subject_alt_names" > "$marker"
    ${pkgs.coreutils}/bin/rm -rf "$workdir"
    echo "[INFO] certificate issued name=$name"
  }
''

#!/usr/bin/env bash
set -euo pipefail

config=$1
arch=$2
version=$3
out=$4
shift 4
key_files=("$@")
key_file=${key_files[0]}

cache_url="https://cache.nixos.org"
bundle="csfx-${version}-${arch}.tar.zst"
manifest="${out}/manifest-${arch}.json"

mkdir -p "$out"
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

toplevel=$(nix build --no-link --print-out-paths ".#nixosConfigurations.${config}.config.system.build.toplevel")

nix path-info -r "$toplevel" > "$work/all"
xargs -P 16 -I{} sh -c 'curl -fsI -o /dev/null "'"$cache_url"'/$(basename "{}" | cut -c1-32).narinfo" || echo "{}"' \
  < "$work/all" > "$work/missing"

for extra_key in "${key_files[@]:1}"; do
  nix store sign --key-file "$extra_key" --recursive "$toplevel"
done

xargs nix copy --to "file://${work}/cache?compression=none&secret-key=${key_file}" < "$work/missing"

grep -vxFf "$work/missing" "$work/all" | while read -r path; do
  narinfo="${work}/cache/$(basename "$path" | cut -c1-32).narinfo"
  [ -f "$narinfo" ] || continue
  rm -f "${work}/cache/$(sed -n 's/^URL: //p' "$narinfo")" "$narinfo"
done
tar -C "$work/cache" -cf - . | zstd -19 -T0 -o "${out}/${bundle}"

jq -n --arg version "$version" --arg arch "$arch" --arg toplevel "$toplevel" --arg bundle "$bundle" \
  '{version: $version, arch: $arch, toplevel: $toplevel, bundle: $bundle, released_at: (now | todate)}' \
  > "$manifest"

: > "${manifest}.sig"
for signing_key in "${key_files[@]}"; do
  seed_hex=$(cut -d: -f2 "$signing_key" | base64 -d | head -c 32 | xxd -p -c 64)
  printf '302e020100300506032b657004220420%s' "$seed_hex" | xxd -r -p | openssl pkey -inform DER -outform PEM -out "$work/signing.pem"
  openssl pkeyutl -sign -inkey "$work/signing.pem" -rawin -in "$manifest" -out "$work/manifest.sig"
  base64 -w0 "$work/manifest.sig" >> "${manifest}.sig"
  printf '\n' >> "${manifest}.sig"
done

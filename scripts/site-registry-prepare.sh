#!/usr/bin/env bash
set -euo pipefail

CP_ENV_FILE="${CP_ENV_FILE:-/etc/csfx/cp.env}"
SITE_ENV_FILE="${SITE_ENV_FILE:-/run/csfx-site/site.env}"
REGISTRY_PORT="${REGISTRY_PORT:-5060}"
REGISTRY_SERVICE="${REGISTRY_SERVICE:-csfx-site-registry}"
STORAGE_MODE="${STORAGE_MODE:-garage}"
BUCKET="${BUCKET:-csfx-site-images}"
GARAGE_ADMIN_URL="${GARAGE_ADMIN_URL:-http://127.0.0.1:3903}"
GARAGE_S3_URL="${GARAGE_S3_URL:-http://127.0.0.1:3900}"
GARAGE_REGION="${GARAGE_REGION:-csfx}"
SITE_BUILDER_URL="${SITE_BUILDER_URL:-http://127.0.0.1:8007}"
STATE_DIR="${STATE_DIR:?STATE_DIR is required}"
RUNTIME_DIR="${RUNTIME_DIRECTORY:?RUNTIME_DIRECTORY is required}"
GC_INTERVAL="${GC_INTERVAL:-1h}"
RETRY_ATTEMPTS="${RETRY_ATTEMPTS:-90}"
RETRY_DELAY="${RETRY_DELAY:-5}"

log() {
    echo "[$1] $2"
}

env_value() {
    local file=$1 key=$2
    grep -m1 "^${key}=" "$file" | cut -d= -f2-
}

derive() {
    printf '%s' "$1" | openssl dgst -sha256 -hmac "$SITE_SECRET" -hex | awk '{print $NF}'
}

retry() {
    local attempt=1
    until "$@"; do
        if [ "$attempt" -ge "$RETRY_ATTEMPTS" ]; then
            log ERROR "giving up after $attempt attempts command=$1"
            return 1
        fi
        attempt=$((attempt + 1))
        sleep "$RETRY_DELAY"
    done
}

garage() {
    curl -fsS -H "Authorization: Bearer $GARAGE_ADMIN_TOKEN" -H 'Content-Type: application/json' "$@"
}

import_key() {
    if garage "$GARAGE_ADMIN_URL/v2/GetKeyInfo?id=$ACCESS_KEY" >/dev/null 2>&1; then
        return 0
    fi
    garage -X POST "$GARAGE_ADMIN_URL/v2/ImportKey" \
        -d "$(jq -n --arg id "$ACCESS_KEY" --arg secret "$SECRET_KEY" \
            '{accessKeyId: $id, secretAccessKey: $secret, name: "csfx-site-registry"}')" >/dev/null
}

ensure_bucket() {
    local info
    if info=$(garage "$GARAGE_ADMIN_URL/v2/GetBucketInfo?globalAlias=$BUCKET" 2>/dev/null); then
        jq -r '.id' <<<"$info"
        return 0
    fi
    garage -X POST "$GARAGE_ADMIN_URL/v2/CreateBucket" \
        -d "$(jq -n --arg alias "$BUCKET" '{globalAlias: $alias}')" | jq -r '.id'
}

provision_garage() {
    import_key
    local bucket_id
    bucket_id=$(ensure_bucket)
    garage -X POST "$GARAGE_ADMIN_URL/v2/AllowBucketKey" \
        -d "$(jq -n --arg bucket "$bucket_id" --arg key "$ACCESS_KEY" \
            '{bucketId: $bucket, accessKeyId: $key, permissions: {read: true, write: true, owner: true}}')" >/dev/null
    log INFO "garage bucket ready bucket=$BUCKET"
}

fetch_certificate() {
    curl -fsS "$SITE_BUILDER_URL/registry/certificate" -o "$RUNTIME_DIR/token.crt"
}

storage_driver() {
    jq -n --arg bucket "$BUCKET" --arg endpoint "$GARAGE_S3_URL" --arg region "$GARAGE_REGION" \
        --arg access "$ACCESS_KEY" --arg secret "$SECRET_KEY" \
        '{name: "s3", rootdirectory: "/zot", region: $region, regionendpoint: $endpoint, bucket: $bucket,
          secure: false, forcepathstyle: true, accesskey: $access, secretkey: $secret}'
}

render_config() {
    local driver='null'
    if [ "$STORAGE_MODE" = "garage" ]; then
        driver=$(storage_driver)
    fi
    jq -n --arg state "$STATE_DIR" --arg port "$REGISTRY_PORT" --arg realm "$CALLBACK_URL/registry/token" \
        --arg service "$REGISTRY_SERVICE" --arg cert "$RUNTIME_DIR/token.crt" --arg gc "$GC_INTERVAL" \
        --argjson driver "$driver" \
        '{distSpecVersion: "1.1.0",
          storage: ({rootDirectory: $state, dedupe: false, gc: true, gcDelay: $gc, gcInterval: $gc,
                     retention: {policies: [{repositories: ["**"], deleteReferrers: false, deleteUntagged: true}]}}
                    + (if $driver == null then {} else {storageDriver: $driver} end)),
          http: {address: "0.0.0.0", port: $port,
                 auth: {bearer: {realm: $realm, service: $service, cert: $cert}}},
          log: {level: "info"}}' >"$RUNTIME_DIR/config.json"
}

hand_over() {
    local owner
    owner="$(stat -c %u "$RUNTIME_DIR"):$(stat -c %g "$RUNTIME_DIR")"
    chown "$owner" "$RUNTIME_DIR/config.json" "$RUNTIME_DIR/token.crt"
    chmod 0600 "$RUNTIME_DIR/config.json"
    chmod 0644 "$RUNTIME_DIR/token.crt"
}

main() {
    SITE_SECRET=$(env_value "$CP_ENV_FILE" CSFX_SITE_SECRET)
    GARAGE_ADMIN_TOKEN=$(env_value "$CP_ENV_FILE" GARAGE_ADMIN_TOKEN)
    CALLBACK_URL=$(env_value "$SITE_ENV_FILE" CSFX_SITE_CALLBACK_URL)
    [ -n "$SITE_SECRET" ] && [ -n "$CALLBACK_URL" ] || { log ERROR "site secret or callback url missing"; exit 1; }
    ACCESS_KEY="GK$(derive registry-key-id | cut -c1-24)"
    SECRET_KEY=$(derive registry-key-secret)
    mkdir -p "$STATE_DIR"
    if [ "$STORAGE_MODE" = "garage" ]; then
        retry provision_garage
    fi
    retry fetch_certificate
    render_config
    hand_over
    log INFO "site registry prepared storage=$STORAGE_MODE port=$REGISTRY_PORT"
}

main

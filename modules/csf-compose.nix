{ config, lib, pkgs, versions, ... }:

let
  v = versions.csf;
  ghcrOrg = "csfx-cloud";
  imageRef = svc: "ghcr.io/${ghcrOrg}/csf-ce-${svc}@${v.images.${svc}.digest}";

  composeFile = pkgs.writeText "csf-docker-compose.yml" ''
    services:
      etcd:
        image: quay.io/coreos/etcd:v3.5.12
        restart: unless-stopped
        command:
          - etcd
          - --data-dir=/data
          - --listen-client-urls=http://0.0.0.0:2379
          - --advertise-client-urls=http://localhost:2379
        volumes:
          - etcd-data:/data
        network_mode: host

      csf-api-gateway:
        image: ${imageRef "api-gateway"}
        restart: unless-stopped
        env_file: /etc/csf/cp.env
        network_mode: host
        depends_on: [etcd]

      csf-registry:
        image: ${imageRef "registry"}
        restart: unless-stopped
        env_file: /etc/csf/cp.env
        network_mode: host
        depends_on: [etcd]

      csf-scheduler:
        image: ${imageRef "scheduler"}
        restart: unless-stopped
        env_file: /etc/csf/cp.env
        network_mode: host
        depends_on: [etcd]

      csf-volume-manager:
        image: ${imageRef "volume-manager"}
        restart: unless-stopped
        env_file: /etc/csf/cp.env
        network_mode: host
        depends_on: [etcd]

      csf-failover-controller:
        image: ${imageRef "failover-controller"}
        restart: unless-stopped
        env_file: /etc/csf/cp.env
        network_mode: host
        depends_on: [etcd]

      csf-sdn-controller:
        image: ${imageRef "sdn-controller"}
        restart: unless-stopped
        env_file: /etc/csf/cp.env
        network_mode: host
        depends_on: [etcd]

    volumes:
      etcd-data:
  '';
in
{
  config = {
    environment.etc."csf/docker-compose.yml".source = composeFile;
  };
}

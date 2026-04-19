{ config, lib, pkgs, versions, ... }:

let
  v = versions.csfx;
  ghcrOrg = "csfx-cloud";
  imageRef = svc: "ghcr.io/${ghcrOrg}/csfx-ce-${svc}@${v.images.${svc}.digest}";

  composeFile = pkgs.substituteAll {
    src = ./docker-compose.yml;
    image_api_gateway         = imageRef "api-gateway";
    image_registry            = imageRef "registry";
    image_scheduler           = imageRef "scheduler";
    image_volume_manager      = imageRef "volume-manager";
    image_failover_controller = imageRef "failover-controller";
    image_sdn_controller      = imageRef "sdn-controller";
    image_patroni             = if v.images ? patroni then imageRef "patroni" else "ghcr.io/${ghcrOrg}/csfx-ce-patroni:latest";
  };
in
{
  config = {
    environment.etc."csfx/docker-compose.yml".source = composeFile;
    environment.etc."csfx/haproxy.cfg".source = ./haproxy.cfg;
  };
}

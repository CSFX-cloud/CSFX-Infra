{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "zot";
  version = "2.1.2";

  src = fetchFromGitHub {
    owner = "project-zot";
    repo = "zot";
    rev = "v${version}";
    hash = "sha256-tVvqNA7imLmVQoO7giEtktJkgQTaaWjkB/aYM+or6kg=";
  };

  vendorHash = "sha256-TEtbIM4BWyCV4vd8EV1sKXRI679vT4Ydg6cdfFr5JiU=";

  subPackages = [ "cmd/zot" ];

  doCheck = false;

  ldflags = [
    "-s"
    "-w"
    "-X zotregistry.dev/zot/pkg/api/config.ReleaseTag=v${version}"
  ];

  meta = {
    description = "OCI-native registry and image store, used as pull-through cache";
    homepage = "https://zotregistry.dev";
    license = lib.licenses.asl20;
    mainProgram = "zot";
  };
}

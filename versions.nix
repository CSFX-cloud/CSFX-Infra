{
  csfx = {
    version = "0.2.2-alpha.462";
    images = {
      patroni = { digest = "sha256:f03bce9c5378aea4dcdcf3ffaa8331193363383e74c71b81956b17e4fe9ccb82"; };
    };
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-agent-amd64";
        sha256 = "26700e758653e4a9bac92101469c2ed72ac013509d79365bdf06fe3c356d3427";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-agent-arm64";
        sha256 = "0bb4d15eb7ea245099b336877d27857dde85ad42b0e5e81773533908d634653a";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-cp-csfx-migrate-amd64";
          sha256 = "1483f6807c9b3de27ebe5728d84910ad0c4bb54de3d895178f0b8a92aabbcd30";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-cp-csfx-migrate-arm64";
          sha256 = "35781460e5525533f49704f5e5b8cc423f6e5f1aaba199db5af8d23caa08e296";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-cp-api-gateway-amd64";
          sha256 = "a3514deb8441a56b4e56bd6b31992b9025232d1eebee4fc58de704a576de294f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-cp-api-gateway-arm64";
          sha256 = "d6c8b9d15353f3d2086fb3344d955b8d08d2e8bf5eed5b581d5582aa88b94300";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-cp-registry-amd64";
          sha256 = "ebd32843f6bfa76e3d8bc3634ed20c28fdfc7292e2ab306351e1079aa6d73db6";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-cp-registry-arm64";
          sha256 = "0699ecaeb24e94d2c1d6848cda0082b365f4311a996d628d5546697f6fafb45e";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-cp-scheduler-amd64";
          sha256 = "60cd8b9aec436727651a0eb2d6885dfb33ba0ca335788bc04cacedb07aceeee3";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-cp-scheduler-arm64";
          sha256 = "fb7105ff1d87305de0ebdc1aa1ca5ddb3ffdf752e9996b7b5bdf875923703a38";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-cp-volume-manager-amd64";
          sha256 = "4d1b2800defd7535ca3fa2af6f14da77ae2b42c2604e0180006cfec9b985a490";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-cp-volume-manager-arm64";
          sha256 = "a9c81798c13e095d86a9ce552709165de0a6d960513655793d490a8156af2c9d";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-cp-failover-controller-amd64";
          sha256 = "a937f00dcee499340a2f69ddeb998cdac054a39ba2bbad60466a391c230cd985";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-cp-failover-controller-arm64";
          sha256 = "04bd6d4dc1b3d9690a4ea8e3f467205055fb4183924fb462eddac789702927d1";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-cp-sdn-controller-amd64";
          sha256 = "e7b824ef957ef1fa9a9c84056148582788ca88d675fee68ce12477c336400f94";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.462/csfx-cp-sdn-controller-arm64";
          sha256 = "4b42e03133acf6c4b0728e2a9077fdf5f7d4fd0cf9fb4d7e581d4fc4b29d8ad8";
        };
      };
    };
  };
}

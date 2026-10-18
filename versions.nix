{
  firecrackerGuestKernel = {
    amd64 = {
      url    = "https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.9/x86_64/vmlinux-6.1.102";
      sha256 = "3b6e45c66d1b66d4fb0a1528107abbe890972f94e902bafe85fdf5108288c575";
    };
    arm64 = {
      url    = "https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.9/aarch64/vmlinux-6.1.102";
      sha256 = "aee80c3ab9bc2d32f4c00de8ddf919c200359a400aae7c4710e8bc8ad438e1c4";
    };
  };
  csfx = {
    version = "0.2.2-alpha.906";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-agent-amd64";
        sha256 = "26f31cebaa5bdb64161ad4c3ff8f7350f6c5932ce7ffcf2f5f3bb0194bbb151e";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-agent-arm64";
        sha256 = "4c43139a1e89b79e77a2e69e6eeb9bf87b5ecd70f0a624c4e43a81168cdbcf91";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-guest-init-amd64";
        sha256 = "b8714e4c746abddcc136618edfbc81a1c5781cb74d1396482af1e054de59466e";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-guest-init-arm64";
        sha256 = "511982a6d033f5c026bf7bac77ef40cfb7cfc371ef5328a8ce86a52f2d800695";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-csfx-migrate-amd64";
          sha256 = "5fb77af82548bd2079e20be544dcfbd8224a9b595855a355310392069a07a590";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-csfx-migrate-arm64";
          sha256 = "c01a7ace0a4305a58e29e0b4e129bade4ac1b2d2f1bacc4f642b53676b110d1d";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-api-gateway-amd64";
          sha256 = "6972c6426b195bacb16ce022ea1eb9c61b1e5e1e03c4105ff21532318577d8d9";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-api-gateway-arm64";
          sha256 = "66270ccc846d843bdd061f4dd7ffc2032b6d0e2a46cd92e5c21d39d12ac0de2d";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-registry-amd64";
          sha256 = "03d11bff340530e0836d8001b371fe76af4b857ceb9ff3c6ac1544ab04e42d9c";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-registry-arm64";
          sha256 = "c4c0e351f4940e555f4086c66d89ac0207bc59e309fba15c4e01ab800534e9d7";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-scheduler-amd64";
          sha256 = "775c85b599ab0656d253051c7572cad718edd9df692bb41adc96bac815b03469";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-scheduler-arm64";
          sha256 = "7e06283a91ca8d73612663f96bdf19e069190b42a94b5a55aa39256dfd4fe06b";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-volume-manager-amd64";
          sha256 = "54342ba1a95a153b6ee2eab4b8af52eaf12c04d59a70220428b5d89b6f021385";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-volume-manager-arm64";
          sha256 = "844c32504d0b2cdf7117d5f3e5b266613d2e4382058cee3d6c45050374d9c876";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-failover-controller-amd64";
          sha256 = "05bdc79e6241c057205a3a86194a314285acee8493aeb81e4bc50c8a2159d12e";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-failover-controller-arm64";
          sha256 = "8519ec9c558d50c721b93438776abd4be302dff39214b7a82fe22607b9ebff8a";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-sdn-controller-amd64";
          sha256 = "3f0efd9c7462c2061b360cba4a63e93239a1f51a7faa450b51a124851444f891";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-sdn-controller-arm64";
          sha256 = "ad656e4ae8fcc9184c2801ebba38e342d3e0f68d062c6a2cdc134ef2b739958d";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-object-storage-amd64";
          sha256 = "b65aa98e7300d5cfcf7f4e16b4fb704bad2d9a2a1cc97899baf28f92abec4a51";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-cp-object-storage-arm64";
          sha256 = "efd46b847bf89dcd370d0b8c6516ebe6ff8c53440f090844d6899d814bd64262";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-updater-amd64";
          sha256 = "d24f9872413c2ac88a939408df85b68efeb898c2e555235340db91ba856b7dec";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-updater-arm64";
          sha256 = "0b7660142fb8f167419c409ea4712d28ffef6fe85c9adc06c2d3db1e1160387d";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.906/csfx-frontend.tar.gz";
      sha256 = "48f6e5c2254c9cf951f51d0e2a85befc5ef9f78278f56d450e2066835fade31d";
    };
  };
}

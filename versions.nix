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
    version = "0.2.2-alpha.893";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-agent-amd64";
        sha256 = "ea4aaaf0fafc23cabcd5d9eb7c882f7a4f00c50392c2039c782549af4fd7b935";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-agent-arm64";
        sha256 = "518aba9865a92035287a8bc8004a6f3cdc94cc8c5b999678e0b22d26b8f2bb9c";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-guest-init-amd64";
        sha256 = "b8714e4c746abddcc136618edfbc81a1c5781cb74d1396482af1e054de59466e";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-guest-init-arm64";
        sha256 = "511982a6d033f5c026bf7bac77ef40cfb7cfc371ef5328a8ce86a52f2d800695";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-csfx-migrate-amd64";
          sha256 = "c0ace604f8b3cc1f03bb8aba8fdb5aacbbbe6838b6be5250b07b77fde783ccf3";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-csfx-migrate-arm64";
          sha256 = "ba1f5e4aaf3f95044bfe86795444ddc91e2f461ad738426bd01c5700dea137e7";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-api-gateway-amd64";
          sha256 = "3dca4dcb06ff7082661f6283a2b5dcfd03d600547e2f23c75dd6294dcfb2f0b1";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-api-gateway-arm64";
          sha256 = "865e942f535e1976a94f3b0f8e6ae25c5df6554a48bf8e3bf46c2026f917d6d3";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-registry-amd64";
          sha256 = "bea5d889607e06880d7d0ddcb47b8182fabe7c4c8e2229b37fdbe0c376733dc7";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-registry-arm64";
          sha256 = "801fd47d99ba8a1cd67ccfda988b149be4c2a661161cb5a72025d2e1d373a410";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-scheduler-amd64";
          sha256 = "5e1e2724d04004e2ee8c1b140f480e4f5133191a2393ccbff833b8bf01bbddb4";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-scheduler-arm64";
          sha256 = "31ade1af135df239dde86b84c84d156574e3973c1dc9ef3295c983b343ca55be";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-volume-manager-amd64";
          sha256 = "54342ba1a95a153b6ee2eab4b8af52eaf12c04d59a70220428b5d89b6f021385";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-volume-manager-arm64";
          sha256 = "844c32504d0b2cdf7117d5f3e5b266613d2e4382058cee3d6c45050374d9c876";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-failover-controller-amd64";
          sha256 = "4c07d2c55515c042fb2f151cf72a2ef7dccdce788a930a91bddcea62651d0fdd";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-failover-controller-arm64";
          sha256 = "02fa6a2c1d4c9f5c7c9608035e6924d0e7e35caaa3bdd2befe90a78120c07cbb";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-sdn-controller-amd64";
          sha256 = "3f0efd9c7462c2061b360cba4a63e93239a1f51a7faa450b51a124851444f891";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-sdn-controller-arm64";
          sha256 = "ad656e4ae8fcc9184c2801ebba38e342d3e0f68d062c6a2cdc134ef2b739958d";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-object-storage-amd64";
          sha256 = "7a1cfa675d264a955a597d506b32dbe4ebf91de19659f680bbb7882a7e872b08";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-cp-object-storage-arm64";
          sha256 = "e2881fe6f8f1033c31c1d5665b1d1474b7eb291d99c6bd8be285592f4ebe441b";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-updater-amd64";
          sha256 = "d24f9872413c2ac88a939408df85b68efeb898c2e555235340db91ba856b7dec";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-updater-arm64";
          sha256 = "0b7660142fb8f167419c409ea4712d28ffef6fe85c9adc06c2d3db1e1160387d";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.893/csfx-frontend.tar.gz";
      sha256 = "fc3c65610f63cbcf936239730a861a8465c2dd0c4690ad2f41c70c4003ac2b45";
    };
  };
}

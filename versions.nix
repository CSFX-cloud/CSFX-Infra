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
    version = "0.2.2-alpha.891";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-agent-amd64";
        sha256 = "935942fcf0efcfbe923359a08a1856ee25eab950fc378e85daf19843015378fb";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-agent-arm64";
        sha256 = "bc85f6a0979f738c82c5c03fe2db8e45c04dcff6fe34b2f18d2b9efc844287b8";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-guest-init-amd64";
        sha256 = "b8714e4c746abddcc136618edfbc81a1c5781cb74d1396482af1e054de59466e";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-guest-init-arm64";
        sha256 = "511982a6d033f5c026bf7bac77ef40cfb7cfc371ef5328a8ce86a52f2d800695";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-csfx-migrate-amd64";
          sha256 = "c0ace604f8b3cc1f03bb8aba8fdb5aacbbbe6838b6be5250b07b77fde783ccf3";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-csfx-migrate-arm64";
          sha256 = "ba1f5e4aaf3f95044bfe86795444ddc91e2f461ad738426bd01c5700dea137e7";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-api-gateway-amd64";
          sha256 = "c1dc5ba56c1d5087ff879ca7ca5adecd77258d1238737430c48925856961121e";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-api-gateway-arm64";
          sha256 = "8d4c05b2814a13a23612161b569c0c6bee9eb3ef53636eb1e1a3707f77dab13c";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-registry-amd64";
          sha256 = "37d151deaf6d51b7df5c0aca172d264f75a96be05dd2446010e46f6dbb91917e";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-registry-arm64";
          sha256 = "5943c0039bdc74787832b9793134e2abbfd3faf3d1ac06aebfd510a7fb471f4d";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-scheduler-amd64";
          sha256 = "5e1e2724d04004e2ee8c1b140f480e4f5133191a2393ccbff833b8bf01bbddb4";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-scheduler-arm64";
          sha256 = "31ade1af135df239dde86b84c84d156574e3973c1dc9ef3295c983b343ca55be";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-volume-manager-amd64";
          sha256 = "54342ba1a95a153b6ee2eab4b8af52eaf12c04d59a70220428b5d89b6f021385";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-volume-manager-arm64";
          sha256 = "844c32504d0b2cdf7117d5f3e5b266613d2e4382058cee3d6c45050374d9c876";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-failover-controller-amd64";
          sha256 = "4c07d2c55515c042fb2f151cf72a2ef7dccdce788a930a91bddcea62651d0fdd";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-failover-controller-arm64";
          sha256 = "02fa6a2c1d4c9f5c7c9608035e6924d0e7e35caaa3bdd2befe90a78120c07cbb";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-sdn-controller-amd64";
          sha256 = "3f0efd9c7462c2061b360cba4a63e93239a1f51a7faa450b51a124851444f891";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-sdn-controller-arm64";
          sha256 = "ad656e4ae8fcc9184c2801ebba38e342d3e0f68d062c6a2cdc134ef2b739958d";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-object-storage-amd64";
          sha256 = "7a1cfa675d264a955a597d506b32dbe4ebf91de19659f680bbb7882a7e872b08";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-cp-object-storage-arm64";
          sha256 = "e2881fe6f8f1033c31c1d5665b1d1474b7eb291d99c6bd8be285592f4ebe441b";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-updater-amd64";
          sha256 = "d24f9872413c2ac88a939408df85b68efeb898c2e555235340db91ba856b7dec";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-updater-arm64";
          sha256 = "0b7660142fb8f167419c409ea4712d28ffef6fe85c9adc06c2d3db1e1160387d";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.891/csfx-frontend.tar.gz";
      sha256 = "d466fa62e8a66ab33f99c75f1b38619de9335915ff561341abd02c891f400a11";
    };
  };
}

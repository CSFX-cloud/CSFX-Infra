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
    version = "0.2.2-alpha.900";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-agent-amd64";
        sha256 = "6f8a6c7b77470e56a70b6c1fc0073d8d13fd909ceedf3140919b5fd11d9d1d81";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-agent-arm64";
        sha256 = "fa1046f1a747deda2f43389ba70349307b9d9005fed3cd5a52b2ae6ae1d3aa1c";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-guest-init-amd64";
        sha256 = "b8714e4c746abddcc136618edfbc81a1c5781cb74d1396482af1e054de59466e";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-guest-init-arm64";
        sha256 = "511982a6d033f5c026bf7bac77ef40cfb7cfc371ef5328a8ce86a52f2d800695";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-csfx-migrate-amd64";
          sha256 = "c0ace604f8b3cc1f03bb8aba8fdb5aacbbbe6838b6be5250b07b77fde783ccf3";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-csfx-migrate-arm64";
          sha256 = "ba1f5e4aaf3f95044bfe86795444ddc91e2f461ad738426bd01c5700dea137e7";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-api-gateway-amd64";
          sha256 = "9ae3261f17fe340359c77caaa03cb65633ed7a1b2a468dade3f0c5c986481875";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-api-gateway-arm64";
          sha256 = "eb2749fe886180173c95a7a9f95dfeb15760d943350bfd9807101b69f9d68abe";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-registry-amd64";
          sha256 = "1ae0f8a1db6859cc386f347d62cb35563b9e6d98c42b130bc0f14715a44f2990";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-registry-arm64";
          sha256 = "bd3d721f267abe297bb301b0a97eb59d0fffdbf3a4c18551bd7a699d759c437a";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-scheduler-amd64";
          sha256 = "b3b82e801f4a94b013da05b7f0ae8d2c922e2da34579bcf9e73393b99ff16967";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-scheduler-arm64";
          sha256 = "d5c8147c800e39d8e5cacbc1f046151ff8b89f4389ce687c77d1d6b8dc92a066";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-volume-manager-amd64";
          sha256 = "54342ba1a95a153b6ee2eab4b8af52eaf12c04d59a70220428b5d89b6f021385";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-volume-manager-arm64";
          sha256 = "844c32504d0b2cdf7117d5f3e5b266613d2e4382058cee3d6c45050374d9c876";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-failover-controller-amd64";
          sha256 = "c834e568aba6deb7a95fbad28e967b49b294b7b4bfca151564ee60c02dfcc274";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-failover-controller-arm64";
          sha256 = "e605448f906acc6935504882d2b6e300cc1489cbc66b7b7249508ceeef65a46e";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-sdn-controller-amd64";
          sha256 = "3f0efd9c7462c2061b360cba4a63e93239a1f51a7faa450b51a124851444f891";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-sdn-controller-arm64";
          sha256 = "ad656e4ae8fcc9184c2801ebba38e342d3e0f68d062c6a2cdc134ef2b739958d";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-object-storage-amd64";
          sha256 = "82e4f7eacbfd47519a40bbdabbdb14562175205902d3504e26a45fa02590e1a1";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-cp-object-storage-arm64";
          sha256 = "fb0a4cdd6acd9af641042a31190d2800c83fff84008984f36a38c037fac36eaa";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-updater-amd64";
          sha256 = "d24f9872413c2ac88a939408df85b68efeb898c2e555235340db91ba856b7dec";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-updater-arm64";
          sha256 = "0b7660142fb8f167419c409ea4712d28ffef6fe85c9adc06c2d3db1e1160387d";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.900/csfx-frontend.tar.gz";
      sha256 = "6192bc6e06e858ce8ad7f67d994f07f30c361468f717978659ef645152017d37";
    };
  };
}

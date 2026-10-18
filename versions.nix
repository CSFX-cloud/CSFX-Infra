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
    version = "0.2.2-alpha.920";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-agent-amd64";
        sha256 = "202a8865d0cd778bb6c3034d0ee9791fe392645f3e04329cfd5d64848e3a40f8";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-agent-arm64";
        sha256 = "3cdf9ba2ec722fdfb16cf2bf7da849f61044343bbf2d60d0f41b807968b18cc2";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-guest-init-amd64";
        sha256 = "b8714e4c746abddcc136618edfbc81a1c5781cb74d1396482af1e054de59466e";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-guest-init-arm64";
        sha256 = "511982a6d033f5c026bf7bac77ef40cfb7cfc371ef5328a8ce86a52f2d800695";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-csfx-migrate-amd64";
          sha256 = "8584a2b8672b72b6f2af6d47275b42b7e52a4dce1c887653f54c80bc3776e949";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-csfx-migrate-arm64";
          sha256 = "bb231803d323ab7200f84964df4b5f60c00eea2ef9094a41a0e36f7e6f2c0be3";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-api-gateway-amd64";
          sha256 = "69bcb60321e8bd394be4d8cffb2678183e73c5ee4e637c791b84c6cb70569e6e";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-api-gateway-arm64";
          sha256 = "7a904965d0cd0c9082a90a2bdc55342d17e3951f88c2219ec83fc28fcdea5d5a";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-registry-amd64";
          sha256 = "028fcb0ce449e3371cf11f62d6a96b0918a1335bdbaaca62b1c47456d1252aca";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-registry-arm64";
          sha256 = "def1255d43b326d0952513fcb206e012fe76c535746fcf287578d7fffe9c62a0";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-scheduler-amd64";
          sha256 = "56154f05553f6c15221c3fe0d7858f7afd63da445fddc4ccc8c687ad3cec3cb3";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-scheduler-arm64";
          sha256 = "ee492aab1b2271ff8d85ae7fdf97ee0e1bb7d489b624636e8a5315a3e826829e";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-volume-manager-amd64";
          sha256 = "5e588f4b5f1d9687506974f3c9e2204d0d1231877fa47482ce1b3bbc36a076f2";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-volume-manager-arm64";
          sha256 = "2f7c4e2610ddc750134bd1abf572275e7f2d236e065dc494d5a297681051a000";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-failover-controller-amd64";
          sha256 = "44033e0a48b3944c1f0e17d90f01288746c19018ad21a487f7edb962defa795e";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-failover-controller-arm64";
          sha256 = "996cc7cd8b5d8fbc74a968efb7a82e5cdb52c3a4738bb1fd683e20201c0f24b3";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-sdn-controller-amd64";
          sha256 = "b6238329d7e6d7d1ad2626a7f8df8ea1e3f3d86ae9d1bf5968bb3a9acf0e9cb7";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-sdn-controller-arm64";
          sha256 = "e48edd13a88aa0f28cdf28d708c9ee050b2912857f0431da66d342637d32432c";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-object-storage-amd64";
          sha256 = "d9ae9eae10be54d7404c7ae4ee72cdd60e4697b070a2cb46c389e0c897b9f175";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-cp-object-storage-arm64";
          sha256 = "6548a97f9f33c7d9a6bbada8f60e072af0714147892516db51864a04872caf3e";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-updater-amd64";
          sha256 = "d24f9872413c2ac88a939408df85b68efeb898c2e555235340db91ba856b7dec";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-updater-arm64";
          sha256 = "0b7660142fb8f167419c409ea4712d28ffef6fe85c9adc06c2d3db1e1160387d";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.920/csfx-frontend.tar.gz";
      sha256 = "cdeb9eb703856b0e76b7384bf689c46ad07b54b1219bf51dc8543b661b16c289";
    };
  };
}

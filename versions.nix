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
    version = "0.2.2-alpha.1050";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-agent-amd64";
        sha256 = "d344399f5a34333a1ae3a1abb5d60f4951fda13f53934f63be79830c4ace5183";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-agent-arm64";
        sha256 = "e1c841a4a80334663ea9bd08ccae2955d903198875becdc22c916960cc9e2608";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-guest-init-amd64";
        sha256 = "63ca39b95e57d0aa75c6b8ca2fd5ba8fc9f56bbdaafb1f30c2835fd3a36c08cc";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-guest-init-arm64";
        sha256 = "6dbe0e8e9775b86caee10369a11fefd8b59c48497234428b1f657483d65f026e";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-csfx-migrate-amd64";
          sha256 = "c4a103ed8747a924d730180f9b28574e033721bf7f83859ad4add15e0e80d957";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-csfx-migrate-arm64";
          sha256 = "f57f64044d957046dbfe2b615f597461ed399afd929df686ff5f13912096404d";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-api-gateway-amd64";
          sha256 = "3b527355fba531b8b3bd8239cd17e17c27140032bd458c74bd8f96e8c70a7a4f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-api-gateway-arm64";
          sha256 = "c72dd3430d263f16676a11a865c1e7d1d42bc438a647680350d52ccd384df5eb";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-registry-amd64";
          sha256 = "fefaf7f2f80b96a47362f33fdf35cb34d628da23ccfd8d18f610a8f0a3ec6fa6";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-registry-arm64";
          sha256 = "f2a8bdb7dbdcd6ae2f60d91cba0a54a012d8ee04b216b9d1ad90fb9b95b810bb";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-scheduler-amd64";
          sha256 = "1f93de92cee949879f4aba02e05431bb218579ace626137488cd1ec81c1be7e3";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-scheduler-arm64";
          sha256 = "e4161078778de07b8469345aea821e2c5a62e7dd8cf02f5054942fe19fec9c28";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-volume-manager-amd64";
          sha256 = "6b58e537705834d7dd55f95e72057cd87ea270ee1176fa9ae57ad8fbbbd3d9c7";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-volume-manager-arm64";
          sha256 = "50479ea1e802d8710b61f90777e977009f35f8f0195b245e6cb98b469f04d49a";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-failover-controller-amd64";
          sha256 = "b891ee335bba82e8d63090cd620c8af29c128d59a0040fbe3ecf6e100fbceb56";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-failover-controller-arm64";
          sha256 = "5aabd786fbb41241ac1fb98c7deba2d84240db162343f3d03afe55c42c3e91d7";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-sdn-controller-amd64";
          sha256 = "f1986d600044ab2745116b06ab2a1c08303ad2978f3e4bbaa2dbf94514fde4e2";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-sdn-controller-arm64";
          sha256 = "6d0c768b5730ed8ec0b90f647983d49020ec85e3836729d8c3ae9685af6df490";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-object-storage-amd64";
          sha256 = "836fd97b9e749010881347d0848e0b3ceeb1060363d19901c60d0e8c65ccf50c";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-object-storage-arm64";
          sha256 = "4a83c1eaa476ae9ff297c255ae1baf7bf48397b751d5c51629dff2b568959eb5";
        };
      };
      site-builder = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-site-builder-amd64";
          sha256 = "f6450f4e1a33add9cd8e2c9263136dba0ac6fb38a6244b13d49204afe75fc4a9";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-site-builder-arm64";
          sha256 = "ad5b552165fe8e0ca8a429626f6134ba48cdc25e99e958ec4cde68327fc05894";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-updater-amd64";
          sha256 = "94609ff6b6351500cb4c2edd0acdfc4b89f945b2919b8e845bc3282270b09900";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-updater-arm64";
          sha256 = "adeb71621ad959751332c900bc5008c6524185b3b9590177d805355e0dbdba19";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-frontend.tar.gz";
      sha256 = "404821454f939fd20b53c6c6e53ffd2d974205ed26e782529feb8a9196de5588";
    };
  };
}

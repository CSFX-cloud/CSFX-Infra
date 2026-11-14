{
  firecrackerGuestKernel = {
    amd64 = {
      url = "https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.9/x86_64/vmlinux-6.1.102";
      sha256 = "3b6e45c66d1b66d4fb0a1528107abbe890972f94e902bafe85fdf5108288c575";
    };
    arm64 = {
      url = "https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.9/aarch64/vmlinux-6.1.102";
      sha256 = "aee80c3ab9bc2d32f4c00de8ddf919c200359a400aae7c4710e8bc8ad438e1c4";
    };
  };
  firecracker = {
    amd64 = {
      url = "https://github.com/firecracker-microvm/firecracker/releases/download/v1.13.2/firecracker-v1.13.2-x86_64.tgz";
      hash = "sha256-pts7RR9QDf2CmJRH/r9Utci7iSnk7nx/hKlpXxMNpUc=";
    };
    arm64 = {
      url = "https://github.com/firecracker-microvm/firecracker/releases/download/v1.13.2/firecracker-v1.13.2-aarch64.tgz";
      hash = "sha256-pkwLkTspuOpLWZDsuUqSy3y064UAFbaaoWgNJdnLQb8=";
    };
  };
  csfx = {
    version = "0.2.2-alpha.1050";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-agent-amd64";
        sha256 = "c1d6b74bd4a718877930b3090f5dc9b276598ac30819e937cf672abf4c866fcd";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-agent-arm64";
        sha256 = "e1c841a4a80334663ea9bd08ccae2955d903198875becdc22c916960cc9e2608";
      };
    };
    guestInit = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-guest-init-amd64";
        sha256 = "d3b7b473a01112d4ffd782bd9be5ea195bcb82e0f5b454dbddcd4e673a6ec278";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-guest-init-arm64";
        sha256 = "6dbe0e8e9775b86caee10369a11fefd8b59c48497234428b1f657483d65f026e";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-csfx-migrate-amd64";
          sha256 = "166595c101e15333a890a0c7d23e245223a76d034e547b77ed727711e671544c";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-csfx-migrate-arm64";
          sha256 = "f57f64044d957046dbfe2b615f597461ed399afd929df686ff5f13912096404d";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-api-gateway-amd64";
          sha256 = "2aa5c4753a01d33387459f82efa4b2af770c0652d16a6e7e326e9e840f60a3ec";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-api-gateway-arm64";
          sha256 = "c72dd3430d263f16676a11a865c1e7d1d42bc438a647680350d52ccd384df5eb";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-registry-amd64";
          sha256 = "50a14041e8d481eb44cd71e41b7fe9d41f00db1280013e54e15341d5dc8736ea";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-registry-arm64";
          sha256 = "f2a8bdb7dbdcd6ae2f60d91cba0a54a012d8ee04b216b9d1ad90fb9b95b810bb";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-scheduler-amd64";
          sha256 = "cee79b194160affe0f321298234661737b93725c76601afc72942e09593ad991";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-scheduler-arm64";
          sha256 = "e4161078778de07b8469345aea821e2c5a62e7dd8cf02f5054942fe19fec9c28";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-volume-manager-amd64";
          sha256 = "05a69c856ff24e35de460b57b2b62acf731f9963930dbc345b8c28cabdc01219";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-volume-manager-arm64";
          sha256 = "50479ea1e802d8710b61f90777e977009f35f8f0195b245e6cb98b469f04d49a";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-failover-controller-amd64";
          sha256 = "a17c16d5e4deb85d2f231931b18ded71787d52a8814df4e28027be83a3480f1c";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-failover-controller-arm64";
          sha256 = "5aabd786fbb41241ac1fb98c7deba2d84240db162343f3d03afe55c42c3e91d7";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-sdn-controller-amd64";
          sha256 = "4cfd1b2a2f26cf1ab0332b8c453c36ea8509bd449203425530a44826c7c67392";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-sdn-controller-arm64";
          sha256 = "6d0c768b5730ed8ec0b90f647983d49020ec85e3836729d8c3ae9685af6df490";
        };
      };
      object-storage = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-object-storage-amd64";
          sha256 = "284b85e52ffcbd8c4961f9f22ab4f0558c03aa15684a549feb12ca02f49953fc";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-object-storage-arm64";
          sha256 = "4a83c1eaa476ae9ff297c255ae1baf7bf48397b751d5c51629dff2b568959eb5";
        };
      };
      site-builder = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-site-builder-amd64";
          sha256 = "920486aeeef54e3c439ce1902dd400ea4f447fba61a48858a8720d435429d54d";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-cp-site-builder-arm64";
          sha256 = "ad5b552165fe8e0ca8a429626f6134ba48cdc25e99e958ec4cde68327fc05894";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-updater-amd64";
          sha256 = "8d5ba9063ba4d4784cf410783f6b04806db9bf8c7c593996e99048394588e695";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-updater-arm64";
          sha256 = "adeb71621ad959751332c900bc5008c6524185b3b9590177d805355e0dbdba19";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1050/csfx-frontend.tar.gz";
      sha256 = "e8a8c3431f300cf5cfa25c90ab1b986cd550390d085162853cf5012dcf0c3b75";
    };
  };
}

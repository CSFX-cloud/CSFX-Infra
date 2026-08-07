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
    version = "0.2.2-alpha.719";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-agent-amd64";
        sha256 = "f3089d588044c9d2c562afdeaf35186ed3881dbc5c9039df0644312498fe680a";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-agent-arm64";
        sha256 = "8f8ddda43d037d434d9e838eec8e6d18ccdf0bff12272504674ebc124b5f9036";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-guest-init-amd64";
        sha256 = "816e1b891d21578e33e7d4804539f1ff2d058422192064fc31603b6d191ff5f7";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-guest-init-arm64";
        sha256 = "143179d71e72c8fc9b683db214aac5cd9dc1692fa408cf41161f97dd988a243b";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-cp-csfx-migrate-amd64";
          sha256 = "9a5153359cc190a41b0f62a1b8c8a577e5082c0d0de6962a440ad38b10f85dac";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-cp-csfx-migrate-arm64";
          sha256 = "db257fee8393dc626500e07146265670f03b01a209894479a84a2b22d46ec9b9";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-cp-api-gateway-amd64";
          sha256 = "3e54b26513b0470771c998cb26b53c103b7ca436cf7b45e8d49200b239daa7f6";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-cp-api-gateway-arm64";
          sha256 = "4766dc8006b9525cf1d99574e4e9b510041b86c0964221463aeeda356478a711";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-cp-registry-amd64";
          sha256 = "fa053284ed25bfe5a026b3d79330559db0aca6a34ab343a4c1b500453e9d440f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-cp-registry-arm64";
          sha256 = "f9155f71a3e1b2cb40abc2a252e2b906c85a45222785dcba70f71bd0d29b9187";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-cp-scheduler-amd64";
          sha256 = "c224a72f25d3b00437ad91225a1b3891f5bbb304227d109e544965797f6feb12";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-cp-scheduler-arm64";
          sha256 = "5dd5a48333f5f2380fed4ee4eb462f443221386363fd2f8c7c5fc8b8cf5b5a56";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-cp-volume-manager-amd64";
          sha256 = "9f52735b24059e19bf3dcd520b8ead8ec5046a7b94aaf08b7a298477a9637e51";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-cp-volume-manager-arm64";
          sha256 = "5d5ce34b51a6c3abc74f7e0487c991bd1297ca359f8c667dcc3499260b5566df";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-cp-failover-controller-amd64";
          sha256 = "38e3bdafaf4bb55af04e09fb14168cafb4b2419a78a397a4976e3b0ce9384e59";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-cp-failover-controller-arm64";
          sha256 = "c1c38f342eaf86c8b3bdbbf63711ed549cbcf585e42ae3c530a5529ab8b42dbb";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-cp-sdn-controller-amd64";
          sha256 = "7f18f56ef587c38fd6dae4be51810698e127729cfc55221baca3b829f74f9929";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-cp-sdn-controller-arm64";
          sha256 = "de61ad32026f068455a97d86879a85c1c4c9876f43a0705ea0fc4451296eeb35";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-updater-amd64";
          sha256 = "fd30d71d10c3be8166ab6479c1238fdcbaf3c8a855d65613612b53f88155c494";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-updater-arm64";
          sha256 = "a4357dacb0c5ad516c7756b56d1c37f91fd9b1fc0dffcd27d809bf4e80dfba25";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.719/csfx-frontend.tar.gz";
      sha256 = "897477c3d4c80a28aa15a7e632826a57708cae3d49815234fadd55b6bba79260";
    };
  };
}

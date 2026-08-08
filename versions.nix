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
  csfx = {
    version = "0.2.2-alpha.732";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-agent-amd64";
        sha256 = "442631996312fd2d3bb39d94a5dd1ac57a7ecfa5695018fc48e5b7caffde76ea";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-agent-arm64";
        sha256 = "d20e19f1bbebfbeeb91df8210e88aa227a1f7bb41daf7a5ee80bcbfca6679bf4";
      };
    };
    guestInit = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-guest-init-amd64";
        sha256 = "d1e07777fe82b8de9273fd6f6b187a440f9748f669ce1c47c72885d874411704";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-guest-init-arm64";
        sha256 = "b3bfbfe7e114722c5d2de24450e06739b23d5e1300a343f8cd4a027437601196";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-cp-csfx-migrate-amd64";
          sha256 = "9a5153359cc190a41b0f62a1b8c8a577e5082c0d0de6962a440ad38b10f85dac";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-cp-csfx-migrate-arm64";
          sha256 = "db257fee8393dc626500e07146265670f03b01a209894479a84a2b22d46ec9b9";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-cp-api-gateway-amd64";
          sha256 = "08e2ab0516c103b731a1533b5540e0dc3bc1f26003f23c4f147eb8bd9f09264e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-cp-api-gateway-arm64";
          sha256 = "b75617bb8afeab30428dfb5493134215f284f4450add889407bd0d675ea277b3";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-cp-registry-amd64";
          sha256 = "fa053284ed25bfe5a026b3d79330559db0aca6a34ab343a4c1b500453e9d440f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-cp-registry-arm64";
          sha256 = "f9155f71a3e1b2cb40abc2a252e2b906c85a45222785dcba70f71bd0d29b9187";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-cp-scheduler-amd64";
          sha256 = "00559aa1f343003b057ae117e1932316446d9afeda1d1f390fa2e4f1ee596433";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-cp-scheduler-arm64";
          sha256 = "30521c69006d0b6341393fc8f3892b75ec8c40ae705cff7a0e4abecf249266b1";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-cp-volume-manager-amd64";
          sha256 = "9f52735b24059e19bf3dcd520b8ead8ec5046a7b94aaf08b7a298477a9637e51";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-cp-volume-manager-arm64";
          sha256 = "5d5ce34b51a6c3abc74f7e0487c991bd1297ca359f8c667dcc3499260b5566df";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-cp-failover-controller-amd64";
          sha256 = "38e3bdafaf4bb55af04e09fb14168cafb4b2419a78a397a4976e3b0ce9384e59";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-cp-failover-controller-arm64";
          sha256 = "c1c38f342eaf86c8b3bdbbf63711ed549cbcf585e42ae3c530a5529ab8b42dbb";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-cp-sdn-controller-amd64";
          sha256 = "7f18f56ef587c38fd6dae4be51810698e127729cfc55221baca3b829f74f9929";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-cp-sdn-controller-arm64";
          sha256 = "de61ad32026f068455a97d86879a85c1c4c9876f43a0705ea0fc4451296eeb35";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-updater-amd64";
          sha256 = "fd30d71d10c3be8166ab6479c1238fdcbaf3c8a855d65613612b53f88155c494";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-updater-arm64";
          sha256 = "a4357dacb0c5ad516c7756b56d1c37f91fd9b1fc0dffcd27d809bf4e80dfba25";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.732/csfx-frontend.tar.gz";
      sha256 = "33a1352976d0a67f81ca18d3cd0cb4c41f0990eb6b8b2b450f8fd102c0ad9a09";
    };
  };
}

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
    version = "0.2.2-alpha.702";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-agent-amd64";
        sha256 = "896ecd80a9ee7db2010978085a03a480956cff10f4a9136662cd28bd0d3211ed";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-agent-arm64";
        sha256 = "0848bd97ee77280955503ea114202425f67da4095183ae245832c86d033a12cb";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-guest-init-amd64";
        sha256 = "dcc80c7360f99f32e54534b373d8c7dfe6da4e96a6ab92f3e12a24cb435d6fe9";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-guest-init-arm64";
        sha256 = "b6025760818dbb1e9b3767899b054a422131648a9db208ca6dc717f16ffc3a98";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-cp-csfx-migrate-amd64";
          sha256 = "9a5153359cc190a41b0f62a1b8c8a577e5082c0d0de6962a440ad38b10f85dac";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-cp-csfx-migrate-arm64";
          sha256 = "db257fee8393dc626500e07146265670f03b01a209894479a84a2b22d46ec9b9";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-cp-api-gateway-amd64";
          sha256 = "82e8d44704668796ec2f34f42868a9d58aa4a5ba16be927b44883b2c0ea71ebb";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-cp-api-gateway-arm64";
          sha256 = "bea7e7e874a560644dc23e550e13a57eff4d84d85ee0158e9f537702e8d583d9";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-cp-registry-amd64";
          sha256 = "fa053284ed25bfe5a026b3d79330559db0aca6a34ab343a4c1b500453e9d440f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-cp-registry-arm64";
          sha256 = "f9155f71a3e1b2cb40abc2a252e2b906c85a45222785dcba70f71bd0d29b9187";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-cp-scheduler-amd64";
          sha256 = "c224a72f25d3b00437ad91225a1b3891f5bbb304227d109e544965797f6feb12";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-cp-scheduler-arm64";
          sha256 = "5dd5a48333f5f2380fed4ee4eb462f443221386363fd2f8c7c5fc8b8cf5b5a56";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-cp-volume-manager-amd64";
          sha256 = "9f52735b24059e19bf3dcd520b8ead8ec5046a7b94aaf08b7a298477a9637e51";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-cp-volume-manager-arm64";
          sha256 = "5d5ce34b51a6c3abc74f7e0487c991bd1297ca359f8c667dcc3499260b5566df";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-cp-failover-controller-amd64";
          sha256 = "38e3bdafaf4bb55af04e09fb14168cafb4b2419a78a397a4976e3b0ce9384e59";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-cp-failover-controller-arm64";
          sha256 = "c1c38f342eaf86c8b3bdbbf63711ed549cbcf585e42ae3c530a5529ab8b42dbb";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-cp-sdn-controller-amd64";
          sha256 = "7f18f56ef587c38fd6dae4be51810698e127729cfc55221baca3b829f74f9929";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-cp-sdn-controller-arm64";
          sha256 = "de61ad32026f068455a97d86879a85c1c4c9876f43a0705ea0fc4451296eeb35";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-updater-amd64";
          sha256 = "fd30d71d10c3be8166ab6479c1238fdcbaf3c8a855d65613612b53f88155c494";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-updater-arm64";
          sha256 = "a4357dacb0c5ad516c7756b56d1c37f91fd9b1fc0dffcd27d809bf4e80dfba25";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.702/csfx-frontend.tar.gz";
      sha256 = "976a84a609be121891e6a234c73e8d50999ba73d6299de36ea33ea2e8c66d0cf";
    };
  };
}

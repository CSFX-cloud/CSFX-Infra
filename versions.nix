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
    version = "0.2.2-alpha.740";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-agent-amd64";
        sha256 = "22713ad177eb4790913c1e6c4611d2f4033fc5607c6811a02a4b468b589205b7";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-agent-arm64";
        sha256 = "34a12fc96f34b9726fd68a3648d4db663acc9fa12cf1eaa21b6540cc102eb5aa";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-guest-init-amd64";
        sha256 = "c434f8765fecab0878637d015d335d34103a56eda040bffba78ebeaa515b5a08";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-guest-init-arm64";
        sha256 = "9377bb4d81eabca8b255f10c76dc84f6d1cc77607d0f8073835a54af79d07f56";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-cp-csfx-migrate-amd64";
          sha256 = "e2f31da40866c1c0ab2afaa5b32f1cca5f6b61312bb7f262963f0bb8d553f7dd";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-cp-csfx-migrate-arm64";
          sha256 = "1070a8b7ab7cc43c16b3d96468da50dc3eaee91cd82b0bc5d0c1618263899beb";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-cp-api-gateway-amd64";
          sha256 = "2e542a63e0ae5c4c80e2f8f7f3117976d74b1bca72b1e781b87e6d7335dd5345";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-cp-api-gateway-arm64";
          sha256 = "eacc87ab820d35dcc848ce66ca24ddbdf60f09936a9d61bbf06a8b7886a33762";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-cp-registry-amd64";
          sha256 = "fa053284ed25bfe5a026b3d79330559db0aca6a34ab343a4c1b500453e9d440f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-cp-registry-arm64";
          sha256 = "f9155f71a3e1b2cb40abc2a252e2b906c85a45222785dcba70f71bd0d29b9187";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-cp-scheduler-amd64";
          sha256 = "00559aa1f343003b057ae117e1932316446d9afeda1d1f390fa2e4f1ee596433";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-cp-scheduler-arm64";
          sha256 = "30521c69006d0b6341393fc8f3892b75ec8c40ae705cff7a0e4abecf249266b1";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-cp-volume-manager-amd64";
          sha256 = "9f52735b24059e19bf3dcd520b8ead8ec5046a7b94aaf08b7a298477a9637e51";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-cp-volume-manager-arm64";
          sha256 = "5d5ce34b51a6c3abc74f7e0487c991bd1297ca359f8c667dcc3499260b5566df";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-cp-failover-controller-amd64";
          sha256 = "38e3bdafaf4bb55af04e09fb14168cafb4b2419a78a397a4976e3b0ce9384e59";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-cp-failover-controller-arm64";
          sha256 = "c1c38f342eaf86c8b3bdbbf63711ed549cbcf585e42ae3c530a5529ab8b42dbb";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-cp-sdn-controller-amd64";
          sha256 = "7f18f56ef587c38fd6dae4be51810698e127729cfc55221baca3b829f74f9929";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-cp-sdn-controller-arm64";
          sha256 = "de61ad32026f068455a97d86879a85c1c4c9876f43a0705ea0fc4451296eeb35";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-updater-amd64";
          sha256 = "fd30d71d10c3be8166ab6479c1238fdcbaf3c8a855d65613612b53f88155c494";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-updater-arm64";
          sha256 = "a4357dacb0c5ad516c7756b56d1c37f91fd9b1fc0dffcd27d809bf4e80dfba25";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.740/csfx-frontend.tar.gz";
      sha256 = "8bdf4ea16caee3baa3d36ccd72b28686e7d494e54bfc6c759bd16d6918842b2e";
    };
  };
}

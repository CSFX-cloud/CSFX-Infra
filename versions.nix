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
    version = "0.2.2-alpha.862";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-agent-amd64";
        sha256 = "dfa23f8da02605584c24fb789cbd50e936e3c41ebda32451b59606fe398f58d8";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-agent-arm64";
        sha256 = "a5dbf68deab12ae8cb35d9cc0317a7707b5e54a9344521edf1af807a093d456b";
      };
    };
    guestInit = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-guest-init-amd64";
        sha256 = "b8714e4c746abddcc136618edfbc81a1c5781cb74d1396482af1e054de59466e";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-guest-init-arm64";
        sha256 = "511982a6d033f5c026bf7bac77ef40cfb7cfc371ef5328a8ce86a52f2d800695";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-csfx-migrate-amd64";
          sha256 = "4022949d27a4e00cdbad33266b3499fa6d763978fa3af134cc8fe9ad4ed8aaef";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-csfx-migrate-arm64";
          sha256 = "5f88b8719be5d9d7d9ed48567d4fc2a068bc58c56d8edb91150d1dfddf96fa5f";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-api-gateway-amd64";
          sha256 = "6070101a400377fefe8c83177b2e22a19acb870a934223f5450dc0e3716de714";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-api-gateway-arm64";
          sha256 = "a5e8ecd682b52cf311ac1be2ae899a849144f699e97d36719ebbd601461c9ebe";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-registry-amd64";
          sha256 = "12d94630316ac7a4e65d8fd60b9cbc00cb0158e18d71dfa1c88f4d304c1e93d8";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-registry-arm64";
          sha256 = "79d1c6fe35a84ea63932082068946bd8d083a607090c00595ce70477f4be7dff";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-scheduler-amd64";
          sha256 = "08105dae9182a596bf25a3d76be76858e7c1c0f4c82d49d506900182ce0a6a6c";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-scheduler-arm64";
          sha256 = "da82403b5ef5328c626b833e8e27a2db023e8af8fb5c39c18033a0681ac02035";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-volume-manager-amd64";
          sha256 = "0c0bf378f1252d8d081e93a712c02e0a5c6ad20b7f3089a810b5db1dfbf9da8b";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-volume-manager-arm64";
          sha256 = "ac0a9f374742a79dce9e64d04a9fe60c8e984b43df07b92bdf726e1fa529a2c6";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-failover-controller-amd64";
          sha256 = "db8ddb3ba09fa14d0e8171ec18ddddcbdaf7c1395104c347699a8753e5cff8d5";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-failover-controller-arm64";
          sha256 = "1020507900f6472856ad960762b562dc886822d3f02a8c36a3e07109dfdff06e";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-sdn-controller-amd64";
          sha256 = "310697c23d0be7de0890e9da37c70812bb602e841e90cee1740c55bdb1661904";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-sdn-controller-arm64";
          sha256 = "48eede1768ab0f565989a3d9dcc6490dbd3c4a6ea0bd9b313d1f2fbaffd38199";
        };
      };
      object-storage = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-object-storage-amd64";
          sha256 = "eaa03ffd9238daa04c0cd847ab84516412ae109544e641c299acc01a82376979";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-cp-object-storage-arm64";
          sha256 = "82b513c4693b807b36b5287bf6fea487e56c8482c76b29d0a2ace7af16103741";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-updater-amd64";
          sha256 = "d24f9872413c2ac88a939408df85b68efeb898c2e555235340db91ba856b7dec";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-updater-arm64";
          sha256 = "0b7660142fb8f167419c409ea4712d28ffef6fe85c9adc06c2d3db1e1160387d";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.862/csfx-frontend.tar.gz";
      sha256 = "d8116ea9bc98722585f35411beeb1decd9ac4f21275b66b4875eaf17eb6efce9";
    };
  };
}

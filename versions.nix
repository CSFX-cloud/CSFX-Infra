{
  csfx = {
    version = "0.2.2-alpha.570";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-agent-amd64";
        sha256 = "c538d357dc26c8906f9e81ee47f0b4c8e131efe9be5431882190b635e8c9f749";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-agent-arm64";
        sha256 = "6fc6124744e5a576715592542a2e54c2b165beaa9f5e2162173c61a83f17043e";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-cp-csfx-migrate-amd64";
          sha256 = "23fbca9e034f8b9cf80868b2364b5a54d94cd927938e2faa369326adfe16b0f2";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-cp-csfx-migrate-arm64";
          sha256 = "13f02afb8d69d26b1809e4601d71b5ac56160030a7437e7cf111565c04a76c6c";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-cp-api-gateway-amd64";
          sha256 = "03ae9bf26e7cd71e287cf9fe23f66bcdd52c0a02d35a7606fd21ea0bb7349d69";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-cp-api-gateway-arm64";
          sha256 = "563174e51db0a12fb77331f1cba6116126297486dfb990f5d3e5a49c8f4be82a";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-cp-registry-amd64";
          sha256 = "08f33a8e080182dba4acf815d4f15d74ead39d05506a196e96c2b0eaa55d0b74";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-cp-registry-arm64";
          sha256 = "70f493eb5aba5f5e708287a8face1ad04850dfcd8a217949adf9c86ab664459d";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-cp-scheduler-amd64";
          sha256 = "b6ee674d2eb05cec5df5234a9065d1f0c522083da13b9271d62d78f68976e53f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-cp-scheduler-arm64";
          sha256 = "17f1c72efd8b90d3ab2f3a69ca14b3fdb3a8845d06897b2c6a45b3eb807b92e5";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-cp-volume-manager-amd64";
          sha256 = "3f32543e01108d08f97b769eae02a8a8eeace771a2ad0f87aa0ab502fc3a782a";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-cp-volume-manager-arm64";
          sha256 = "84cf7092dda75d139669cb5cbba8b7437ff7358d9aac1f16224b8f22e72484b7";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-cp-failover-controller-amd64";
          sha256 = "9f492e60d3fd396cb85e49bfe45c3b7a46709beb952ccf342866302ccf87b58f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-cp-failover-controller-arm64";
          sha256 = "f8e6cae33abb1edad09bb97618bc37aaa107e418065edbb40a4a014a787b66ff";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-cp-sdn-controller-amd64";
          sha256 = "993c954af2725d2e043c1a75fcb54c87b4683186f8d566493b039fc52406bd54";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-cp-sdn-controller-arm64";
          sha256 = "2dd4270cf44d2bf67d787f32bb5861e2f8a55164bf6693bc1b067c0ca0a7f9ce";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-updater-amd64";
          sha256 = "a87af5ca92210e65a674c09052a88e04acc03375b7d376ba6ed68bdc17a6c046";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-updater-arm64";
          sha256 = "c85ec7745925c40b6049628b58ca9d97fbf51705a583d067f1599dace44e8463";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.570/csfx-frontend.tar.gz";
      sha256 = "3bb9c0ec51f4dbe46f7079057a0c607b80ceaad41fdf2e3a1d8513068d70b417";
    };
  };
}

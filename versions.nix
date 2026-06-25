{
  csfx = {
    version = "0.2.2-alpha.571";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-agent-amd64";
        sha256 = "e0cd19b281fdf21c2f98f072687eb91f3f7442d5f49a7d375a4b5c18bf3a6aa7";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-agent-arm64";
        sha256 = "011a79cdb7f3475bc4b675f9763e6b75f5453cbd50b67764998c304e0ba2aaa3";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-cp-csfx-migrate-amd64";
          sha256 = "23fbca9e034f8b9cf80868b2364b5a54d94cd927938e2faa369326adfe16b0f2";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-cp-csfx-migrate-arm64";
          sha256 = "13f02afb8d69d26b1809e4601d71b5ac56160030a7437e7cf111565c04a76c6c";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-cp-api-gateway-amd64";
          sha256 = "1886dcc458f81efb7092c8ccfa172cef15fee025b257047269e03bab738e20f7";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-cp-api-gateway-arm64";
          sha256 = "7136c75b1cb23de59dac607e21406b10749b9230d443bfdd92cb9871bb2d3470";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-cp-registry-amd64";
          sha256 = "08f33a8e080182dba4acf815d4f15d74ead39d05506a196e96c2b0eaa55d0b74";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-cp-registry-arm64";
          sha256 = "70f493eb5aba5f5e708287a8face1ad04850dfcd8a217949adf9c86ab664459d";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-cp-scheduler-amd64";
          sha256 = "b37ad0c1a3c7629334c0bad45ed358d4c15be7eadc55dea6fc2ae73ddfbd1e4b";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-cp-scheduler-arm64";
          sha256 = "ab90e0cce0e454ba20821a8c350ba0edd94d7c187410722ccd009bc97b7f1114";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-cp-volume-manager-amd64";
          sha256 = "05a90a3b17032f0a2b431782fcaff8c22240fe4e07bb9acd45e4e6bbcac252ae";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-cp-volume-manager-arm64";
          sha256 = "9e34522fc9ca4dd59add20aba5bbb44de0d24259e8daa58f271373163e8e1e0f";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-cp-failover-controller-amd64";
          sha256 = "9f492e60d3fd396cb85e49bfe45c3b7a46709beb952ccf342866302ccf87b58f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-cp-failover-controller-arm64";
          sha256 = "f8e6cae33abb1edad09bb97618bc37aaa107e418065edbb40a4a014a787b66ff";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-cp-sdn-controller-amd64";
          sha256 = "3bd08a81f0f5b682d8a47d6df2e4ab686bb57cce870ee51ff8ed0899a8c32cc1";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-cp-sdn-controller-arm64";
          sha256 = "f8cf1a953ba7dc3aa419f8d7a0e5811439b09d0b50bd64be5d1c4428828cee5c";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-updater-amd64";
          sha256 = "a87af5ca92210e65a674c09052a88e04acc03375b7d376ba6ed68bdc17a6c046";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-updater-arm64";
          sha256 = "c85ec7745925c40b6049628b58ca9d97fbf51705a583d067f1599dace44e8463";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.571/csfx-frontend.tar.gz";
      sha256 = "53f3cb02724156974060f2582e2cdc19b1d840f98e7161c2581637ac55f5b16e";
    };
  };
}

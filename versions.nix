{
  csfx = {
    version = "0.2.2-alpha.620";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-agent-amd64";
        sha256 = "f5d692665160e7d3e6204a0794936bb769e506120d08643c4cba4089b2445932";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-agent-arm64";
        sha256 = "624a77eeaf9d3bff9873170d05415b72a732bbd124b48f8a98ca4e9ff38d35a6";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-cp-csfx-migrate-amd64";
          sha256 = "f4f110bb61295bdece222504f690899c43319dfc51aad2cd9bedb9ad036278d8";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-cp-csfx-migrate-arm64";
          sha256 = "e0b1709e83f6956803e03ff61552a54cc25e9575a6c2fcec376ac2fc6f88213a";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-cp-api-gateway-amd64";
          sha256 = "0803b151219b3716bbf7e09d887045f5880e3eb3da82e8d154666345d8dea03a";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-cp-api-gateway-arm64";
          sha256 = "5dd7442adf9351d0b2fd2370c9f28976230b01622e05bd9f173f0107220ed0b9";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-cp-registry-amd64";
          sha256 = "8f4c2d02f54bd90053f40e284384ddd3b07f6a896249a1a8257c40a783694efa";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-cp-registry-arm64";
          sha256 = "8448780e4ebf04c224d8e0401e48f714095c8d0f94c1773630db285e0b627385";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-cp-scheduler-amd64";
          sha256 = "c97d4ddf1d4c8277d8fc03cb377a65714e3bc589335b29a1b8f10e1d0a5c3afd";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-cp-scheduler-arm64";
          sha256 = "0adad0afc5d0433dd188c68c8076a07c37132b9a3b2e1a15a11955367e4c1943";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-cp-volume-manager-amd64";
          sha256 = "bd0010796bbff1707d244bc0552dacf71187c022804868cdc9abed57fdd5d577";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-cp-volume-manager-arm64";
          sha256 = "a4bca4808220d16bc2f9cf6b43c21bf20768fae1c5c6fde53bcfa2a940e26bd2";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-cp-failover-controller-amd64";
          sha256 = "cc2ad90682149b308c8b302d729335349092997bf40fe5df85f66ad661381512";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-cp-failover-controller-arm64";
          sha256 = "227ec33f5d49369e6007d331f1ece64475b6e3414124323aad157d2de32b7618";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-cp-sdn-controller-amd64";
          sha256 = "8940c5b73409fd60d7f32d09b914de0a8f912c803b457b08af272d1923a73d5a";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-cp-sdn-controller-arm64";
          sha256 = "0995271e1b08c6150ee22f453742393b57dedbf9322f146facb9ee30b25353fa";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-updater-amd64";
          sha256 = "f859c9815ab639996d9b26725992dc875024b4a5a46780533eb7e7f0e495248a";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-updater-arm64";
          sha256 = "5f65cb9a26a5afaba403b7fb9edd775e579ad8198aaf3601b302c73b0cef08f8";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.620/csfx-frontend.tar.gz";
      sha256 = "1560094e827413dd53c5f22e854e0798a470909cf654da04becdec4dab19b7ca";
    };
  };
}

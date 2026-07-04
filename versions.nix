{
  csfx = {
    version = "0.2.2-alpha.607";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-agent-amd64";
        sha256 = "ff5476c6175a747d4b62824b258bdf3b3e0439aca7581edda81acafd0551496e";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-agent-arm64";
        sha256 = "c9541b820a52d3e50b1c43e0065e33249fdaee44d3dc10c538ade6a6e7c2e7b6";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-cp-csfx-migrate-amd64";
          sha256 = "c57c7760554e2f8d6a588d4d43d3198fe45d9425a279efdf8cce46541c0fd9ea";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-cp-csfx-migrate-arm64";
          sha256 = "802877669cbd5c3a1ebe0b01c74e63fbcd6b41e10f0c13daaf67ee14b4f88621";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-cp-api-gateway-amd64";
          sha256 = "52a6a254fc3b77660d6dc12e861f6e8d1f78403b53715aea2975f46ea6352836";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-cp-api-gateway-arm64";
          sha256 = "afdbc0bb7a7443342fa4d98412c50cf365f3d718f8fdad8b73d0c510f7c293e2";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-cp-registry-amd64";
          sha256 = "40e301f341c99a67ec5b0f9752d698e6b7583580a4919b42af25afd4087d0574";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-cp-registry-arm64";
          sha256 = "ce00ed8d56b608dff71152021128637e094df43cb9ecf6cf5e936374516e0c5a";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-cp-scheduler-amd64";
          sha256 = "74e8c844ec05e1931d659fc5c901f6ce51e42957434996f2b79c9dc57a3048ba";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-cp-scheduler-arm64";
          sha256 = "b93fd78f97b51191b83a954f1e3f599506b306e243ca40c57c5dd7f8ab7f41b9";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-cp-volume-manager-amd64";
          sha256 = "6c1c61b2d4926125c00d7912bf56a0cc6a4b8e27c85e91c4b1769631f46e5b68";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-cp-volume-manager-arm64";
          sha256 = "ece90d05a0cab818710d3dc0fdaffe0b2e6a0c4903b9f9e000178f575551591e";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-cp-failover-controller-amd64";
          sha256 = "864434cfae00f49448adda37d45bdfa361cceb8d63202dfda35bfc1f5b7b4529";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-cp-failover-controller-arm64";
          sha256 = "56e8443adff89d5453cc059c254bb7577e7c9cf161ea6f500859862656230d84";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-cp-sdn-controller-amd64";
          sha256 = "f01e8d1d23b751e3e2267248b41c35ff22857f1463be1230c936619cd3c8612b";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-cp-sdn-controller-arm64";
          sha256 = "379b904e21f0aa50dcf293eda66639bcbc745d670e234b62137cd7f8dbf0e7fe";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-updater-amd64";
          sha256 = "de3bd4267f8146153e732c413802b11bf43bdc03be2c6bf6655bd6d6ee693ac0";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-updater-arm64";
          sha256 = "951990ef87c5170cef594f34ac03111ae64619dc6404490bec98b3eee3119b6d";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.607/csfx-frontend.tar.gz";
      sha256 = "7e0a1ba7ed69d0b459b71f0de3b1b97c47e741b2800345e55c7307f0515ddd06";
    };
  };
}

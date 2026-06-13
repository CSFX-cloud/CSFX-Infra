{
  csfx = {
    version = "0.2.2-alpha.509";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-agent-amd64";
        sha256 = "63cf4d4fc2d96abe4b6378dd8a16373a2f6e2dd9436d251bc08b9e25f4e35849";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-agent-arm64";
        sha256 = "2465ca23e6721faa33f5b2189d8549d0fec40da29eaef15a2b5629dcac4e10eb";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-cp-csfx-migrate-amd64";
          sha256 = "9c8e558f02ce5652d954df26a64a998af653fa38bd51eedcddc6e38e574bdc4c";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-cp-csfx-migrate-arm64";
          sha256 = "534be3dd7de9a867cd9cbac6820e4c2b286ed2fd0c05d6fe5ee506c909abe2a1";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-cp-api-gateway-amd64";
          sha256 = "3dd8e7b223359e73aa74226cad1ecb9dce674478e8280f24953f05fa02f14d78";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-cp-api-gateway-arm64";
          sha256 = "aaadee6655b7c0d0d5e7e3fc7fa24947e03cbb1a5a92a52a8f5665986a9316f7";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-cp-registry-amd64";
          sha256 = "63a3c92d8a74a3ae6db17d59ea299b1af58ad4e1514b57b47c336ba50a44216f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-cp-registry-arm64";
          sha256 = "1f6e83fd8e5ed379bfd11c244f2a59de407133849f75d2e6eb0f4be1d2147716";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-cp-scheduler-amd64";
          sha256 = "82ecb1116eeb73764682fe44e2f8574526d03d9eb6938cab61542d1d97d1963c";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-cp-scheduler-arm64";
          sha256 = "81d8a4a2ddc3009110e1d05b9a2889c1326e69fb19aeb466f0c4438105fce44f";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-cp-volume-manager-amd64";
          sha256 = "e6e54bbd0feb0a1dc097e09edad96bd85617b5fef4acd9d3c37a03c238aba864";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-cp-volume-manager-arm64";
          sha256 = "0a6356aecb9f6e02c83208bf6a9a81004867079e893303d2d29a8eaf8e15a1ff";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-cp-failover-controller-amd64";
          sha256 = "043104c19b3f93a1f259a77a73108a217f29fd217bc961d807056c2114562351";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-cp-failover-controller-arm64";
          sha256 = "c853086a4d19a2ee181edcb8a187b487d473b9eaada5883363c9e453f1115e26";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-cp-sdn-controller-amd64";
          sha256 = "8f5090f50936d8eac591cd74fca3dcaace31e1fa1ec62f30940054608cb11eef";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-cp-sdn-controller-arm64";
          sha256 = "2fa22e367b7541151aaf14feae1250b7de56f5d25300c97051e0cecf34f6e8fb";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-updater-amd64";
          sha256 = "d36f9c81e24ad38c36a65cdb17fe4c74e93c97fcf7954aafe5f9d2eec18904e1";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-updater-arm64";
          sha256 = "1c469acb4fdca7c1b5783321fdd4111d8e98884ea049b989c23f3987931304ef";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.509/csfx-frontend.tar.gz";
      sha256 = "01fc6ee932fbacacaa737f963b482535284fbbb15b7a674f0312ab1d961ab56e";
    };
  };
}

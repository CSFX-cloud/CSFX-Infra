{
  csfx = {
    version = "0.2.2-alpha.473";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-agent-amd64";
        sha256 = "84a43785fc8588554f5952cf193e72e4f733a04eff39a87db38afc13dec36077";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-agent-arm64";
        sha256 = "9f7d64f501138be062503738b1dfdb13ed316ecf444e9cabd9cce7120fa7b197";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-cp-csfx-migrate-amd64";
          sha256 = "1483f6807c9b3de27ebe5728d84910ad0c4bb54de3d895178f0b8a92aabbcd30";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-cp-csfx-migrate-arm64";
          sha256 = "35781460e5525533f49704f5e5b8cc423f6e5f1aaba199db5af8d23caa08e296";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-cp-api-gateway-amd64";
          sha256 = "7aa45bdeb272ce52efa97c091f710483d89fa11db07a73d7defbcc1d677407d5";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-cp-api-gateway-arm64";
          sha256 = "93a60df905b452d02f5816e2fd5536360e4d8e0bb6480743772b01666b087642";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-cp-registry-amd64";
          sha256 = "e63aeb0d1570437b845099b9187dd276e3a39c97ea5b34a954ccfa85f7d81f7c";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-cp-registry-arm64";
          sha256 = "2720e60f09f63493b6f7500f079f78f0f2f4fc5d5ad2dea5d727e65838cbe79f";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-cp-scheduler-amd64";
          sha256 = "3f8749a5ef0a9e08fe8f1a7c97130252392a09c95c056a193e909d28be5aac62";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-cp-scheduler-arm64";
          sha256 = "11ba7946b4f8187d122efa0eb68f18ef8acd272377d99a07e1be858838893608";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-cp-volume-manager-amd64";
          sha256 = "ca822c83e2f332fcd68f044b0e875db5db4dca575421f338ca014912f995d6ac";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-cp-volume-manager-arm64";
          sha256 = "7e38ca070d4c3872b32beb944e4f120ac1e80ca2a0c08eff74425719441b3592";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-cp-failover-controller-amd64";
          sha256 = "505204add832f89084e16661a03d49bbb02c2ef1d000470c78adc02da32b7ec3";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-cp-failover-controller-arm64";
          sha256 = "dd8b1adf626c05af1a4172f6d56538976cabc3b30fbf0b6856aa77f61c0550d8";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-cp-sdn-controller-amd64";
          sha256 = "556dd0f9e5c20737d821164a214b02191f9b20843e2a860c4f23d3a34c75b37f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-cp-sdn-controller-arm64";
          sha256 = "81a011e8cad4513647c3137fd25293fe16f5b5b079f746a73ec9c6c63eb6b409";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-updater-amd64";
          sha256 = "1e054b8f49f321fa7a2d06c83b65cf6031bfbdf910277546086a8954be8b67cb";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.473/csfx-updater-arm64";
          sha256 = "e0a9bdfa73593751723dd75bcc096de863cc63b78408a2b583b1f5745d8c8695";
        };
      };
    };
  };
}

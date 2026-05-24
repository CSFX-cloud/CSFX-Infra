{
  csfx = {
    version = "0.2.2-alpha.476";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-agent-amd64";
        sha256 = "7e5756b14af27837ff47542eb1111b2af2d8d98feb2bef1631af17f79a6f6a14";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-agent-arm64";
        sha256 = "4a524571d43ced555dcc45cf2ead55a7a428f1a2529c94ff08bab8e78c1f4b07";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-cp-csfx-migrate-amd64";
          sha256 = "8d6ca960962ff37e2a1bd326004f40196707c24bc1c4fb6b0a6fb7b972d82c28";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-cp-csfx-migrate-arm64";
          sha256 = "9a10ebd5ec4a86bb07106e49ec744ff60e585ee45c8e6856b61a5fce6ae518fd";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-cp-api-gateway-amd64";
          sha256 = "8b16a8fa0ce88c34febc4d6806fa4c695d0ffecac68a953e1e5197c120f42d29";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-cp-api-gateway-arm64";
          sha256 = "02db8bfe97b1398a02e75ae55384c19fa36010ec7f8d92d1cca743b1e80c061f";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-cp-registry-amd64";
          sha256 = "bbfc6e22fe44867c95e2aad5f902da0f9eb2876f122e0b3b87ebd2dac8b67428";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-cp-registry-arm64";
          sha256 = "bc16c332ec3dff9c38244e8275346bc1882007007600e4a93feb8fd95c0675ab";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-cp-scheduler-amd64";
          sha256 = "3f8749a5ef0a9e08fe8f1a7c97130252392a09c95c056a193e909d28be5aac62";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-cp-scheduler-arm64";
          sha256 = "11ba7946b4f8187d122efa0eb68f18ef8acd272377d99a07e1be858838893608";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-cp-volume-manager-amd64";
          sha256 = "ca822c83e2f332fcd68f044b0e875db5db4dca575421f338ca014912f995d6ac";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-cp-volume-manager-arm64";
          sha256 = "7e38ca070d4c3872b32beb944e4f120ac1e80ca2a0c08eff74425719441b3592";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-cp-failover-controller-amd64";
          sha256 = "505204add832f89084e16661a03d49bbb02c2ef1d000470c78adc02da32b7ec3";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-cp-failover-controller-arm64";
          sha256 = "dd8b1adf626c05af1a4172f6d56538976cabc3b30fbf0b6856aa77f61c0550d8";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-cp-sdn-controller-amd64";
          sha256 = "556dd0f9e5c20737d821164a214b02191f9b20843e2a860c4f23d3a34c75b37f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-cp-sdn-controller-arm64";
          sha256 = "81a011e8cad4513647c3137fd25293fe16f5b5b079f746a73ec9c6c63eb6b409";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-updater-amd64";
          sha256 = "beb6763aba67ae2b56986ebe8d18e6f211fa943dc202880dd7940d7b3e41e573";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.476/csfx-updater-arm64";
          sha256 = "05e06b5ef6a3cfe2f810af68e356fc670bac5a1d3a6b273ee99ae51fa5802750";
        };
      };
    };
  };
}

{
  csfx = {
    version = "0.2.2-alpha.475";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-agent-amd64";
        sha256 = "e4227ed680f89114332acea0046e559c95fdb59497deea1fe3378c29612faac8";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-agent-arm64";
        sha256 = "3f07507db554eb0d459cfbad337f6df2b317f8159f052f32c0e06126d517146a";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-cp-csfx-migrate-amd64";
          sha256 = "8d6ca960962ff37e2a1bd326004f40196707c24bc1c4fb6b0a6fb7b972d82c28";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-cp-csfx-migrate-arm64";
          sha256 = "9a10ebd5ec4a86bb07106e49ec744ff60e585ee45c8e6856b61a5fce6ae518fd";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-cp-api-gateway-amd64";
          sha256 = "c8b6aa233089e39cb1065f2ac67e64c01ba3c9d8654f4c803a3786ed0e717f4b";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-cp-api-gateway-arm64";
          sha256 = "9541c2f2f2ad986cb43642ef3c39ecac283527d453b2a20ee26095a95004c080";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-cp-registry-amd64";
          sha256 = "bbfc6e22fe44867c95e2aad5f902da0f9eb2876f122e0b3b87ebd2dac8b67428";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-cp-registry-arm64";
          sha256 = "bc16c332ec3dff9c38244e8275346bc1882007007600e4a93feb8fd95c0675ab";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-cp-scheduler-amd64";
          sha256 = "3f8749a5ef0a9e08fe8f1a7c97130252392a09c95c056a193e909d28be5aac62";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-cp-scheduler-arm64";
          sha256 = "11ba7946b4f8187d122efa0eb68f18ef8acd272377d99a07e1be858838893608";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-cp-volume-manager-amd64";
          sha256 = "ca822c83e2f332fcd68f044b0e875db5db4dca575421f338ca014912f995d6ac";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-cp-volume-manager-arm64";
          sha256 = "7e38ca070d4c3872b32beb944e4f120ac1e80ca2a0c08eff74425719441b3592";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-cp-failover-controller-amd64";
          sha256 = "505204add832f89084e16661a03d49bbb02c2ef1d000470c78adc02da32b7ec3";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-cp-failover-controller-arm64";
          sha256 = "dd8b1adf626c05af1a4172f6d56538976cabc3b30fbf0b6856aa77f61c0550d8";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-cp-sdn-controller-amd64";
          sha256 = "556dd0f9e5c20737d821164a214b02191f9b20843e2a860c4f23d3a34c75b37f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-cp-sdn-controller-arm64";
          sha256 = "81a011e8cad4513647c3137fd25293fe16f5b5b079f746a73ec9c6c63eb6b409";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-updater-amd64";
          sha256 = "1e054b8f49f321fa7a2d06c83b65cf6031bfbdf910277546086a8954be8b67cb";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.475/csfx-updater-arm64";
          sha256 = "e0a9bdfa73593751723dd75bcc096de863cc63b78408a2b583b1f5745d8c8695";
        };
      };
    };
  };
}

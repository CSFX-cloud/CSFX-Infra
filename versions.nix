{
  csfx = {
    version = "0.2.2-alpha.465";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-agent-amd64";
        sha256 = "7a10385a961f5e7c95251d7bf827e5088f7b195ba329626fac9cedb4fc4a3f07";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-agent-arm64";
        sha256 = "693eef909b2770cd31b8fd3d1a69fbea8053aaada26f9016f18a3e79e1831a6d";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-cp-csfx-migrate-amd64";
          sha256 = "1483f6807c9b3de27ebe5728d84910ad0c4bb54de3d895178f0b8a92aabbcd30";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-cp-csfx-migrate-arm64";
          sha256 = "35781460e5525533f49704f5e5b8cc423f6e5f1aaba199db5af8d23caa08e296";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-cp-api-gateway-amd64";
          sha256 = "5f5c32c91f54b52082e78db8c8a1827c4dc1141313280be38ddae12dccf0752d";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-cp-api-gateway-arm64";
          sha256 = "7b138e82c8cfa777a380575f300151b22da9f6aec110859b9dbd63b88a552209";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-cp-registry-amd64";
          sha256 = "3bb17f69bc9b2d09e3a65384462925ae08bc37ff24a2463ab859a7b6b53d51d1";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-cp-registry-arm64";
          sha256 = "312d93f0a958982f2088950f9c2d98a143c0d5fe1d7e729191d0a21c653ab392";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-cp-scheduler-amd64";
          sha256 = "3f8749a5ef0a9e08fe8f1a7c97130252392a09c95c056a193e909d28be5aac62";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-cp-scheduler-arm64";
          sha256 = "11ba7946b4f8187d122efa0eb68f18ef8acd272377d99a07e1be858838893608";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-cp-volume-manager-amd64";
          sha256 = "ca822c83e2f332fcd68f044b0e875db5db4dca575421f338ca014912f995d6ac";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-cp-volume-manager-arm64";
          sha256 = "7e38ca070d4c3872b32beb944e4f120ac1e80ca2a0c08eff74425719441b3592";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-cp-failover-controller-amd64";
          sha256 = "505204add832f89084e16661a03d49bbb02c2ef1d000470c78adc02da32b7ec3";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-cp-failover-controller-arm64";
          sha256 = "dd8b1adf626c05af1a4172f6d56538976cabc3b30fbf0b6856aa77f61c0550d8";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-cp-sdn-controller-amd64";
          sha256 = "556dd0f9e5c20737d821164a214b02191f9b20843e2a860c4f23d3a34c75b37f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.465/csfx-cp-sdn-controller-arm64";
          sha256 = "81a011e8cad4513647c3137fd25293fe16f5b5b079f746a73ec9c6c63eb6b409";
        };
      };
    };
  };
}

{
  csfx = {
    version = "0.2.2-alpha.578";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-agent-amd64";
        sha256 = "f1e6a6a8e8728f432df5956262b0aa45e92ddb9a7c2f17e1b1f74aa7b7604897";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-agent-arm64";
        sha256 = "cc41d787b6161a07a5af131cf8e4d04362c42428762ffd909e17c4a2938fdcca";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-cp-csfx-migrate-amd64";
          sha256 = "80c735603265f07c6cb6eca289e83c8eba69846df806767e7aa2e4cda184c963";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-cp-csfx-migrate-arm64";
          sha256 = "160af34d0a17fb4883ab273c13dff7be9387648aeb6a9861a7642a6bcf6eda0c";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-cp-api-gateway-amd64";
          sha256 = "90b0a3ccf42a7b86a3eeb107f964bb357845d8cca6c4b8d16a8e311b0c3fc19e";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-cp-api-gateway-arm64";
          sha256 = "2086321539a47de0d55b83c0509a18f9cf68cdc50ff697f7527d65287218d11f";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-cp-registry-amd64";
          sha256 = "b5e200b5a359d7c7feb2b70977683b37905fbfb11cf12c8a1cf4b3fee35a83c8";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-cp-registry-arm64";
          sha256 = "0c4ca62522a9b76407948c3c7b44f3d8d56b14087c9edc572ba66e7bd9ef0de0";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-cp-scheduler-amd64";
          sha256 = "6603bc3dfbb27ac21e332063fac6b2d3a1be1bd11c3a5c9a11aa99a5919ac092";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-cp-scheduler-arm64";
          sha256 = "a58adecce6fc0a7f7c4de647a2456300c3e7a5ba228b343e4c64cc030d7c3889";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-cp-volume-manager-amd64";
          sha256 = "e46a4f80f89df1cb825b48aea325ce73071fb110a1db116ce4d2042fe77b58a1";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-cp-volume-manager-arm64";
          sha256 = "26f8b8ec7f3f71212c4d467eb3fb0923bd045482b6d6ba91a69894ca434289b8";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-cp-failover-controller-amd64";
          sha256 = "1bd7fc447a6661e379faf1c4d3eb9beefb271895d32fbebb3035421dcd1b8bd0";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-cp-failover-controller-arm64";
          sha256 = "6b91390952cdfefea0cfcc414886714d2b176d72d5ccd5852964d14c34e019e7";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-cp-sdn-controller-amd64";
          sha256 = "e3436cfd536a3821fe09abf7d8f0c8f3dd874398c5313678ae38784b6365b89b";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-cp-sdn-controller-arm64";
          sha256 = "ac4eabc14e254017fb16b458eb339163827b8a27c62b335e316cfece3008edf9";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-updater-amd64";
          sha256 = "f77c8171d6a0bfd19c1349a69959bf766a5527421a7dcc811a5f966ad08f5f00";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-updater-arm64";
          sha256 = "95ddd308abe30e818650d580f35a3a86619e18e6e5fbf9aef5b1210e750e94a9";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.578/csfx-frontend.tar.gz";
      sha256 = "a4d9d620c98187062db3ffde75a89fbfcbbc37407a20cb8112ac062a4e303fec";
    };
  };
}

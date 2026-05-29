{
  csfx = {
    version = "0.2.2-alpha.477";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-agent-amd64";
        sha256 = "f0e76544adc67de7489a5545606ed344c79740ff61f365cd37897080f0ddb420";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-agent-arm64";
        sha256 = "ea44f1aa72b2f6e4789cd6dfdb98c96effd571af7da5478721ee08d968c231f6";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-cp-csfx-migrate-amd64";
          sha256 = "00c8379c7bbae478d72dc25d61389a46c022fbb970bbef452f5b73f29a17cbe3";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-cp-csfx-migrate-arm64";
          sha256 = "0f25107c8f0896c61b59b3a7595a979b76be963e4026442b310cc8034e38e9f3";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-cp-api-gateway-amd64";
          sha256 = "c497b17dd18b81886edd948a9ff6d8df902b134096d2b3a58d13c50df3517c8e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-cp-api-gateway-arm64";
          sha256 = "932ed71c69ff9ab751347df9015cc111ac73256124fe65d2f0f34ebd8db63cef";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-cp-registry-amd64";
          sha256 = "ab0e59c8b3a9b087d21d5187ca5d0584c2f0f6637a22f59e58b40cea6d580519";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-cp-registry-arm64";
          sha256 = "68770c47d0f587e541d81090e29b70e38cac2a3c7069312c7578e30d2c167f21";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-cp-scheduler-amd64";
          sha256 = "45e6e1a09098da173ecdca848017bea2d9ea9eedb32291548aa323f809602779";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-cp-scheduler-arm64";
          sha256 = "db330a03bf919986316bfcbedaa7e4795b2871ace8875f9a35112df056e937d2";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-cp-volume-manager-amd64";
          sha256 = "6a85d37075cf062fdcdc888ed9dc0989544c1c00f7d3b7cf000dcffefe28db43";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-cp-volume-manager-arm64";
          sha256 = "85e1c85595ed5246e84eb9aea05f6d73435ea2238be0ac32e2168433292dafef";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-cp-failover-controller-amd64";
          sha256 = "d8e18f1c0d73b7d76c0553ea7c997a8f8dd1cc9a565fef67c87a7f21f062a36f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-cp-failover-controller-arm64";
          sha256 = "637612c12cf92796b77abde1e27b87d0f2dd8d65d2f58ee0a46b94d81531fc1c";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-cp-sdn-controller-amd64";
          sha256 = "343d7e6c1687792cccfd034e610ea84e7b1fac76addbd19eaf54668365ab9379";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-cp-sdn-controller-arm64";
          sha256 = "64645d1728b73d6e89cd0e97737dd0a7c3231041c78ab4e524d0189f50f79b9b";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-updater-amd64";
          sha256 = "dbfd654eea86d9fb9182d5af696633dd62fbf74c778e69696131d727bbb22b7d";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.477/csfx-updater-arm64";
          sha256 = "6218eef26628d0ffd5da7a12fd294216bf7ed12a655d328241354c0ae4835afb";
        };
      };
    };
  };
}

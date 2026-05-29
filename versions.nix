{
  csfx = {
    version = "0.2.2-alpha.481";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-agent-amd64";
        sha256 = "d46877014543c2d9950251bc8039dc41d73fadf1b1049cf3ab1e43c6cbca47cf";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-agent-arm64";
        sha256 = "2a48e08aa978234ba25ff91a1f3c307726a8c6dad2a8d5e612bb47f3bcaaec17";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-cp-csfx-migrate-amd64";
          sha256 = "00c8379c7bbae478d72dc25d61389a46c022fbb970bbef452f5b73f29a17cbe3";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-cp-csfx-migrate-arm64";
          sha256 = "0f25107c8f0896c61b59b3a7595a979b76be963e4026442b310cc8034e38e9f3";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-cp-api-gateway-amd64";
          sha256 = "6a7a5583cc1059de91778d0dcc652d231c02cbe95eca9a651eeacc1038a869c7";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-cp-api-gateway-arm64";
          sha256 = "e7e878af0280bf943c587866441e5834ad09172702bee98569e4b4232a5db9c5";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-cp-registry-amd64";
          sha256 = "ab0e59c8b3a9b087d21d5187ca5d0584c2f0f6637a22f59e58b40cea6d580519";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-cp-registry-arm64";
          sha256 = "68770c47d0f587e541d81090e29b70e38cac2a3c7069312c7578e30d2c167f21";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-cp-scheduler-amd64";
          sha256 = "c5caa25aacd404ed3c650d50e2bccb0f65a76f6053a4579e1c6f9740bc08bd0f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-cp-scheduler-arm64";
          sha256 = "23fa992376258c934299e5418321b6b306b2c815f86a9242a1e9593a3ac8c68a";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-cp-volume-manager-amd64";
          sha256 = "6a85d37075cf062fdcdc888ed9dc0989544c1c00f7d3b7cf000dcffefe28db43";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-cp-volume-manager-arm64";
          sha256 = "85e1c85595ed5246e84eb9aea05f6d73435ea2238be0ac32e2168433292dafef";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-cp-failover-controller-amd64";
          sha256 = "d8e18f1c0d73b7d76c0553ea7c997a8f8dd1cc9a565fef67c87a7f21f062a36f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-cp-failover-controller-arm64";
          sha256 = "637612c12cf92796b77abde1e27b87d0f2dd8d65d2f58ee0a46b94d81531fc1c";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-cp-sdn-controller-amd64";
          sha256 = "343d7e6c1687792cccfd034e610ea84e7b1fac76addbd19eaf54668365ab9379";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-cp-sdn-controller-arm64";
          sha256 = "64645d1728b73d6e89cd0e97737dd0a7c3231041c78ab4e524d0189f50f79b9b";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-updater-amd64";
          sha256 = "c5f4336520f6941b0d437e53337119d3543b157157f78c7605ad29f5f16a7d87";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.481/csfx-updater-arm64";
          sha256 = "02f78bc7f1260ab93290b12dc33662288ae5df353911b6ea1b493d697a6725a9";
        };
      };
    };
  };
}

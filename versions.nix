{
  csfx = {
    version = "0.2.2-alpha.479";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-agent-amd64";
        sha256 = "a66e58ddf642a5586c24fd1ed7c4f5f14b65aef5c14aeea9b26fc204ab8cfe9d";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-agent-arm64";
        sha256 = "d164d47f99e57b1eed57b18898e0d948bab1cdbae94a9553c59e99a0cffbc5ad";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-cp-csfx-migrate-amd64";
          sha256 = "00c8379c7bbae478d72dc25d61389a46c022fbb970bbef452f5b73f29a17cbe3";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-cp-csfx-migrate-arm64";
          sha256 = "0f25107c8f0896c61b59b3a7595a979b76be963e4026442b310cc8034e38e9f3";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-cp-api-gateway-amd64";
          sha256 = "e70327209fa45523b99d0b621d00a88a01b5aabab9c2f5e0d15635ae3cd11f2a";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-cp-api-gateway-arm64";
          sha256 = "8d57d97f236a20e72ba9d00be6c2644c52e279d13b7521f2261f3fe4d20e5d2d";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-cp-registry-amd64";
          sha256 = "ab0e59c8b3a9b087d21d5187ca5d0584c2f0f6637a22f59e58b40cea6d580519";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-cp-registry-arm64";
          sha256 = "68770c47d0f587e541d81090e29b70e38cac2a3c7069312c7578e30d2c167f21";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-cp-scheduler-amd64";
          sha256 = "45e6e1a09098da173ecdca848017bea2d9ea9eedb32291548aa323f809602779";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-cp-scheduler-arm64";
          sha256 = "db330a03bf919986316bfcbedaa7e4795b2871ace8875f9a35112df056e937d2";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-cp-volume-manager-amd64";
          sha256 = "6a85d37075cf062fdcdc888ed9dc0989544c1c00f7d3b7cf000dcffefe28db43";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-cp-volume-manager-arm64";
          sha256 = "85e1c85595ed5246e84eb9aea05f6d73435ea2238be0ac32e2168433292dafef";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-cp-failover-controller-amd64";
          sha256 = "d8e18f1c0d73b7d76c0553ea7c997a8f8dd1cc9a565fef67c87a7f21f062a36f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-cp-failover-controller-arm64";
          sha256 = "637612c12cf92796b77abde1e27b87d0f2dd8d65d2f58ee0a46b94d81531fc1c";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-cp-sdn-controller-amd64";
          sha256 = "343d7e6c1687792cccfd034e610ea84e7b1fac76addbd19eaf54668365ab9379";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-cp-sdn-controller-arm64";
          sha256 = "64645d1728b73d6e89cd0e97737dd0a7c3231041c78ab4e524d0189f50f79b9b";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-updater-amd64";
          sha256 = "2e3c11702941d7464a26f84653d5f7afcc6deef894f4b22a60329c035c7f4658";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.479/csfx-updater-arm64";
          sha256 = "510486742c8caf6de9d91a3bfd65012b9951112fe4c5d17a961858f842a0911a";
        };
      };
    };
  };
}

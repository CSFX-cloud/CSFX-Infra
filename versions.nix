{
  csfx = {
    version = "0.2.2-alpha.503";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-agent-amd64";
        sha256 = "18241b3e5bdc6c30bbf039df58b52bb7076293d60e4327008647f5a935cbc2ec";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-agent-arm64";
        sha256 = "ea2f0b35c8170722e173f5b9504c981051185f2c20a3713cc4b79f2f52ad4891";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-cp-csfx-migrate-amd64";
          sha256 = "00c8379c7bbae478d72dc25d61389a46c022fbb970bbef452f5b73f29a17cbe3";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-cp-csfx-migrate-arm64";
          sha256 = "0f25107c8f0896c61b59b3a7595a979b76be963e4026442b310cc8034e38e9f3";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-cp-api-gateway-amd64";
          sha256 = "44639f14b1753c8bb6e82fb2c7d248c007ae0fd10f5cc4e0dcc3d7388698d9c2";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-cp-api-gateway-arm64";
          sha256 = "5b53d237d3bffa4a064506d6fad7751b1f7c31607bbbb57f3deafd7c1678a7a1";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-cp-registry-amd64";
          sha256 = "3a4131c5a0e4381b22ba390a19d81cb4fdbc17b22260a0dcf223854c735815ad";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-cp-registry-arm64";
          sha256 = "b9c4188259a8804f7a32643e1cf41c9fe57166eeee3759847ff3cf1f9ed02daa";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-cp-scheduler-amd64";
          sha256 = "c5caa25aacd404ed3c650d50e2bccb0f65a76f6053a4579e1c6f9740bc08bd0f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-cp-scheduler-arm64";
          sha256 = "23fa992376258c934299e5418321b6b306b2c815f86a9242a1e9593a3ac8c68a";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-cp-volume-manager-amd64";
          sha256 = "6a85d37075cf062fdcdc888ed9dc0989544c1c00f7d3b7cf000dcffefe28db43";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-cp-volume-manager-arm64";
          sha256 = "85e1c85595ed5246e84eb9aea05f6d73435ea2238be0ac32e2168433292dafef";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-cp-failover-controller-amd64";
          sha256 = "d8e18f1c0d73b7d76c0553ea7c997a8f8dd1cc9a565fef67c87a7f21f062a36f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-cp-failover-controller-arm64";
          sha256 = "637612c12cf92796b77abde1e27b87d0f2dd8d65d2f58ee0a46b94d81531fc1c";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-cp-sdn-controller-amd64";
          sha256 = "343d7e6c1687792cccfd034e610ea84e7b1fac76addbd19eaf54668365ab9379";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-cp-sdn-controller-arm64";
          sha256 = "64645d1728b73d6e89cd0e97737dd0a7c3231041c78ab4e524d0189f50f79b9b";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-updater-amd64";
          sha256 = "6dca1eca5ff12d068a10fb845a11f27c4a850129f225e85586fad17efd3f3ef7";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-updater-arm64";
          sha256 = "1da7d25b68590f523024e8a8f5ca430e7e2bc339c52ff1dfba821e38b5b8fbdd";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.503/csfx-frontend.tar.gz";
      sha256 = "e70ebc7d274395f5fbd0d00de59836b1aeb15c7a82dd22985d85111ea8640cab";
    };
  };
}

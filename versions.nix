{
  csfx = {
    version = "0.2.2-alpha.498";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-agent-amd64";
        sha256 = "40e3f2107c9a89201260d7c79417067382bd818babdf17db7b4ad55b4d75867c";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-agent-arm64";
        sha256 = "f1637dde6deccb0c8dafacd3908345c888a7ed3d2a700b99d240a3b274a19b43";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-cp-csfx-migrate-amd64";
          sha256 = "00c8379c7bbae478d72dc25d61389a46c022fbb970bbef452f5b73f29a17cbe3";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-cp-csfx-migrate-arm64";
          sha256 = "0f25107c8f0896c61b59b3a7595a979b76be963e4026442b310cc8034e38e9f3";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-cp-api-gateway-amd64";
          sha256 = "f8b4f12b23bb721d240a650349931bfa1bbd5df52c2086a5ba9a6e9adc53c5bc";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-cp-api-gateway-arm64";
          sha256 = "3f8f1dc756ade3b8b6610ea0f5cf9699cac575db709c3fad66e657722ecf42cf";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-cp-registry-amd64";
          sha256 = "3a4131c5a0e4381b22ba390a19d81cb4fdbc17b22260a0dcf223854c735815ad";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-cp-registry-arm64";
          sha256 = "b9c4188259a8804f7a32643e1cf41c9fe57166eeee3759847ff3cf1f9ed02daa";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-cp-scheduler-amd64";
          sha256 = "c5caa25aacd404ed3c650d50e2bccb0f65a76f6053a4579e1c6f9740bc08bd0f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-cp-scheduler-arm64";
          sha256 = "23fa992376258c934299e5418321b6b306b2c815f86a9242a1e9593a3ac8c68a";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-cp-volume-manager-amd64";
          sha256 = "6a85d37075cf062fdcdc888ed9dc0989544c1c00f7d3b7cf000dcffefe28db43";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-cp-volume-manager-arm64";
          sha256 = "85e1c85595ed5246e84eb9aea05f6d73435ea2238be0ac32e2168433292dafef";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-cp-failover-controller-amd64";
          sha256 = "d8e18f1c0d73b7d76c0553ea7c997a8f8dd1cc9a565fef67c87a7f21f062a36f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-cp-failover-controller-arm64";
          sha256 = "637612c12cf92796b77abde1e27b87d0f2dd8d65d2f58ee0a46b94d81531fc1c";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-cp-sdn-controller-amd64";
          sha256 = "343d7e6c1687792cccfd034e610ea84e7b1fac76addbd19eaf54668365ab9379";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-cp-sdn-controller-arm64";
          sha256 = "64645d1728b73d6e89cd0e97737dd0a7c3231041c78ab4e524d0189f50f79b9b";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-updater-amd64";
          sha256 = "6dca1eca5ff12d068a10fb845a11f27c4a850129f225e85586fad17efd3f3ef7";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.498/csfx-updater-arm64";
          sha256 = "1da7d25b68590f523024e8a8f5ca430e7e2bc339c52ff1dfba821e38b5b8fbdd";
        };
      };
    };
  };
}

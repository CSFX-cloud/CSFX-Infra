{
  csfx = {
    version = "0.2.2-alpha.504";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-agent-amd64";
        sha256 = "407efffb1300a5e0e4d4f4835e9f2c4ec8707b31c04cd3e30c6e055fb2138005";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-agent-arm64";
        sha256 = "af255947b0f7f0e177f4e67d2be9a3e4b931ee49ca825b4a29ec47e9b6d7bb23";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-cp-csfx-migrate-amd64";
          sha256 = "00c8379c7bbae478d72dc25d61389a46c022fbb970bbef452f5b73f29a17cbe3";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-cp-csfx-migrate-arm64";
          sha256 = "0f25107c8f0896c61b59b3a7595a979b76be963e4026442b310cc8034e38e9f3";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-cp-api-gateway-amd64";
          sha256 = "228b6cb879a6ec2b40bb046d0c0ffdce462b60d6695e0a71698d9f6d811b1f3e";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-cp-api-gateway-arm64";
          sha256 = "3db41135f222b7aecb165c395aa6eeb1e906e9ab998a2faae0870ace651f8977";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-cp-registry-amd64";
          sha256 = "3a4131c5a0e4381b22ba390a19d81cb4fdbc17b22260a0dcf223854c735815ad";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-cp-registry-arm64";
          sha256 = "b9c4188259a8804f7a32643e1cf41c9fe57166eeee3759847ff3cf1f9ed02daa";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-cp-scheduler-amd64";
          sha256 = "c5caa25aacd404ed3c650d50e2bccb0f65a76f6053a4579e1c6f9740bc08bd0f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-cp-scheduler-arm64";
          sha256 = "23fa992376258c934299e5418321b6b306b2c815f86a9242a1e9593a3ac8c68a";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-cp-volume-manager-amd64";
          sha256 = "6a85d37075cf062fdcdc888ed9dc0989544c1c00f7d3b7cf000dcffefe28db43";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-cp-volume-manager-arm64";
          sha256 = "85e1c85595ed5246e84eb9aea05f6d73435ea2238be0ac32e2168433292dafef";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-cp-failover-controller-amd64";
          sha256 = "d8e18f1c0d73b7d76c0553ea7c997a8f8dd1cc9a565fef67c87a7f21f062a36f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-cp-failover-controller-arm64";
          sha256 = "637612c12cf92796b77abde1e27b87d0f2dd8d65d2f58ee0a46b94d81531fc1c";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-cp-sdn-controller-amd64";
          sha256 = "343d7e6c1687792cccfd034e610ea84e7b1fac76addbd19eaf54668365ab9379";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-cp-sdn-controller-arm64";
          sha256 = "64645d1728b73d6e89cd0e97737dd0a7c3231041c78ab4e524d0189f50f79b9b";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-updater-amd64";
          sha256 = "6dca1eca5ff12d068a10fb845a11f27c4a850129f225e85586fad17efd3f3ef7";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-updater-arm64";
          sha256 = "1da7d25b68590f523024e8a8f5ca430e7e2bc339c52ff1dfba821e38b5b8fbdd";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.504/csfx-frontend.tar.gz";
      sha256 = "41f202e960675053041e29b5da1115afc7a904041cec2db33210822ecd65ef98";
    };
  };
}

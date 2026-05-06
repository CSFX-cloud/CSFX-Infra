{
  csfx = {
    version = "0.2.2-alpha.461";
    images = {
      patroni = { digest = "sha256:0000000000000000000000000000000000000000000000000000000000000000"; };
    };
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.461/csfx-agent-amd64";
        sha256 = "ec245d472ddf0903f376b1b4b922d34d764ae244b62b8889c883c7134d4148ef";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.461/csfx-agent-arm64";
        sha256 = "be995aceae5a2a59f8acb4c025bab0ddda1954cb24992cd392be1f3506f724f0";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-cp-csfx-migrate-amd64";
          sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-cp-csfx-migrate-arm64";
          sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-cp-api-gateway-amd64";
          sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-cp-api-gateway-arm64";
          sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-cp-registry-amd64";
          sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-cp-registry-arm64";
          sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-cp-scheduler-amd64";
          sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-cp-scheduler-arm64";
          sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-cp-volume-manager-amd64";
          sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-cp-volume-manager-arm64";
          sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-cp-failover-controller-amd64";
          sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-cp-failover-controller-arm64";
          sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-cp-sdn-controller-amd64";
          sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-cp-sdn-controller-arm64";
          sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
        };
      };
    };
  };
}

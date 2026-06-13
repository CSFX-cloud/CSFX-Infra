{
  csfx = {
    version = "0.2.2-alpha.510";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-agent-amd64";
        sha256 = "153f573ec5669fdb674c9680ab2b7cfcc37e2737cf4b31a9d2f9565941480145";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-agent-arm64";
        sha256 = "3d1bafe257b2fb87a7512b3450e5c67cadf61e4694c3b6fe737324af3c9dd21a";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-cp-csfx-migrate-amd64";
          sha256 = "9c8e558f02ce5652d954df26a64a998af653fa38bd51eedcddc6e38e574bdc4c";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-cp-csfx-migrate-arm64";
          sha256 = "534be3dd7de9a867cd9cbac6820e4c2b286ed2fd0c05d6fe5ee506c909abe2a1";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-cp-api-gateway-amd64";
          sha256 = "830ee824e30e9f0f4004fa5db18a3d0cdfd96c4f5c967c229c0c64d47514faa6";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-cp-api-gateway-arm64";
          sha256 = "4b6202bd005badb045b2b854dcbe7d0d7ace4917d7e2a456c52a7d167a422438";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-cp-registry-amd64";
          sha256 = "f39a0120d6ae7630a8fb83d254e79faccc58c27105e1e3ed08889009b978ed0a";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-cp-registry-arm64";
          sha256 = "4c8c2bf6509e1d5ff8d3f5fa1ce9d12de7c68c63ce11311b08d0d648d49f7761";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-cp-scheduler-amd64";
          sha256 = "82ecb1116eeb73764682fe44e2f8574526d03d9eb6938cab61542d1d97d1963c";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-cp-scheduler-arm64";
          sha256 = "81d8a4a2ddc3009110e1d05b9a2889c1326e69fb19aeb466f0c4438105fce44f";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-cp-volume-manager-amd64";
          sha256 = "e6e54bbd0feb0a1dc097e09edad96bd85617b5fef4acd9d3c37a03c238aba864";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-cp-volume-manager-arm64";
          sha256 = "0a6356aecb9f6e02c83208bf6a9a81004867079e893303d2d29a8eaf8e15a1ff";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-cp-failover-controller-amd64";
          sha256 = "043104c19b3f93a1f259a77a73108a217f29fd217bc961d807056c2114562351";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-cp-failover-controller-arm64";
          sha256 = "c853086a4d19a2ee181edcb8a187b487d473b9eaada5883363c9e453f1115e26";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-cp-sdn-controller-amd64";
          sha256 = "8f5090f50936d8eac591cd74fca3dcaace31e1fa1ec62f30940054608cb11eef";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-cp-sdn-controller-arm64";
          sha256 = "2fa22e367b7541151aaf14feae1250b7de56f5d25300c97051e0cecf34f6e8fb";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-updater-amd64";
          sha256 = "d36f9c81e24ad38c36a65cdb17fe4c74e93c97fcf7954aafe5f9d2eec18904e1";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-updater-arm64";
          sha256 = "1c469acb4fdca7c1b5783321fdd4111d8e98884ea049b989c23f3987931304ef";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.510/csfx-frontend.tar.gz";
      sha256 = "d2595cb62e23474feb377ac07d6428f73fa644d4c0fbb5997b6c6319eaacbeda";
    };
  };
}

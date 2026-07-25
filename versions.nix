{
  firecrackerGuestKernel = {
    amd64 = {
      url    = "https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.9/x86_64/vmlinux-6.1.102";
      sha256 = "3b6e45c66d1b66d4fb0a1528107abbe890972f94e902bafe85fdf5108288c575";
    };
    arm64 = {
      url    = "https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.9/aarch64/vmlinux-6.1.102";
      sha256 = "aee80c3ab9bc2d32f4c00de8ddf919c200359a400aae7c4710e8bc8ad438e1c4";
    };
  };
  csfx = {
    version = "0.2.2-alpha.678";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-agent-amd64";
        sha256 = "fe329bda987469f3ef99d929806cf9ceabfff56343c21e7e23463b49ec82b13f";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-agent-arm64";
        sha256 = "969e03782b62999186f94e4a8423af1f7fb2ab9b72a4bafe62b1cff807613247";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-guest-init-amd64";
        sha256 = "6e7da208b173c6d3bdb8b44166baad81fd769ac782d9f8ac195aee1bef13dd63";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-guest-init-arm64";
        sha256 = "55ebdc04bc41dc47b5d3b18c96b5c52439d7068dd8c203dc40478fa76f39f7c5";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-cp-csfx-migrate-amd64";
          sha256 = "0aa2dd40ea7df4d4d5dc9a94d74752134577e34b24bb9fdb6683c82942f7d081";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-cp-csfx-migrate-arm64";
          sha256 = "68efa2a50a5e3ad6f071af36e76a96c8e6a1328ce561d99c77a2fdec509f0db0";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-cp-api-gateway-amd64";
          sha256 = "162df4821206f1bb67428af91900f0047cd57a92dae70b7aaec2941dc7df2e9e";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-cp-api-gateway-arm64";
          sha256 = "ec3f443eb9afa19e7498fd9a93938214496f4db4a60b22b6fbad24caea886111";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-cp-registry-amd64";
          sha256 = "1c1b0508777c06cba2d5e4fa27f652e6772700f87097c34746c75f5f18ea5e0d";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-cp-registry-arm64";
          sha256 = "87935f717befd8528a74c9759c425bfe30ef96f4c9022ca23eb166b672a7142d";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-cp-scheduler-amd64";
          sha256 = "9322f071818c7aa52260ffe118d33ba87b745452953db8cfb1d93f767089afd3";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-cp-scheduler-arm64";
          sha256 = "cabfc12cd8432e64e589de297a1f118c7969f86d95c69e727ca8724c5290be13";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-cp-volume-manager-amd64";
          sha256 = "682b55c8c5b768325f2d605246c932acf0f301cbc6e0566dbab53aff02d6f49d";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-cp-volume-manager-arm64";
          sha256 = "3c70c7e9573448b3eeeb15cdb34e74a65b506aaa973a73893217dbfa5fe94d9c";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-cp-failover-controller-amd64";
          sha256 = "065bf4c67e4877238cc9797e650c35b430b03983b13dc2d7fbc5cfa94afe4249";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-cp-failover-controller-arm64";
          sha256 = "dc2d19e48483b77a200274b14c8050f215201dfe7c59f149933363a9a9391ad2";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-cp-sdn-controller-amd64";
          sha256 = "a4dcd646e837cb627ef798daac20ec95316e2048c8780a835fca69a30a6c4161";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-cp-sdn-controller-arm64";
          sha256 = "b17db5f81fb69609a19ed2b52987d351940913f3407d45dab42afbd388acb53c";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-updater-amd64";
          sha256 = "8726ff1ed0874809ef08f766f35c976128314562e406f24e7782022e0c3f0f61";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-updater-arm64";
          sha256 = "9478e44761452cb9dcbdaf01ecca9773e5ae0769d4e778a0fb6525f158826f2c";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.678/csfx-frontend.tar.gz";
      sha256 = "c959471077d989a40c0ad8bd4f604137ecdb960d6072cc2f75865a599f914c02";
    };
  };
}

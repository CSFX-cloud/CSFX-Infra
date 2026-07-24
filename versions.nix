{
  csfx = {
    version = "0.2.2-alpha.671";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-agent-amd64";
        sha256 = "72fd043665a68361f7ac6d9b044f2d5593bbeac78dac37d038e253414eb6c36c";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-agent-arm64";
        sha256 = "a30b1df7d93e677578a4a0318bd64fe553fcf808ae5997ffb276037818161ac6";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-guest-init-amd64";
        sha256 = "6e7da208b173c6d3bdb8b44166baad81fd769ac782d9f8ac195aee1bef13dd63";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-guest-init-arm64";
        sha256 = "55ebdc04bc41dc47b5d3b18c96b5c52439d7068dd8c203dc40478fa76f39f7c5";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-cp-csfx-migrate-amd64";
          sha256 = "0aa2dd40ea7df4d4d5dc9a94d74752134577e34b24bb9fdb6683c82942f7d081";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-cp-csfx-migrate-arm64";
          sha256 = "68efa2a50a5e3ad6f071af36e76a96c8e6a1328ce561d99c77a2fdec509f0db0";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-cp-api-gateway-amd64";
          sha256 = "3a202d1c1d4b753bba02967e1933993fc2af49cb81769bd4d3424596e62cc199";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-cp-api-gateway-arm64";
          sha256 = "217a3d6697b572572033ef61a0b3887eebbdf15c1373426e77c6901031552743";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-cp-registry-amd64";
          sha256 = "1c1b0508777c06cba2d5e4fa27f652e6772700f87097c34746c75f5f18ea5e0d";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-cp-registry-arm64";
          sha256 = "87935f717befd8528a74c9759c425bfe30ef96f4c9022ca23eb166b672a7142d";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-cp-scheduler-amd64";
          sha256 = "9322f071818c7aa52260ffe118d33ba87b745452953db8cfb1d93f767089afd3";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-cp-scheduler-arm64";
          sha256 = "cabfc12cd8432e64e589de297a1f118c7969f86d95c69e727ca8724c5290be13";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-cp-volume-manager-amd64";
          sha256 = "682b55c8c5b768325f2d605246c932acf0f301cbc6e0566dbab53aff02d6f49d";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-cp-volume-manager-arm64";
          sha256 = "3c70c7e9573448b3eeeb15cdb34e74a65b506aaa973a73893217dbfa5fe94d9c";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-cp-failover-controller-amd64";
          sha256 = "065bf4c67e4877238cc9797e650c35b430b03983b13dc2d7fbc5cfa94afe4249";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-cp-failover-controller-arm64";
          sha256 = "dc2d19e48483b77a200274b14c8050f215201dfe7c59f149933363a9a9391ad2";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-cp-sdn-controller-amd64";
          sha256 = "a4dcd646e837cb627ef798daac20ec95316e2048c8780a835fca69a30a6c4161";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-cp-sdn-controller-arm64";
          sha256 = "b17db5f81fb69609a19ed2b52987d351940913f3407d45dab42afbd388acb53c";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-updater-amd64";
          sha256 = "8726ff1ed0874809ef08f766f35c976128314562e406f24e7782022e0c3f0f61";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-updater-arm64";
          sha256 = "9478e44761452cb9dcbdaf01ecca9773e5ae0769d4e778a0fb6525f158826f2c";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.671/csfx-frontend.tar.gz";
      sha256 = "e67b33f33cb59c7322b7dd119a95ec3696a87787900bf86ae00e12a0c48016e1";
    };
  };
}

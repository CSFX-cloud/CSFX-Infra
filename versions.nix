{
  csfx = {
    version = "0.2.2-alpha.669";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-agent-amd64";
        sha256 = "861574a9ca6756c6489783d99b58fcbddf02d12631d496a68f64f95084196cb0";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-agent-arm64";
        sha256 = "07a13c2e4fdcdc19f331f1e791b9e0a0c2f86b9bfef0c65b0733eb8bb51805a1";
      };
    };
    # PLACEHOLDER: replace after next release-build.yml run publishes real csfx-guest-init artifacts.
    guestInit = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.647/csfx-guest-init-amd64";
        sha256 = "0000000000000000000000000000000000000000000000000000000000000";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.647/csfx-guest-init-arm64";
        sha256 = "0000000000000000000000000000000000000000000000000000000000000";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-cp-csfx-migrate-amd64";
          sha256 = "0aa2dd40ea7df4d4d5dc9a94d74752134577e34b24bb9fdb6683c82942f7d081";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-cp-csfx-migrate-arm64";
          sha256 = "68efa2a50a5e3ad6f071af36e76a96c8e6a1328ce561d99c77a2fdec509f0db0";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-cp-api-gateway-amd64";
          sha256 = "acb67be2756732446d16a67d2a1d511bb61e6f1009992000f26612dd5cc1a947";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-cp-api-gateway-arm64";
          sha256 = "5d9ffe196b090201abf8e05d735d8ae457c3a7488ffbcd5477f95cbbad80f6fc";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-cp-registry-amd64";
          sha256 = "1c1b0508777c06cba2d5e4fa27f652e6772700f87097c34746c75f5f18ea5e0d";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-cp-registry-arm64";
          sha256 = "87935f717befd8528a74c9759c425bfe30ef96f4c9022ca23eb166b672a7142d";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-cp-scheduler-amd64";
          sha256 = "9322f071818c7aa52260ffe118d33ba87b745452953db8cfb1d93f767089afd3";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-cp-scheduler-arm64";
          sha256 = "cabfc12cd8432e64e589de297a1f118c7969f86d95c69e727ca8724c5290be13";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-cp-volume-manager-amd64";
          sha256 = "682b55c8c5b768325f2d605246c932acf0f301cbc6e0566dbab53aff02d6f49d";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-cp-volume-manager-arm64";
          sha256 = "3c70c7e9573448b3eeeb15cdb34e74a65b506aaa973a73893217dbfa5fe94d9c";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-cp-failover-controller-amd64";
          sha256 = "065bf4c67e4877238cc9797e650c35b430b03983b13dc2d7fbc5cfa94afe4249";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-cp-failover-controller-arm64";
          sha256 = "dc2d19e48483b77a200274b14c8050f215201dfe7c59f149933363a9a9391ad2";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-cp-sdn-controller-amd64";
          sha256 = "a4dcd646e837cb627ef798daac20ec95316e2048c8780a835fca69a30a6c4161";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-cp-sdn-controller-arm64";
          sha256 = "b17db5f81fb69609a19ed2b52987d351940913f3407d45dab42afbd388acb53c";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-updater-amd64";
          sha256 = "8726ff1ed0874809ef08f766f35c976128314562e406f24e7782022e0c3f0f61";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-updater-arm64";
          sha256 = "9478e44761452cb9dcbdaf01ecca9773e5ae0769d4e778a0fb6525f158826f2c";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.669/csfx-frontend.tar.gz";
      sha256 = "88446dbc57fb88dbd9d5b3b67d56bb9da6f06af7dffd7208b400dc0f344ce505";
    };
  };
}

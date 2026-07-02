{
  csfx = {
    version = "0.2.2-alpha.589";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-agent-amd64";
        sha256 = "e9b5ac235b74bedadd540c327104c351f7bfb25cf6478b5e0a0f7b2b34924368";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-agent-arm64";
        sha256 = "9efccd005f31762c44ab62ef584eb07d87b36ef7173a7053e47532acd2f3d8f1";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-cp-csfx-migrate-amd64";
          sha256 = "fe421176f7b1cb23ad8b83b760c4674dfb973b65288c94bcbe7506520165c04b";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-cp-csfx-migrate-arm64";
          sha256 = "17a7aaddc47c69ae8821bb96584ead9c2c615aa707d118240e2abeec80850e33";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-cp-api-gateway-amd64";
          sha256 = "fb10d15aaa1f0fa220095687f27abd8aa46a5af9ed2a02afe5529907a597538e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-cp-api-gateway-arm64";
          sha256 = "f2980de8b5dce4244385380d45159ebc4a3375faae5b16687cd73ac46464e0ae";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-cp-registry-amd64";
          sha256 = "4480036af525b850c7b2aac4cc735ab1e2e8620d4d11ebe37f021fb22a1e035f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-cp-registry-arm64";
          sha256 = "8dd5275cf88b26283a57d194af46930dc4eec1f2cd4db296b8a61169e6f730cd";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-cp-scheduler-amd64";
          sha256 = "944bb143af040fc2f1100a008787ce2160bddc0fef840951f00eda46ec8490f4";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-cp-scheduler-arm64";
          sha256 = "2c745894e78873198557fec05519fd75d1fac1db5c376b6bab786cf926e356c2";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-cp-volume-manager-amd64";
          sha256 = "6ec2d91d0d7cf3c1bd4ba162f02e35d0ebde258cc2eaa4f741e1042b18fe47d5";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-cp-volume-manager-arm64";
          sha256 = "60fcf00d565145dd2115909c8e9ef9eef7c063cbbb8eea48a8e38c7b2ae16ba3";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-cp-failover-controller-amd64";
          sha256 = "b483228453905b779549421e4d9c5bdaaa173d9507fbe027c1a26c41991d974a";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-cp-failover-controller-arm64";
          sha256 = "56412594404ad19dad6d57074b2d53142845392f416767b25c95a5384088c36d";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-cp-sdn-controller-amd64";
          sha256 = "96e7bccd64155274a5838576b153ed8418741bd2fa7a86b72dee351d07d8a6af";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-cp-sdn-controller-arm64";
          sha256 = "c19bc3f4a96acc68acc9aa133cc1ebff29b33a52346cfba17d8f737c61e8162b";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-updater-amd64";
          sha256 = "ff9638dec9ab21b4f1dac45958ab96bb4800fdd2c810d667b6cc857c91fc362f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-updater-arm64";
          sha256 = "cfd76d53b940be91d8b8ca572eded445e1bdc34014a897740608cf246e53e146";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.589/csfx-frontend.tar.gz";
      sha256 = "572b4e6ec05bf797579ee2e09b27ff6231e2f44d4ea3abbca85ca6e32dc5688e";
    };
  };
}

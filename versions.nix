{
  csfx = {
    version = "0.2.2-alpha.585";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-agent-amd64";
        sha256 = "f092b5737bcbd2baa5a3062ab9b5a05638a1fddb6afeecbfe56c1d681074c5d1";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-agent-arm64";
        sha256 = "6e06c6de157eb5e5df5561eabf6a8a690b403d601781338a0487743119f4be99";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-cp-csfx-migrate-amd64";
          sha256 = "6672fc92c37e25d8978526983aeff87e4ee844646d1ff944efab64a15c94ff84";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-cp-csfx-migrate-arm64";
          sha256 = "bd28cbe2be7b46b90ac70e3fc9a535a328a1e6738673afad4ea99125e258c431";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-cp-api-gateway-amd64";
          sha256 = "8765a3d3a425cd2ee3d84dff55e3ad9c8f1334be570e0d20653bea0f20d27501";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-cp-api-gateway-arm64";
          sha256 = "44099e6230a37d94763949c8cfe79dfe08d597f06a15c705424ea239ed84627e";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-cp-registry-amd64";
          sha256 = "be9347ce461f31199fff90613531c7f0f05b63d04b165968521975e856315a52";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-cp-registry-arm64";
          sha256 = "523a368c33d6723265fc35ff01918370eedc4359b69b4192d02f0de090da9a8f";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-cp-scheduler-amd64";
          sha256 = "260fb73b57d55db3ac649cb13700404b167e8fa198202c44d005deb30f85ad91";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-cp-scheduler-arm64";
          sha256 = "34a8684fcfcd4dbfa9e36135190e8015ab5070c670d636d2cf366123030515be";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-cp-volume-manager-amd64";
          sha256 = "a99726912f457f0ee1b26a4069011a3fb01f75ecba85c2dad777f652bcd6893a";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-cp-volume-manager-arm64";
          sha256 = "3cac87beed4e7f511616785ee7c80c2ca1a04c375dab080ed6e26a29479b568a";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-cp-failover-controller-amd64";
          sha256 = "b03a4a804d45c58dce90cec45a1d5c5293c7006a0177e91fd407e14eab8e6b0f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-cp-failover-controller-arm64";
          sha256 = "d653118f3000cfc4ce424877923868ece2c8ad59d2659a7b4c3126386126ce94";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-cp-sdn-controller-amd64";
          sha256 = "8b07f8b96a0d16ec5dc7191d05c9e225440ab3164aaa29ad2898d4f343e216af";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-cp-sdn-controller-arm64";
          sha256 = "3211f14e5c2e3fdd2cbdec7971a08f6ed843b2ca1f0113e1ed7a4d950d3ba8b1";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-updater-amd64";
          sha256 = "ff9638dec9ab21b4f1dac45958ab96bb4800fdd2c810d667b6cc857c91fc362f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-updater-arm64";
          sha256 = "cfd76d53b940be91d8b8ca572eded445e1bdc34014a897740608cf246e53e146";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.585/csfx-frontend.tar.gz";
      sha256 = "6cae6f4aa3e57fd65ca40c864114d1c9100a5d7dd2de35da644e3709c2bcacd7";
    };
  };
}

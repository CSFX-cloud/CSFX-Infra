{
  csfx = {
    version = "0.2.2-alpha.580";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-agent-amd64";
        sha256 = "076536be8c739798120921b9377b910d1fabbbc96b5256a2cb1e19b31a5c3ae9";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-agent-arm64";
        sha256 = "58029e18adcdc11143b8d56352b6d47c7955ce6a7e42115a68735430a7e4e8e7";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-cp-csfx-migrate-amd64";
          sha256 = "6672fc92c37e25d8978526983aeff87e4ee844646d1ff944efab64a15c94ff84";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-cp-csfx-migrate-arm64";
          sha256 = "bd28cbe2be7b46b90ac70e3fc9a535a328a1e6738673afad4ea99125e258c431";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-cp-api-gateway-amd64";
          sha256 = "a6617cb4a57ee09b029510b801abf9c3d3d09423a654f8fb0ca49b6f4e1ec091";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-cp-api-gateway-arm64";
          sha256 = "0a156d3bca5da4e32117955e83c9c69877182c1d4a84710146478fc805ae42a1";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-cp-registry-amd64";
          sha256 = "be9347ce461f31199fff90613531c7f0f05b63d04b165968521975e856315a52";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-cp-registry-arm64";
          sha256 = "523a368c33d6723265fc35ff01918370eedc4359b69b4192d02f0de090da9a8f";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-cp-scheduler-amd64";
          sha256 = "260fb73b57d55db3ac649cb13700404b167e8fa198202c44d005deb30f85ad91";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-cp-scheduler-arm64";
          sha256 = "34a8684fcfcd4dbfa9e36135190e8015ab5070c670d636d2cf366123030515be";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-cp-volume-manager-amd64";
          sha256 = "a99726912f457f0ee1b26a4069011a3fb01f75ecba85c2dad777f652bcd6893a";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-cp-volume-manager-arm64";
          sha256 = "3cac87beed4e7f511616785ee7c80c2ca1a04c375dab080ed6e26a29479b568a";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-cp-failover-controller-amd64";
          sha256 = "b03a4a804d45c58dce90cec45a1d5c5293c7006a0177e91fd407e14eab8e6b0f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-cp-failover-controller-arm64";
          sha256 = "d653118f3000cfc4ce424877923868ece2c8ad59d2659a7b4c3126386126ce94";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-cp-sdn-controller-amd64";
          sha256 = "8b07f8b96a0d16ec5dc7191d05c9e225440ab3164aaa29ad2898d4f343e216af";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-cp-sdn-controller-arm64";
          sha256 = "3211f14e5c2e3fdd2cbdec7971a08f6ed843b2ca1f0113e1ed7a4d950d3ba8b1";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-updater-amd64";
          sha256 = "ff9638dec9ab21b4f1dac45958ab96bb4800fdd2c810d667b6cc857c91fc362f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-updater-arm64";
          sha256 = "cfd76d53b940be91d8b8ca572eded445e1bdc34014a897740608cf246e53e146";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.580/csfx-frontend.tar.gz";
      sha256 = "701b868d79e3a6d6bf267f439b4ed19bcbeddb561efcb2ad7a42260ae6e55401";
    };
  };
}

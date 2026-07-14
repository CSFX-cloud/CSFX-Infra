{
  csfx = {
    version = "0.2.2-alpha.635";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-agent-amd64";
        sha256 = "113dfefcdc761d0369c91d78d09b7a9c5809a4402a24dbd7b34dd2c04e99a3c8";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-agent-arm64";
        sha256 = "bf40056269e54d4e9ce5d06d28b676097420e60c12fd11c43a2a49fd17e20471";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-cp-csfx-migrate-amd64";
          sha256 = "808398ce54c198492f66ef1d19ce700991e0511ea399cf95e6cf0be3fae7dcc3";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-cp-csfx-migrate-arm64";
          sha256 = "67cddd791c435c0febf16722783ce11615339e2236afa8c34a5cd7f4286e4319";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-cp-api-gateway-amd64";
          sha256 = "542ea29fae68597d3b83df93d6083b08280f8be41a9bb42008f833f6e7f89768";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-cp-api-gateway-arm64";
          sha256 = "0ecd34c95a07c9329a22986d8c80bd11bac3fdc25c941df31058f57c89c1bde7";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-cp-registry-amd64";
          sha256 = "466e095d56f758faff27aefb38ad07ecbe27aec5561ef12c18d48f5841648d55";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-cp-registry-arm64";
          sha256 = "ccacd893daced6de164f097cb634c8a78626c75af9dc9612dfd1bf3631a970cd";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-cp-scheduler-amd64";
          sha256 = "3bab2c586d41d5f139fbab5ab027cc9e9e0ce80300d724c3871cdabda2ae5b46";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-cp-scheduler-arm64";
          sha256 = "e10250d768717cd23d950cff37ec8264beba427f4493ed596fa95539f2700a19";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-cp-volume-manager-amd64";
          sha256 = "e36d5143119e73bb2f0ea32a05fa222a5ac8596287df3a2e85c653f57c09b11e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-cp-volume-manager-arm64";
          sha256 = "8a17e9342d8731cd289c50e4c3d418f50cdbb8bf312652e7816a568cc2126679";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-cp-failover-controller-amd64";
          sha256 = "ee881b8d9dffe4818ddb8f839cbc05694f51c535bd4ffc8138d7886bb2e7fd19";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-cp-failover-controller-arm64";
          sha256 = "8df6a0f6fe03667414bcc09385223df39c500ea157d9d3b4644b6bd6dd5c8c52";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-cp-sdn-controller-amd64";
          sha256 = "fe399f112d6115591535d36dda8c8122b5bead55fd8fb13220530612f03c6c1e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-cp-sdn-controller-arm64";
          sha256 = "4e0def2733772734a495b6c205849a8e0399730f37910decbf645ee12843a2ff";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-updater-amd64";
          sha256 = "407e046e85f893c2ad827937a592e65a21ae6ccfcffa8f93521b57409ba60d98";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-updater-arm64";
          sha256 = "f56997db61270282035c4c5d7ba2e154159969c73b763add45d88d5acab49979";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.635/csfx-frontend.tar.gz";
      sha256 = "b9346fe1285762350cca7477a91fa2c39198fd28fc05e36565cbb1808e1b921a";
    };
  };
}

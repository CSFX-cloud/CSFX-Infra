{
  csfx = {
    version = "0.2.2-alpha.634";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-agent-amd64";
        sha256 = "9c63d86d3f56430a7676776506bd92a8f0f95b067bf55754f9fe091e35bee9cb";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-agent-arm64";
        sha256 = "33ca7632c545b0e92f7e6c0593ce71121506b9f31a7648aa77c71c147f9f42e3";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-cp-csfx-migrate-amd64";
          sha256 = "808398ce54c198492f66ef1d19ce700991e0511ea399cf95e6cf0be3fae7dcc3";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-cp-csfx-migrate-arm64";
          sha256 = "67cddd791c435c0febf16722783ce11615339e2236afa8c34a5cd7f4286e4319";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-cp-api-gateway-amd64";
          sha256 = "e98351190eaca46b5b599375cf19da0d5ce6303736daa44a43061a2be9369671";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-cp-api-gateway-arm64";
          sha256 = "9827e952ba66221b321baf806be800d38d150b04d31b07bee839f1f779cc1291";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-cp-registry-amd64";
          sha256 = "466e095d56f758faff27aefb38ad07ecbe27aec5561ef12c18d48f5841648d55";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-cp-registry-arm64";
          sha256 = "ccacd893daced6de164f097cb634c8a78626c75af9dc9612dfd1bf3631a970cd";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-cp-scheduler-amd64";
          sha256 = "de2753a794bc4951b0fb24caee3160eedc2ce1589c53cebc25a5071a144f0bda";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-cp-scheduler-arm64";
          sha256 = "da41ac7dbc1beb3eab75d1630f7048324b2d1db56be6cf330a21926ef0af2f3c";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-cp-volume-manager-amd64";
          sha256 = "e36d5143119e73bb2f0ea32a05fa222a5ac8596287df3a2e85c653f57c09b11e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-cp-volume-manager-arm64";
          sha256 = "8a17e9342d8731cd289c50e4c3d418f50cdbb8bf312652e7816a568cc2126679";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-cp-failover-controller-amd64";
          sha256 = "ee881b8d9dffe4818ddb8f839cbc05694f51c535bd4ffc8138d7886bb2e7fd19";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-cp-failover-controller-arm64";
          sha256 = "8df6a0f6fe03667414bcc09385223df39c500ea157d9d3b4644b6bd6dd5c8c52";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-cp-sdn-controller-amd64";
          sha256 = "fe399f112d6115591535d36dda8c8122b5bead55fd8fb13220530612f03c6c1e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-cp-sdn-controller-arm64";
          sha256 = "4e0def2733772734a495b6c205849a8e0399730f37910decbf645ee12843a2ff";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-updater-amd64";
          sha256 = "407e046e85f893c2ad827937a592e65a21ae6ccfcffa8f93521b57409ba60d98";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-updater-arm64";
          sha256 = "f56997db61270282035c4c5d7ba2e154159969c73b763add45d88d5acab49979";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.634/csfx-frontend.tar.gz";
      sha256 = "eed069273a3bc64d0b0fe754ef9446ec0b5a1549479283d7bf25096b81944754";
    };
  };
}

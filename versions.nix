{
  csfx = {
    version = "0.2.2-alpha.628";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-agent-amd64";
        sha256 = "0d7868d8214e9e0c3690d36aa27dda8c7e07dec31511e8dbcb8698df77dfcbe2";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-agent-arm64";
        sha256 = "ffb2ad4f2b350776d4beae79a8370cc385b161c39b5d4c004b35c2b30da4bb49";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-cp-csfx-migrate-amd64";
          sha256 = "e69051f52573e2d861205bedc4a4e1c2ce0a54cc6ff80d8fd5e915b2165c55f8";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-cp-csfx-migrate-arm64";
          sha256 = "c85c40748a9ea30201fa282ba0fca814c8170105af640b86b1e03d4e7d3fe2a1";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-cp-api-gateway-amd64";
          sha256 = "0cf75747fab5d457448d9819513f7dd35271f6ba00582fa8de7ee5b660f928d4";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-cp-api-gateway-arm64";
          sha256 = "7ba86a11d8a2b03e809b776f1c42c0c39428e1a5f0aaeec0a85661f5d94b9874";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-cp-registry-amd64";
          sha256 = "bcc531bd0e35a51f1c894174aaf9a1ff85b2b168dd3c41bc8d051bf3d7664255";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-cp-registry-arm64";
          sha256 = "de3bbd328c477b6f7bb2657bc5a6e81c7a97affafb82c80b5db235b10f959a52";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-cp-scheduler-amd64";
          sha256 = "67c1050179ed65bcc8a0481e985d7e6dcbb5c177c7e8da82c62436f9451a613a";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-cp-scheduler-arm64";
          sha256 = "6e2ba509956155eb6eb2ab74c8968da53b3568513c67a1a216be82a917ebd921";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-cp-volume-manager-amd64";
          sha256 = "e36d5143119e73bb2f0ea32a05fa222a5ac8596287df3a2e85c653f57c09b11e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-cp-volume-manager-arm64";
          sha256 = "8a17e9342d8731cd289c50e4c3d418f50cdbb8bf312652e7816a568cc2126679";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-cp-failover-controller-amd64";
          sha256 = "ee881b8d9dffe4818ddb8f839cbc05694f51c535bd4ffc8138d7886bb2e7fd19";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-cp-failover-controller-arm64";
          sha256 = "8df6a0f6fe03667414bcc09385223df39c500ea157d9d3b4644b6bd6dd5c8c52";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-cp-sdn-controller-amd64";
          sha256 = "fe399f112d6115591535d36dda8c8122b5bead55fd8fb13220530612f03c6c1e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-cp-sdn-controller-arm64";
          sha256 = "4e0def2733772734a495b6c205849a8e0399730f37910decbf645ee12843a2ff";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-updater-amd64";
          sha256 = "407e046e85f893c2ad827937a592e65a21ae6ccfcffa8f93521b57409ba60d98";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-updater-arm64";
          sha256 = "f56997db61270282035c4c5d7ba2e154159969c73b763add45d88d5acab49979";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.628/csfx-frontend.tar.gz";
      sha256 = "c691d44859d873e24b4a5195a27124be6776b73ee1a2c583f86df16078214d4d";
    };
  };
}

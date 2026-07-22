{
  csfx = {
    version = "0.2.2-alpha.644";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-agent-amd64";
        sha256 = "9f2cefe17e97858eec5e833be08657f3517f5fee864627db5ce0e4b852a22b9b";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-agent-arm64";
        sha256 = "894007ca7fede7c2c96d80df28362e759f6bf2ebe80c1bc37f50231ad6ef9189";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-cp-csfx-migrate-amd64";
          sha256 = "d9c1a93b7f6d150cb5a37555c5036e04fb514bd9cf6931a53318f9a4554ac877";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-cp-csfx-migrate-arm64";
          sha256 = "7ba4ad991f7c7305a9a6ec3203c8c9634e601b2e71db2be1e435fd36a31bbec2";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-cp-api-gateway-amd64";
          sha256 = "79ee1b7f490d617d7461916e30e067065e9617bdda040a72227c360a451ee54e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-cp-api-gateway-arm64";
          sha256 = "5f7814f3f96ed492c60884c5da7b8af6c3055c49f8300ea28e67b994fd91e90e";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-cp-registry-amd64";
          sha256 = "38a9041653edc0d783a666861185575f549d15204939a43c0f33459a7dc65582";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-cp-registry-arm64";
          sha256 = "1ab4b3cb38bdcc1128342b364b6f40bd7316fc8a609e4acd74cd65550e434d31";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-cp-scheduler-amd64";
          sha256 = "317837b11261ec23d03c24d4808d36b951978c18e95ed8d5b8c10974661d6216";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-cp-scheduler-arm64";
          sha256 = "eddc586a6910ab6e71ccfb4e543a98d975e4ad9a26007a0e5a4bd41844e56e94";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-cp-volume-manager-amd64";
          sha256 = "0bf29ac4a0c23bf07973c374a556bb4a7ba9ba4b042c45f2ff31aa3f0b9d7420";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-cp-volume-manager-arm64";
          sha256 = "c4bd493991cda3fab758cee7ba073b5d5fe6314333a10e071b91bdfc1e72a5e4";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-cp-failover-controller-amd64";
          sha256 = "f1b369583509e2d922c542e79a1e4f0c1684b170903575e639f901a8a5f6c13e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-cp-failover-controller-arm64";
          sha256 = "d63b4fafb35f83e24cdb8b7ca1f14c72d83194c13aab0e047f96575c38faa11c";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-cp-sdn-controller-amd64";
          sha256 = "87df1dd44fbfa1c039d2b0b68246f3025510e00703096e00c64880a75047ec82";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-cp-sdn-controller-arm64";
          sha256 = "64a3a156486da4897d75d3f94d5a3c94b6affc6903fe9d38932241d26ae872a7";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-updater-amd64";
          sha256 = "75112ea700ed9a02c62c98f2793118a6099a40031c7942124399255ddd5caab4";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-updater-arm64";
          sha256 = "292a8ee908c79837ab260a55f397637ab0531493b43df812827cfc34f0b5e1cd";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.644/csfx-frontend.tar.gz";
      sha256 = "1a30cca88f3fd7bcb69dd446f2c00924b43bf169f7b489285c57097861478d7d";
    };
  };
}

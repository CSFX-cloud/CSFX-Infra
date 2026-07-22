{
  csfx = {
    version = "0.2.2-alpha.648";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-agent-amd64";
        sha256 = "4900399559b770c9a7bd033914fc27cbb4d95e57b5f880badaafefc740520267";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-agent-arm64";
        sha256 = "7891648d7ff84634021519fb3a78d5ff0d70d271e83c8626e8f04b91fda2e602";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-cp-csfx-migrate-amd64";
          sha256 = "d9c1a93b7f6d150cb5a37555c5036e04fb514bd9cf6931a53318f9a4554ac877";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-cp-csfx-migrate-arm64";
          sha256 = "7ba4ad991f7c7305a9a6ec3203c8c9634e601b2e71db2be1e435fd36a31bbec2";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-cp-api-gateway-amd64";
          sha256 = "50fc7f60cd3c559038d1d1dc504636502ac3b435da12822afc9e1ea6463d7f76";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-cp-api-gateway-arm64";
          sha256 = "44b8180c3061c43539f9b1f34a3880132074324f057bdda73f1a5729bb7807fe";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-cp-registry-amd64";
          sha256 = "515d3f42cda8071d4c67073947c1d33e4082102b5858005fa7012cae6a5a95c9";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-cp-registry-arm64";
          sha256 = "2879deac1f5d391ba1e2e1727b3a7413b4e9efc2e21126b350bedb9370e641e6";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-cp-scheduler-amd64";
          sha256 = "317837b11261ec23d03c24d4808d36b951978c18e95ed8d5b8c10974661d6216";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-cp-scheduler-arm64";
          sha256 = "eddc586a6910ab6e71ccfb4e543a98d975e4ad9a26007a0e5a4bd41844e56e94";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-cp-volume-manager-amd64";
          sha256 = "0bf29ac4a0c23bf07973c374a556bb4a7ba9ba4b042c45f2ff31aa3f0b9d7420";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-cp-volume-manager-arm64";
          sha256 = "c4bd493991cda3fab758cee7ba073b5d5fe6314333a10e071b91bdfc1e72a5e4";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-cp-failover-controller-amd64";
          sha256 = "f1b369583509e2d922c542e79a1e4f0c1684b170903575e639f901a8a5f6c13e";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-cp-failover-controller-arm64";
          sha256 = "d63b4fafb35f83e24cdb8b7ca1f14c72d83194c13aab0e047f96575c38faa11c";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-cp-sdn-controller-amd64";
          sha256 = "87df1dd44fbfa1c039d2b0b68246f3025510e00703096e00c64880a75047ec82";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-cp-sdn-controller-arm64";
          sha256 = "64a3a156486da4897d75d3f94d5a3c94b6affc6903fe9d38932241d26ae872a7";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-updater-amd64";
          sha256 = "75112ea700ed9a02c62c98f2793118a6099a40031c7942124399255ddd5caab4";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-updater-arm64";
          sha256 = "292a8ee908c79837ab260a55f397637ab0531493b43df812827cfc34f0b5e1cd";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.648/csfx-frontend.tar.gz";
      sha256 = "6bc9b983fdeede9765d7710a12b5f9c5e3c99217b5e078f9e751ec13456e3ba0";
    };
  };
}

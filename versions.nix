{
  csfx = {
    version = "0.2.2-alpha.643";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-agent-amd64";
        sha256 = "eb699b0811257fc643b9d3773420ee2e2a762e3f61f6f6ff79407b066cb9fdac";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-agent-arm64";
        sha256 = "47006c3462d0726c65dc72ad6d2bda9826bb7b152468e05bd9a6421e83d97d32";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-cp-csfx-migrate-amd64";
          sha256 = "d9c1a93b7f6d150cb5a37555c5036e04fb514bd9cf6931a53318f9a4554ac877";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-cp-csfx-migrate-arm64";
          sha256 = "7ba4ad991f7c7305a9a6ec3203c8c9634e601b2e71db2be1e435fd36a31bbec2";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-cp-api-gateway-amd64";
          sha256 = "77c3368d602859864fc0d2f1c64355abeb567fcba03887cfdf0816b165f18511";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-cp-api-gateway-arm64";
          sha256 = "36659cff93f75d88dff9974d5202d30ef014f8b73f29dc82cced007fff1796f3";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-cp-registry-amd64";
          sha256 = "38a9041653edc0d783a666861185575f549d15204939a43c0f33459a7dc65582";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-cp-registry-arm64";
          sha256 = "1ab4b3cb38bdcc1128342b364b6f40bd7316fc8a609e4acd74cd65550e434d31";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-cp-scheduler-amd64";
          sha256 = "317837b11261ec23d03c24d4808d36b951978c18e95ed8d5b8c10974661d6216";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-cp-scheduler-arm64";
          sha256 = "eddc586a6910ab6e71ccfb4e543a98d975e4ad9a26007a0e5a4bd41844e56e94";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-cp-volume-manager-amd64";
          sha256 = "0bf29ac4a0c23bf07973c374a556bb4a7ba9ba4b042c45f2ff31aa3f0b9d7420";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-cp-volume-manager-arm64";
          sha256 = "c4bd493991cda3fab758cee7ba073b5d5fe6314333a10e071b91bdfc1e72a5e4";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-cp-failover-controller-amd64";
          sha256 = "f1b369583509e2d922c542e79a1e4f0c1684b170903575e639f901a8a5f6c13e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-cp-failover-controller-arm64";
          sha256 = "d63b4fafb35f83e24cdb8b7ca1f14c72d83194c13aab0e047f96575c38faa11c";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-cp-sdn-controller-amd64";
          sha256 = "87df1dd44fbfa1c039d2b0b68246f3025510e00703096e00c64880a75047ec82";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-cp-sdn-controller-arm64";
          sha256 = "64a3a156486da4897d75d3f94d5a3c94b6affc6903fe9d38932241d26ae872a7";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-updater-amd64";
          sha256 = "75112ea700ed9a02c62c98f2793118a6099a40031c7942124399255ddd5caab4";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-updater-arm64";
          sha256 = "292a8ee908c79837ab260a55f397637ab0531493b43df812827cfc34f0b5e1cd";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.643/csfx-frontend.tar.gz";
      sha256 = "d1cd63d2a15f25e175d9e20408db1646ebce5e6505450e715a1ca9661a6ba590";
    };
  };
}

{
  csfx = {
    version = "0.2.2-alpha.656";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-agent-amd64";
        sha256 = "3dfac3c9d4e2dbab0f2a18bea520dc260a2098af50ac5c043cc4f93c6eb3fd25";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-agent-arm64";
        sha256 = "20acc4a2b083785d3a8ceb329246d5c6601e1822bb8fd553393eb7030c6f5fb3";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-cp-csfx-migrate-amd64";
          sha256 = "4c8fc6c81a65380868b1e828521224f0c7c70ed28c26740b4b0d8b2fdc683904";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-cp-csfx-migrate-arm64";
          sha256 = "d1f8d9cb975d3b680552430a00870113d5c7afbcf9ca33c50bea027d6ee593de";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-cp-api-gateway-amd64";
          sha256 = "1073039056c57611e0f6d98d8487b1ea27ed23b0e59944d2ba387be062052a44";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-cp-api-gateway-arm64";
          sha256 = "c6f7b623b7d26123dc2bc941128c2d0b3d3c7a429ee5b1bd7fc21b93e52eb65e";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-cp-registry-amd64";
          sha256 = "8400fa8c91d71203e9568552bf231c6816e8f33c9a32878fe4d0bbc0462f1d62";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-cp-registry-arm64";
          sha256 = "d687190e8107edf8d355e7e601be96de08f55aad95ab8bfe73b89b91c8d8938e";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-cp-scheduler-amd64";
          sha256 = "dfc9aadd14148f81e97f9ebf8162f9409ed09fe471d9edf983307a88bf73cbb8";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-cp-scheduler-arm64";
          sha256 = "2272c4b9f9e01f10dc8ab23cf9907bbeff8e44c70624813fa54c2f1f0240be9f";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-cp-volume-manager-amd64";
          sha256 = "0bf29ac4a0c23bf07973c374a556bb4a7ba9ba4b042c45f2ff31aa3f0b9d7420";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-cp-volume-manager-arm64";
          sha256 = "c4bd493991cda3fab758cee7ba073b5d5fe6314333a10e071b91bdfc1e72a5e4";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-cp-failover-controller-amd64";
          sha256 = "f1b369583509e2d922c542e79a1e4f0c1684b170903575e639f901a8a5f6c13e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-cp-failover-controller-arm64";
          sha256 = "d63b4fafb35f83e24cdb8b7ca1f14c72d83194c13aab0e047f96575c38faa11c";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-cp-sdn-controller-amd64";
          sha256 = "87df1dd44fbfa1c039d2b0b68246f3025510e00703096e00c64880a75047ec82";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-cp-sdn-controller-arm64";
          sha256 = "64a3a156486da4897d75d3f94d5a3c94b6affc6903fe9d38932241d26ae872a7";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-updater-amd64";
          sha256 = "75112ea700ed9a02c62c98f2793118a6099a40031c7942124399255ddd5caab4";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-updater-arm64";
          sha256 = "292a8ee908c79837ab260a55f397637ab0531493b43df812827cfc34f0b5e1cd";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.656/csfx-frontend.tar.gz";
      sha256 = "ba8edaf00ee0fb9f0b0cb093398cdaf82e686c55736a1d261d4a2821c681ac49";
    };
  };
}

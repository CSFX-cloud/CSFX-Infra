{
  firecrackerGuestKernel = {
    amd64 = {
      url = "https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.9/x86_64/vmlinux-6.1.102";
      sha256 = "3b6e45c66d1b66d4fb0a1528107abbe890972f94e902bafe85fdf5108288c575";
    };
    arm64 = {
      url = "https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.9/aarch64/vmlinux-6.1.102";
      sha256 = "aee80c3ab9bc2d32f4c00de8ddf919c200359a400aae7c4710e8bc8ad438e1c4";
    };
  };
  csfx = {
    version = "0.2.2-alpha.769";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-agent-amd64";
        sha256 = "6c255a6aeaf6258e07054bd8d3a22e10f7ef4ee3de4b25d1fa206beeeb148add";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-agent-arm64";
        sha256 = "d56bc39ac4414b6ad238c4d0704df05caedb294094e929d3ca5db4d1da173627";
      };
    };
    guestInit = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-guest-init-amd64";
        sha256 = "23777fd40db520815b44ed2971fd29ac6c3eb2cccb2b64d154d9ee489f65bf45";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-guest-init-arm64";
        sha256 = "9cb5069a8337a617108d8d4f9275811efcd670b704db704e8273f027f7cdc2d6";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-csfx-migrate-amd64";
          sha256 = "87345bfc7a751687f0c625e6321e160bb65202fc91e055fc44ff4db4fcea314d";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-csfx-migrate-arm64";
          sha256 = "9a1681368aac84f8dc5f802e78f217e87e5d07da5170d223bebd28148ca67779";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-api-gateway-amd64";
          sha256 = "13570c65eea6e4babcfeb73facb73d04fe0a29d009becc54da1419f6f205ec41";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-api-gateway-arm64";
          sha256 = "c1db0559b482ff47fdda9f0d15e17f7bf4fe381590a1944be053f616a9ab5d14";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-registry-amd64";
          sha256 = "c2571579f2811f686bcfdbb2127ae2924a78885e09971808b1e163d34cf08d3b";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-registry-arm64";
          sha256 = "35315df853415c7b56655669b801b30630e90db9a2533d313384bed63861acd9";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-scheduler-amd64";
          sha256 = "cbe1577af64116f8442c462aaf6ec8eee44cab1636e27480ec84f996697c77f5";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-scheduler-arm64";
          sha256 = "1b55a339ef3d539effd1d2c3a8ffd077f6d007e4c0057f59a9419c1139d82351";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-volume-manager-amd64";
          sha256 = "b45da9af1339eed20919c6758ceccf0b54c020af8fb2045152e098a33ee23a12";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-volume-manager-arm64";
          sha256 = "1402377e5615af84ae45baf177ce959757f09a2165070c102abc0515043d1662";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-failover-controller-amd64";
          sha256 = "af9d8dee1f2fe601b3e81ea160b0cf61c76889aabd72b860230739cf72b949c0";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-failover-controller-arm64";
          sha256 = "55951dedff7b54253f79aa89be785932629f5446e753f5b793afd3032943f8c1";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-sdn-controller-amd64";
          sha256 = "eeb19526700e744378d70c8056cb86574e7d59f79d82541f38028fdb41e87717";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-sdn-controller-arm64";
          sha256 = "ba448e84a77d3b8976d649515b1810b0dd9bc663d2a2fa99847243dfd9fd126f";
        };
      };
      object-storage = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-object-storage-amd64";
          sha256 = "31ea83409d749d155ca05d6c8dc24ab1512428fdd229517ee3a94d0845902086";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-cp-object-storage-arm64";
          sha256 = "793e649159a1f15b78b2d5abde953d16ba60e38eefd8a57c298849837893732d";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-updater-amd64";
          sha256 = "9fdda52af455f15c2f6b5fa708cf2a9fb908b5d8702f1d6432c84b220cba979b";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-updater-arm64";
          sha256 = "fac9ed6aded4651c16ef4c9f4da2dd42ee9fb48ffecc8e60905808a58511a16c";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.769/csfx-frontend.tar.gz";
      sha256 = "74f4a0a9289e990894dfba43b3f2e9c8bef9b2ab5d03c721b188e17859a2eb52";
    };
  };
}

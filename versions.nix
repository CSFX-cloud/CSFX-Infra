{
  firecrackerGuestKernel = {
    amd64 = {
      url    = "https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.9/x86_64/vmlinux-6.1.102";
      sha256 = "3b6e45c66d1b66d4fb0a1528107abbe890972f94e902bafe85fdf5108288c575";
    };
    arm64 = {
      url    = "https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.9/aarch64/vmlinux-6.1.102";
      sha256 = "aee80c3ab9bc2d32f4c00de8ddf919c200359a400aae7c4710e8bc8ad438e1c4";
    };
  };
  csfx = {
    version = "0.2.2-alpha.768";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-agent-amd64";
        sha256 = "b622b1ec14a2fbb3021c422dca16a6b13841839926d9efbeca9e7363642fb7a2";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-agent-arm64";
        sha256 = "a77cda3e0e85901c2fe19bfd67318600b5821e59229ccd2bebcd96954fb9509d";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-guest-init-amd64";
        sha256 = "c434f8765fecab0878637d015d335d34103a56eda040bffba78ebeaa515b5a08";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-guest-init-arm64";
        sha256 = "9377bb4d81eabca8b255f10c76dc84f6d1cc77607d0f8073835a54af79d07f56";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-csfx-migrate-amd64";
          sha256 = "6d52f535d05ee7cd44a7abd29e802dfc89a25abd79e9d06f297a676559281a7f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-csfx-migrate-arm64";
          sha256 = "38bf8b6f8156b73b83d657e938a3b4a8d295b4741e740713db26bdf2902fbeba";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-api-gateway-amd64";
          sha256 = "958c2a639f7c8c5ed6fcd25ba4a4ec236eabf4a118f82357711e673adb972511";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-api-gateway-arm64";
          sha256 = "6184024f2ebb33a3ba6e14eee68b54d798a888d5b36f0e3cc1bc5e4e46f7bccf";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-registry-amd64";
          sha256 = "3b2287fbb6a07f1e9f1dd8f7d7840e35183ec694f316798f5f970eb3efb97eb1";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-registry-arm64";
          sha256 = "06fec4586b1a1a938bff33738ddbf80cc9467f29686d580e16d9b1762cea444d";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-scheduler-amd64";
          sha256 = "74ba800e3bcea3c856569e0f1fe014f6c0df4ea589b847272bc9f7a5659df500";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-scheduler-arm64";
          sha256 = "5ebe42d3789465db749ac6bbbcbfbcd0a53d4a4ed4bf6512f19d5efb5e23c713";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-volume-manager-amd64";
          sha256 = "42ff0dd863e2d6e99fcc3f765c24f62ce50fe56d27f2f8c850feccdaeb747d79";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-volume-manager-arm64";
          sha256 = "e18958b14b4a9f6f1e5585b70b7efbec2b6e082142220aa855c2858d9533da6e";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-failover-controller-amd64";
          sha256 = "8c2e41d07c445ea33db1dfed92c15c957e29aa27e37cb23fca58d9616e8c08f6";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-failover-controller-arm64";
          sha256 = "be4a2e1f01f9cfa6b1ec7c84380e946b9e608d7f75cd277b6aa02b3ce599b38d";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-sdn-controller-amd64";
          sha256 = "b69c5cb5e864e9e14e2610915865c89dc5b2cf2621f38cf3e07419e95acba26d";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-sdn-controller-arm64";
          sha256 = "59fe4d6d15f8749857a0319dc3e59c535badb485438484cf662d6e2157aa74b2";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-object-storage-amd64";
          sha256 = "e4606abfbd3120823a6acc789c006a854e468b0d2bc96b90932a9b243981cf81";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-cp-object-storage-arm64";
          sha256 = "c8c294cefe8696cd179c28f1089b8c132f03dc8afd627cf9bbe8053bacb31fc3";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-updater-amd64";
          sha256 = "fd30d71d10c3be8166ab6479c1238fdcbaf3c8a855d65613612b53f88155c494";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-updater-arm64";
          sha256 = "a4357dacb0c5ad516c7756b56d1c37f91fd9b1fc0dffcd27d809bf4e80dfba25";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.768/csfx-frontend.tar.gz";
      sha256 = "7241af376ec2892865dd6f960283eb0f740bfa5a479ff65c0a60820e0d30cfc2";
    };
  };
}

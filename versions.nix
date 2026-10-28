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
    version = "0.2.2-alpha.1024";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-agent-amd64";
        sha256 = "f1bee9436ce6a3b8a2a9e7b6d38edeab9018e3a4261e4c617ce14e3be768c0f7";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-agent-arm64";
        sha256 = "49006cd33d01a01605deb74a35f8a89cfe46a7bbb879e29d6e9fa31b8c183439";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-guest-init-amd64";
        sha256 = "ab457a4fd0907579e190b87684bb7b005b1080445b3b3f24c25bbfd238f0a071";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-guest-init-arm64";
        sha256 = "903c6a0d89195ff43338a5c9991eaaf70b50a72acdfe0bc7e49ff1711bdbb7b4";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-csfx-migrate-amd64";
          sha256 = "24c56f17163378626f13179f12c95655605d490c558bd46ad0a6d43b47df5485";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-csfx-migrate-arm64";
          sha256 = "d9e17008cb16ebc7fe3d71e462f5ccbd4fa33fa32d615b6c2726b20470b057f7";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-api-gateway-amd64";
          sha256 = "cbf7161b8c728a142dec6890cfbd6e7f40d3f92ada6fd2383207a7429e167586";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-api-gateway-arm64";
          sha256 = "f326ebe27d6669233942e2e39b4d542959b184b72261eeeca8e73f4923e8ab96";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-registry-amd64";
          sha256 = "54960b5c3bf1dec6bed12e92824e3169dfb1f1e8a0c1aa5c58034de24838f897";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-registry-arm64";
          sha256 = "4f9b628cb5d2026152f23ef4910f49be06591cb0b5dc15ba347060155daa974b";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-scheduler-amd64";
          sha256 = "7ea435ae9780b9959bf0f0fa59a74d4bb1d4b197021a84384a2b691da1e481b5";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-scheduler-arm64";
          sha256 = "e064d4efad4207999d5ced6d5b26f1978beb8a299ed29bc2228c7858bc86e146";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-volume-manager-amd64";
          sha256 = "18d741ff92a640fba9388a01e98e04e50273315a05c8bdb31f355a9785b578e9";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-volume-manager-arm64";
          sha256 = "4fcd9ea5bac4f2a66ae775c288a39684dc7b2010881afb5856461d35df6bb4a3";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-failover-controller-amd64";
          sha256 = "aa88ab429659ce51da142cd4bd93570cb2e0a075ab1f6010ac350b9448f777a2";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-failover-controller-arm64";
          sha256 = "81098776bf0080f278a6f76d76ae1961b137de10a9dddd8d40e862f7890adea4";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-sdn-controller-amd64";
          sha256 = "772912c54e52b452a17c3c4568e134d8f89ad2fa2db45ba8fa0765c9f52bf0f5";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-sdn-controller-arm64";
          sha256 = "a2061785de85f08a0b6760517382637228149f14a7a82eacc7eb318c4d19de70";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-object-storage-amd64";
          sha256 = "031edb7995bffd24b124ec7134a43883986265a1830e7d9f2be7f383b972e887";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-cp-object-storage-arm64";
          sha256 = "c22d6bef2f058e6c2417228599223551d867771a8b650086945ed66ab24250d7";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-updater-amd64";
          sha256 = "c00fb139c3cbb9f4abe07d2fee8419413da2a3392e7e9b0a643f9a0c4cdba76a";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-updater-arm64";
          sha256 = "c6414ddd0e6372709b784b65e4baa899e46695e5153ceb392e92d7d6bdea37c3";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1024/csfx-frontend.tar.gz";
      sha256 = "e24c91bd86a2728517ea01ef025df9e6331d1b8164c6242ad5caa6909bb9da23";
    };
  };
}

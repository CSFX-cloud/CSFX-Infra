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
    version = "0.2.2-alpha.853";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-agent-amd64";
        sha256 = "ada1cb5ec358391edf22ca618ba0c1bed5ac4483c3d7f24790fe46645892c995";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-agent-arm64";
        sha256 = "683164aaa206a6ebdf34aa103ede08d34560ff49e541f1ccf714d6565e0252ae";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-guest-init-amd64";
        sha256 = "ce761a5581349e75faa8f57d43507c8289f171b46ec284a6164db58f2db53ef0";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-guest-init-arm64";
        sha256 = "ea72b970ac25671e8772ac0fe04cfe4bccd34946906c905f810b4b6bba51e63c";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-csfx-migrate-amd64";
          sha256 = "8ff50c569cf1bbfcb0c87df48ecf8126557d948c6a50e605f56a7b7d1407e02f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-csfx-migrate-arm64";
          sha256 = "9c960eb9f5dd10487537554098207119651fe90fecdafcee8a0116bad30b4d2e";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-api-gateway-amd64";
          sha256 = "13b36e3b90239df8e51f43e1226c4301140637b8e805cb0959141b5ac79fc740";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-api-gateway-arm64";
          sha256 = "d9679ddaf221bbad424e2e11664f0166891931f9fc4532a1541ae8bf3246cc5a";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-registry-amd64";
          sha256 = "eb3c19ac215916bfa9db19819f4ccceb05f43ed190563d797d99db90835085b6";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-registry-arm64";
          sha256 = "45aefc43422e214eac67e2b1c45093fc1abe27d7ef61265af864c68f23b9a90d";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-scheduler-amd64";
          sha256 = "0d358de9f4b5536f7af5f9aa92bec5a5b45d15fce85de845a7e79f3d6a057af6";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-scheduler-arm64";
          sha256 = "bd2c36775bd50dd6bd9478b75b1d8b702402e7cc14dfb32318660a75684cc83d";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-volume-manager-amd64";
          sha256 = "faa593349f866803ded341f97b0cda91a638fa0b6f99399c3aaff6c8b5e38a5f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-volume-manager-arm64";
          sha256 = "1258f15a435da52e3db029bf112b77fc835322c4be3c879a3217cc31fa4013a9";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-failover-controller-amd64";
          sha256 = "c3fb9e4223ed8c89d2a69d07bac12173457c195c51b9fb2c8b344f76322d0843";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-failover-controller-arm64";
          sha256 = "a0340bf63a4d33e63571483ebece6f8f64b2ec7a6f9e5bbe0511687c0f6f6aee";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-sdn-controller-amd64";
          sha256 = "529741c53249219308642232f7f771389ce792b531ad7a88ff7bfc55295b6851";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-sdn-controller-arm64";
          sha256 = "b00f0213c6d8bf7d476409de0a1dfcfa38fae2e6c7b8455cbcfc01583e27ff26";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-object-storage-amd64";
          sha256 = "9fdba84920399f9f7183c40f4908f522618b8fa1ee06d8dd7c9ea4f8b7d14d91";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-cp-object-storage-arm64";
          sha256 = "ae43e3ca7579cfd0f43d2a8e68343320c8d31f6f81013d8746ab4c489a6eb6ea";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-updater-amd64";
          sha256 = "77467bd17492ec93a5c0a5c37d5be3d474be1b1ea807f97a0d5862a33c5d6356";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-updater-arm64";
          sha256 = "7a6a9ac87b21a19d836b2e3ff1555249194fac4f79174e2384f3d80b0efac30d";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.853/csfx-frontend.tar.gz";
      sha256 = "3f3a98a7376d00f45944c6827a4b5723212844a79eaae02a3c3093ca24c07fe9";
    };
  };
}

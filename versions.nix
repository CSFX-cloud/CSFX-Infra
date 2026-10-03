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
    version = "0.2.2-alpha.834";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-agent-amd64";
        sha256 = "d7ce797ec94e97fce0e6037a2b0771ea91fe327941049d6cbcb7f5997a86d0c3";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-agent-arm64";
        sha256 = "f2de03921c9dfae53bffffdd152a4073a68eabcdb7eacf5d4525f050c12804a8";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-guest-init-amd64";
        sha256 = "ce761a5581349e75faa8f57d43507c8289f171b46ec284a6164db58f2db53ef0";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-guest-init-arm64";
        sha256 = "ea72b970ac25671e8772ac0fe04cfe4bccd34946906c905f810b4b6bba51e63c";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-csfx-migrate-amd64";
          sha256 = "77ea302909d0d946e866cf85b11d94cab35abc8467dcc043fc7be42e723fe43e";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-csfx-migrate-arm64";
          sha256 = "1a57f0f6dd7bd9b4bbe949e41e149deac1bdada641b12781f47b3ee9d01f5b5c";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-api-gateway-amd64";
          sha256 = "0d8c4b4e5d5a0b509ecae34d792df6c6296c2f2c4916290d89bacff9c469d57b";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-api-gateway-arm64";
          sha256 = "b554fefbf22807d5d0774cd662d5bbef035d1d28aafb0c9d6bca969dcd6e75ef";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-registry-amd64";
          sha256 = "c5a220a92e6aa9d9cfdd9c06ca250b748c5383f26ec6a6e32889011d457693ea";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-registry-arm64";
          sha256 = "db2c5ea8b090cb7dcb2dec175e9005a051da6a1ba9ad97686d1b2bf2b009eb78";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-scheduler-amd64";
          sha256 = "3950b9d39c466cc7262fa1e65b22656be331dea70f4f8b4ff3d276587fe3982d";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-scheduler-arm64";
          sha256 = "ae1b073b3d69fc6162e23558f2282470c7d7383d32d04d1b6ec1e1cc06a269d4";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-volume-manager-amd64";
          sha256 = "0dba2b185a04b14953911986c25f5a5e41b5fe39ede45bb5655b1fa281cae1f2";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-volume-manager-arm64";
          sha256 = "31c04a29c1020e100612d02c6a186d9191e3aa04ba8a40fbdb3372a0f95059c8";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-failover-controller-amd64";
          sha256 = "d6d913bc5fb12d14b1bfb486769deafb4353913ef6f61c1c4eeca1fe488a72ba";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-failover-controller-arm64";
          sha256 = "9ef311a918ef31845659b8f15a3c1f56e1e6bb0bc33bd8b98ae2c92835d34848";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-sdn-controller-amd64";
          sha256 = "fe56ef58e97c9ea6c1b3884fcaaab39bc55dec99161a3b40040dc91a852b751c";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-sdn-controller-arm64";
          sha256 = "157a282a4a7ccef6a647ff96c212abf9c0701f4e03325eecfe87d0f1ebddeb6c";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-object-storage-amd64";
          sha256 = "3220bcab2e15d8244f790bc527d9b4202493da2aac5a36f3cc13560530d871f4";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-cp-object-storage-arm64";
          sha256 = "bd1f8a6d84288d0e84500e42d1d73b9ff01254135d15c88a3a294610cc4043c8";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-updater-amd64";
          sha256 = "1e07556161148236d391fd4fb6044fc3afbb22ddbe3c1b4864e308220654abaa";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-updater-arm64";
          sha256 = "65d30aed4d0f8dabfe01e5e2c485d41df85331f215486bc5d81944447b6de368";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.834/csfx-frontend.tar.gz";
      sha256 = "60da63838583da794f63ac959d6724780847d1089decddb3ff4c30686f19f249";
    };
  };
}

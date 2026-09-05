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
    version = "0.2.2-alpha.772";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-agent-amd64";
        sha256 = "ef7eb4510b3c9d1b78e15e725f466f8c6786f2300fb3bbfe343f2f3958701b5d";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-agent-arm64";
        sha256 = "e3f0e5ac0278514259553331e57e63ccddd17b2fecd18bb545635d20f78eb452";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-guest-init-amd64";
        sha256 = "f76eb81c6a71f7b8531e3bcd59a4c0c81803353c4823f4fad31568555f6bf593";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-guest-init-arm64";
        sha256 = "c79e0f8c8a6cef1aaeb63fadc352acbc9066e66447e61b7ab71c9e7051fb4765";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-csfx-migrate-amd64";
          sha256 = "62a6d6969bb4a8bb248865e0849c5693c38346b5bd43017f741a973b0fc7517b";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-csfx-migrate-arm64";
          sha256 = "dd8fafe1f957e20ca2a3de57d6989da59635f90d31c1d97bb8f5b12d5ebd3344";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-api-gateway-amd64";
          sha256 = "2614732ce4715ae149b58a8a6c7c4789ffd7f5af8ec77ad6fb73e22e2abf009b";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-api-gateway-arm64";
          sha256 = "04d6f3d591830c7dde066ab71e47a7a0af45f1cc789ce05a25b8028bd926dd76";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-registry-amd64";
          sha256 = "b67d8378e7dd98a8237c68bf7e006e41366e1aca3108ad662fed92e8df2d9ad0";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-registry-arm64";
          sha256 = "e9e50df18ff311918534f22845ae7e241a57a590b702bc7516cbfde7ae01d45e";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-scheduler-amd64";
          sha256 = "442b70d7a77e0d7da47d3e2f35ad9af22880606db294932998e8a3d4d280e649";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-scheduler-arm64";
          sha256 = "581a109700fc931a9a44a61a60fcd4dd2843c631f2a671bf0256898836c57abf";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-volume-manager-amd64";
          sha256 = "c8ccb115b95daf4071f522e5d7745e1ee5782b00b675ff29b897a8fcd3517afc";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-volume-manager-arm64";
          sha256 = "8aa274df676ead098407d5a308db2cabf915094d781e883fdd57668a7ac22021";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-failover-controller-amd64";
          sha256 = "473bea7527981029dccaf3ca0a3c64100ef607fd1637a7ea42ff3129bdc925e1";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-failover-controller-arm64";
          sha256 = "e41bc92c3ede0240ad358b7ef7358f4ff94bba00327dd086193ef87efb0fbc48";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-sdn-controller-amd64";
          sha256 = "92b26bb2f52881e68d39bb9bc59b7f25626a61a9db5467e03bf5a1c18f4a0c8c";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-sdn-controller-arm64";
          sha256 = "fe4848043ceb73b42ae75d11153856ec18349e5a0df07068f5319fc7df3d540f";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-object-storage-amd64";
          sha256 = "79883e3cdac8484debb19752b9f6d9b3e2646eb7033749319ec3f51f1d9bfbba";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-cp-object-storage-arm64";
          sha256 = "e4ee4b93a6578dbc8dc01c9b0d6e35b2f9fd191c4a730167ea635f03373b52e7";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-updater-amd64";
          sha256 = "e5ea2608cfab993610d55ea64da650aeeba9c65e00c1a3c41f55e1bed14be3f5";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-updater-arm64";
          sha256 = "73e82938582f8debc245f78d993ec21cd4d1a78a392814dcf617cc9f8cd5543c";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.772/csfx-frontend.tar.gz";
      sha256 = "4c0f5362ab9b732301eb9db1e215a4762d68d21a07f17fdc4d553963836ad180";
    };
  };
}

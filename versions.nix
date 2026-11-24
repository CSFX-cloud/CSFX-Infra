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
  firecracker = {
    amd64 = {
      url = "https://github.com/firecracker-microvm/firecracker/releases/download/v1.13.2/firecracker-v1.13.2-x86_64.tgz";
      hash = "sha256-pts7RR9QDf2CmJRH/r9Utci7iSnk7nx/hKlpXxMNpUc=";
    };
    arm64 = {
      url = "https://github.com/firecracker-microvm/firecracker/releases/download/v1.13.2/firecracker-v1.13.2-aarch64.tgz";
      hash = "sha256-pkwLkTspuOpLWZDsuUqSy3y064UAFbaaoWgNJdnLQb8=";
    };
  };
  csfx = {
    version = "0.2.2-alpha.1060";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-agent-amd64";
        sha256 = "14df074f249bc8b9e2a58b541db27f306f5498eb51300c227194a6d17cc051ec";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-agent-arm64";
        sha256 = "1c156e85b91cbcc9c6efffe679d0fcd08ee9a1cc968a3977919030935e4a46c3";
      };
    };
    guestInit = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-guest-init-amd64";
        sha256 = "d21a5ce418172639ee02dc0e670ce1aa5af717e1a4f5eea78627403d40423db9";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-guest-init-arm64";
        sha256 = "47e2f8c998a3895dcf315af795cdbe494075b4f6449bd2a15df6c91d2708facd";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-csfx-migrate-amd64";
          sha256 = "582b708c3f150de2ef93b8cb5668ca502b60a5caa89c4733f07931c065bcc601";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-csfx-migrate-arm64";
          sha256 = "80c1cc47a6eb49aabce10d3280645e5ab0d8b1f0b90086d1dd6520e7ead9e027";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-api-gateway-amd64";
          sha256 = "8626650c57499ffa0b706336593fa0e61a51d8981de0fdb49bc69e0219269388";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-api-gateway-arm64";
          sha256 = "8b196d6d73770cb50d6aff65204813c5d37308fc58e2c65f6c5a2870dd9c529b";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-registry-amd64";
          sha256 = "47ed3a03f45eac4b015f85b138e956c5dad127cdd995904e7c8e5a86e175a74e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-registry-arm64";
          sha256 = "f813601e8f1af5333144f72ed7a398730ba35c50bd76a55eec896f74b4763060";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-scheduler-amd64";
          sha256 = "a6939d660862eec1cd9d785148c542a1d270467be392c4215a212bf8b7d2afad";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-scheduler-arm64";
          sha256 = "5cb9da2ab128da2b81c477e47849c473a896f15623d1a0220d8460be8d011dce";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-volume-manager-amd64";
          sha256 = "b986e4e7b415a6a92ac73e95cf39fa240ef27f10a5d741e629f43c0d6ebb6a20";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-volume-manager-arm64";
          sha256 = "76a9e31098e04659058daa95e38804e67e15c21388a5bfb8c2c1869cbda1cd09";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-failover-controller-amd64";
          sha256 = "6e4ed3801de9298b079d1f4ba0e112c2d07ab546f0641ffab9e303ca0ea908e9";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-failover-controller-arm64";
          sha256 = "9c6b407206f8f3304096d9f10c2363490629c259c91a040745c4c9b32656bdfb";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-sdn-controller-amd64";
          sha256 = "8fa6f357097c80942108d36d7b2073365b9d1ebdc18d10640023aa0c72364944";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-sdn-controller-arm64";
          sha256 = "be2a2e1297e8a9521c1bd74de510e6f1bc80bcf88df46b2a81dcd6ef381566c2";
        };
      };
      object-storage = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-object-storage-amd64";
          sha256 = "ceb93aa40fe12030a90e43ca03836b827a13a2312530ff24827d157193f58782";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-object-storage-arm64";
          sha256 = "968e6a2870ee31caf6758cfcc7ba995dd634a6314bd58d07b806854793f4327d";
        };
      };
      site-builder = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-site-builder-amd64";
          sha256 = "f30ac56a8bcaef605e25879becf2284ec0b64c96c2f62271c30eb52999534be2";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-cp-site-builder-arm64";
          sha256 = "328b4047f1279a94e8cbf416c3cfdd8f4e7b371d890172e3486b3be18b4aec91";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-updater-amd64";
          sha256 = "ab167c3cc7349d86d107e2e61a60cdbce9f3a144fa702815c58db5e96ca1b170";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-updater-arm64";
          sha256 = "018d124a1b29d4cdd1298c97e7f8875d10647c443b9093865470d92f34f2729c";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1060/csfx-frontend.tar.gz";
      sha256 = "8fd446db21fecc4ef8ac38b292a14428280a884bbb2750931c2dfb54affccfba";
    };
  };
}

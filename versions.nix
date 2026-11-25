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
    version = "0.2.2-alpha.1070";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-agent-amd64";
        sha256 = "63b76dd0b3ff660a3921bda008cbe20eb31721154f527a03b4ad8a38f458cd3d";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-agent-arm64";
        sha256 = "eed9ca74f0b45633003de588dbeea1da828d7b67ca79d2f0bedb93068ff9833b";
      };
    };
    guestInit = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-guest-init-amd64";
        sha256 = "d21a5ce418172639ee02dc0e670ce1aa5af717e1a4f5eea78627403d40423db9";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-guest-init-arm64";
        sha256 = "47e2f8c998a3895dcf315af795cdbe494075b4f6449bd2a15df6c91d2708facd";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-csfx-migrate-amd64";
          sha256 = "582b708c3f150de2ef93b8cb5668ca502b60a5caa89c4733f07931c065bcc601";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-csfx-migrate-arm64";
          sha256 = "80c1cc47a6eb49aabce10d3280645e5ab0d8b1f0b90086d1dd6520e7ead9e027";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-api-gateway-amd64";
          sha256 = "00293b9a03b64085feff1fc9ae868a8c9f6e18ede7ee4322e025b8719ca4ccea";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-api-gateway-arm64";
          sha256 = "51d1252b67aa329b3ad38bd1b6fe99f7997ac72f629d993caad5a059ccd30869";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-registry-amd64";
          sha256 = "cd17dc23cedb6ddf3c5e2821cea86f7d60324b37f2186fff965fafea692fff07";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-registry-arm64";
          sha256 = "c5fa4ae909672023f39fef6ac7a880d91b2391214d750d0b92830c10394cc212";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-scheduler-amd64";
          sha256 = "4668917d65741ea346443d3eb96c0b85285e855707b0d3d1e69345394d38b1e9";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-scheduler-arm64";
          sha256 = "b9fb99236a3e12163ebfac435e94abfaf022c49d87d112262a51d0f24bc37761";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-volume-manager-amd64";
          sha256 = "6c95da1f51467a258ef3e59c3397a1b62f4742d001fd78782786c773bb6e06e6";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-volume-manager-arm64";
          sha256 = "35c16ba2a7b615e1605fe7a508de627ea2e1e8e4f96f357e673df813dc92964b";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-failover-controller-amd64";
          sha256 = "f58d82859ca06b32c2065f9c79de414bd930018d0d3eea440a2c0565742cc9d5";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-failover-controller-arm64";
          sha256 = "cf400c8966e4b7546565622d5ed392072cc2cad96ea37439aa78fc3b3b1f2397";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-sdn-controller-amd64";
          sha256 = "39ab1c213d8c3a28074024b592e520edc2673a6662df9523a3192468d45e303e";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-sdn-controller-arm64";
          sha256 = "30c37c1e52705d1165e94b45faa109d4a6cec709e3ba448be692a86a9100bbaf";
        };
      };
      object-storage = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-object-storage-amd64";
          sha256 = "c8d696b42800a13ccf13a13151d288e73de12eff5d4a5503ca8fb89020902454";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-object-storage-arm64";
          sha256 = "1b06de2772cc25540e7f91c7ea752406f9a75ba39bc255126bf6d636b88d62a9";
        };
      };
      site-builder = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-site-builder-amd64";
          sha256 = "4afe221c9932911c475b910f13c42508f043c9fd22bc1c4efddc7b04118b4e20";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-cp-site-builder-arm64";
          sha256 = "754e5c32b68c4b6fb8fe25470dc12855c81b5fe6acc27524a1f99680a06553b0";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-updater-amd64";
          sha256 = "ab167c3cc7349d86d107e2e61a60cdbce9f3a144fa702815c58db5e96ca1b170";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-updater-arm64";
          sha256 = "018d124a1b29d4cdd1298c97e7f8875d10647c443b9093865470d92f34f2729c";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1070/csfx-frontend.tar.gz";
      sha256 = "115cd0574e085c2949579bc9025de56265a7476bc388970ca6a753bd1ce8fcb7";
    };
  };
}

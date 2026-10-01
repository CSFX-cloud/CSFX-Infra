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
    version = "0.2.2-alpha.818";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-agent-amd64";
        sha256 = "95047bff8181865dcb38fe5d120e9f6c1c2aeb28f6757797c4caf59306cf0d2b";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-agent-arm64";
        sha256 = "9ba2f69ba5ca4a212790f460a4a96bd051300e5c1f5fcb3ab82e2066d412b054";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-guest-init-amd64";
        sha256 = "e361e3871132d2e65aaec91b614f435da45e3e65a62351afcdd1229e66b9d4ce";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-guest-init-arm64";
        sha256 = "bc296cc4aa0b978cacb5858e49c7b9c76a3e02a106b1a41ca44ffea3e92c9615";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-csfx-migrate-amd64";
          sha256 = "7064eb20f64bdc4f1c7e11f4f0e1cd14887d0e4f4148fbf08bba11c0fa6119eb";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-csfx-migrate-arm64";
          sha256 = "feb54986d04bd013efd8f290a2c9f4e270b9abe54d11890226b7adb1ed057337";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-api-gateway-amd64";
          sha256 = "86c6733e7e334f67ee111b9191f42031b051b0cf2f5e702a50ad9a8b6122dda4";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-api-gateway-arm64";
          sha256 = "24e0df4ff77dec3201dc611f75d73752d53373706f34275634931d84f7e6b20f";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-registry-amd64";
          sha256 = "2c82bd4238c173a319502cecb80e4606d8c817c5a67e69c27ada6e5901f5a50c";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-registry-arm64";
          sha256 = "f9b50d3fa88cd1a55bddc3ecb91d2614581188fff1e4774026844ea1aa184929";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-scheduler-amd64";
          sha256 = "791086b171cfa15c81a1131122dee2e1fb57d3b44f7e6865bdc00ecd979ad253";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-scheduler-arm64";
          sha256 = "ad424772d5bc2398cc00c6add7c942012ce6c721539276b3d64c73272dc547a7";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-volume-manager-amd64";
          sha256 = "8a03b253ca7e5a1afb161ea0ea6683b083314d005291f2768bc992a60ad71604";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-volume-manager-arm64";
          sha256 = "6d53a62a6dda68e7a4df9f7d8fd3c35f8cfa05b95f14a4f7febddfd5ee9b5f1c";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-failover-controller-amd64";
          sha256 = "68b8536880b765b5a4b5b08364d0f9db8e8207b6b4594b30897075b3906aba50";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-failover-controller-arm64";
          sha256 = "c949c294d105a1141dd1b5626a1000161a31e202a87bd8deab79ca6b0f29e0b5";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-sdn-controller-amd64";
          sha256 = "775ba61292c6e70ac05da8db04bf9752050989221c103e1f7dc8c638b6bf1e5a";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-sdn-controller-arm64";
          sha256 = "a475e5672492df19c616baaef6aac9b5e1b246b7ac13c0fc31ccf36b5c14d164";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-object-storage-amd64";
          sha256 = "61582c72ddf26d610c3018e29198f6ce4a4f083cbb12bc653c1914990d99f35b";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-cp-object-storage-arm64";
          sha256 = "3d0389c2f07816b3af0f455035b00a81b7a6669fd22da51ea4e2b69bf7a291ed";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-updater-amd64";
          sha256 = "9926614ddf36354c28a7bfa42ddcba768611ed2eee61adcafdbe636cf0d6451f";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-updater-arm64";
          sha256 = "7206731ff377acbb9fb43e11b4f7e90c5ef1fe2a35ff7af6c161caceec79b900";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.818/csfx-frontend.tar.gz";
      sha256 = "26126e6866b6a35a237543b6fa3670c4407973a872575184ef5cfa45bd54e29b";
    };
  };
}

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
    version = "0.2.2-alpha.984";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-agent-amd64";
        sha256 = "8511f2b08abe9183a5c3c93647d44dbbd1b8caace2ef73bb334537cc9c7ba9fc";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-agent-arm64";
        sha256 = "11f543985fd71519bdaf0056f6cf02ffcf4818475f83aca682c18cbecefcb910";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-guest-init-amd64";
        sha256 = "050f64b75033aca0c055405f31e3d8191e3250a74f8e91db511989e163378585";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-guest-init-arm64";
        sha256 = "f97d7ebe55ebc85a452d403795167153fb45262087bf3f3122d89bfa0388be19";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-csfx-migrate-amd64";
          sha256 = "24c56f17163378626f13179f12c95655605d490c558bd46ad0a6d43b47df5485";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-csfx-migrate-arm64";
          sha256 = "d9e17008cb16ebc7fe3d71e462f5ccbd4fa33fa32d615b6c2726b20470b057f7";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-api-gateway-amd64";
          sha256 = "a7803949cd706395e71327f98487e6da6a80f00bb7f8c321425fbc47e87794b6";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-api-gateway-arm64";
          sha256 = "3c1cbe745f1957acb2928bd7ca3df12c378d6762bd3defb428e38457ba6f3411";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-registry-amd64";
          sha256 = "8f56591e1734534896b61b85633d60cb38e5d1a7b302122268db9ce19b0983da";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-registry-arm64";
          sha256 = "525397f40b13bffefdec56fb73808861e4fde2e0ef757e1c7527b2387b5790ca";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-scheduler-amd64";
          sha256 = "7ea435ae9780b9959bf0f0fa59a74d4bb1d4b197021a84384a2b691da1e481b5";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-scheduler-arm64";
          sha256 = "e064d4efad4207999d5ced6d5b26f1978beb8a299ed29bc2228c7858bc86e146";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-volume-manager-amd64";
          sha256 = "18d741ff92a640fba9388a01e98e04e50273315a05c8bdb31f355a9785b578e9";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-volume-manager-arm64";
          sha256 = "4fcd9ea5bac4f2a66ae775c288a39684dc7b2010881afb5856461d35df6bb4a3";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-failover-controller-amd64";
          sha256 = "aa88ab429659ce51da142cd4bd93570cb2e0a075ab1f6010ac350b9448f777a2";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-failover-controller-arm64";
          sha256 = "81098776bf0080f278a6f76d76ae1961b137de10a9dddd8d40e862f7890adea4";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-sdn-controller-amd64";
          sha256 = "772912c54e52b452a17c3c4568e134d8f89ad2fa2db45ba8fa0765c9f52bf0f5";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-sdn-controller-arm64";
          sha256 = "a2061785de85f08a0b6760517382637228149f14a7a82eacc7eb318c4d19de70";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-object-storage-amd64";
          sha256 = "204a97fe37501a8af425aead9695e49aa490f094c0a83df872ac6b55b3547f91";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-cp-object-storage-arm64";
          sha256 = "bb4297870d7a500299fa8231473506738b4d1933af273ed3cd3a8a51de9b3bec";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-updater-amd64";
          sha256 = "c00fb139c3cbb9f4abe07d2fee8419413da2a3392e7e9b0a643f9a0c4cdba76a";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-updater-arm64";
          sha256 = "c6414ddd0e6372709b784b65e4baa899e46695e5153ceb392e92d7d6bdea37c3";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.984/csfx-frontend.tar.gz";
      sha256 = "60ecf1932ce4cbb2db905849e449fecce56347dd7bf08ff1a99b00380edca9e8";
    };
  };
}

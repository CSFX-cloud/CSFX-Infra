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
    version = "0.2.2-alpha.1031";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-agent-amd64";
        sha256 = "5dcdc72b7067e2459f68bc85e332b0a7b09679c575f8d2fc7d9aad2ef2581dc0";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-agent-arm64";
        sha256 = "baa8d12a4765146f4899ed7a2a4860debc4df8e56eeda909374057095274e417";
      };
    };
    guestInit = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-guest-init-amd64";
        sha256 = "ab457a4fd0907579e190b87684bb7b005b1080445b3b3f24c25bbfd238f0a071";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-guest-init-arm64";
        sha256 = "903c6a0d89195ff43338a5c9991eaaf70b50a72acdfe0bc7e49ff1711bdbb7b4";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-csfx-migrate-amd64";
          sha256 = "24c56f17163378626f13179f12c95655605d490c558bd46ad0a6d43b47df5485";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-csfx-migrate-arm64";
          sha256 = "d9e17008cb16ebc7fe3d71e462f5ccbd4fa33fa32d615b6c2726b20470b057f7";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-api-gateway-amd64";
          sha256 = "92aff6ad519ce2849b4d3aadc172b25b9de3712a18fb694e8fdbd2f2633c6f9a";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-api-gateway-arm64";
          sha256 = "bde479acb665d67f3dab27881eba91fc4ce84787c02808d89370f3b2a5ab96eb";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-registry-amd64";
          sha256 = "ddaccadf9c327182c7b68a604eb27c218201b19fc518c1828d3334ec2f361543";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-registry-arm64";
          sha256 = "c6d42b29f157853761edf52efb611e4e67bb096706887268d3fc9154076dff95";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-scheduler-amd64";
          sha256 = "7ea435ae9780b9959bf0f0fa59a74d4bb1d4b197021a84384a2b691da1e481b5";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-scheduler-arm64";
          sha256 = "e064d4efad4207999d5ced6d5b26f1978beb8a299ed29bc2228c7858bc86e146";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-volume-manager-amd64";
          sha256 = "18d741ff92a640fba9388a01e98e04e50273315a05c8bdb31f355a9785b578e9";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-volume-manager-arm64";
          sha256 = "4fcd9ea5bac4f2a66ae775c288a39684dc7b2010881afb5856461d35df6bb4a3";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-failover-controller-amd64";
          sha256 = "4c7ac973a6e4a497ed19f38250e1fd5801d3501e023ab43d38aa92ba875a0e6d";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-failover-controller-arm64";
          sha256 = "19f576a28ed9fdf5c21a4890f44d19ead6c914c853ff3fad6ebd26f03c7a2917";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-sdn-controller-amd64";
          sha256 = "772912c54e52b452a17c3c4568e134d8f89ad2fa2db45ba8fa0765c9f52bf0f5";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-sdn-controller-arm64";
          sha256 = "a2061785de85f08a0b6760517382637228149f14a7a82eacc7eb318c4d19de70";
        };
      };
      object-storage = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-object-storage-amd64";
          sha256 = "031edb7995bffd24b124ec7134a43883986265a1830e7d9f2be7f383b972e887";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-cp-object-storage-arm64";
          sha256 = "c22d6bef2f058e6c2417228599223551d867771a8b650086945ed66ab24250d7";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-updater-amd64";
          sha256 = "c00fb139c3cbb9f4abe07d2fee8419413da2a3392e7e9b0a643f9a0c4cdba76a";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-updater-arm64";
          sha256 = "c6414ddd0e6372709b784b65e4baa899e46695e5153ceb392e92d7d6bdea37c3";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1031/csfx-frontend.tar.gz";
      sha256 = "6fc6456183cf8f171299d923269d2e4b3768cd079dd1c7a20f538f59874fd387";
    };
  };
}

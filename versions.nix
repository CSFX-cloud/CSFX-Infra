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
    version = "0.2.2-alpha.943";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-agent-amd64";
        sha256 = "3fd218d8eb968d5a87f7a44ae3d30ea86fc464d33ca4b57bb10a1f45f34bb898";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-agent-arm64";
        sha256 = "87df203377e5eaf670381180d7add548e1a643bbdb31bb7cf677836401613925";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-guest-init-amd64";
        sha256 = "b8714e4c746abddcc136618edfbc81a1c5781cb74d1396482af1e054de59466e";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-guest-init-arm64";
        sha256 = "511982a6d033f5c026bf7bac77ef40cfb7cfc371ef5328a8ce86a52f2d800695";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-csfx-migrate-amd64";
          sha256 = "ffffbcb514fd4c251f3504de6ab85a00637d4d8b69d4a99975e878c4fa68c0a4";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-csfx-migrate-arm64";
          sha256 = "0a1023f1c65a1922f9e077eb9ff691172f8628f1b392a256c817d271a2792163";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-api-gateway-amd64";
          sha256 = "2add84fadbf9da4b1c7e9e8d9b804c52adfe8c1f53b5d305c84bb11a16dca84b";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-api-gateway-arm64";
          sha256 = "9b05f48eac4aa4774a7571483d21528973c3686153e17a47163e047f9591f01e";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-registry-amd64";
          sha256 = "90b9bc57447bf76c59b7245d9ab12b46a1b1479bfd830847b2660b8816c1a3f9";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-registry-arm64";
          sha256 = "4f47770b4528a7ea97faae1d055de9e1a4bf8d498559d6042d044dd10f9c1e24";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-scheduler-amd64";
          sha256 = "30ed52311f7f6ed233e860cf06a6e52baa5faa3521fa785634438ad5e99cf03c";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-scheduler-arm64";
          sha256 = "2f0cbe32c0e715e1fedd087f5cba7da20e137393cd0094352647930e18961ec3";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-volume-manager-amd64";
          sha256 = "5e588f4b5f1d9687506974f3c9e2204d0d1231877fa47482ce1b3bbc36a076f2";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-volume-manager-arm64";
          sha256 = "2f7c4e2610ddc750134bd1abf572275e7f2d236e065dc494d5a297681051a000";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-failover-controller-amd64";
          sha256 = "9f7e2fd95e3b00c73ab478b6af0b4e2f729139fe1a041cdc127eedc5e65f2bf0";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-failover-controller-arm64";
          sha256 = "014bab88310ba542dd3e2cd3e8017deae9ff3c09f69d44e8ded3c47db4fd33e6";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-sdn-controller-amd64";
          sha256 = "d9b427736bdf1738b85dc547dbb51f987c7a77ec8b34564a2f41e93190a41c14";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-sdn-controller-arm64";
          sha256 = "456f08908ce661ee832e47e08e70b936f2edf0092fbee44eda903b89e22828c1";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-object-storage-amd64";
          sha256 = "e2548fd83143d69186129a87e1cb7a4f5cbd7acc94da39046635a399c8f1aeff";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-cp-object-storage-arm64";
          sha256 = "f8773a6b9c4e87595ec1945f5d5081497f0e4600b463ce23d8e2287a285721f3";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-updater-amd64";
          sha256 = "d24f9872413c2ac88a939408df85b68efeb898c2e555235340db91ba856b7dec";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-updater-arm64";
          sha256 = "0b7660142fb8f167419c409ea4712d28ffef6fe85c9adc06c2d3db1e1160387d";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.943/csfx-frontend.tar.gz";
      sha256 = "9bb3a6cf217889f6e7bcfef7bee64664953fe1b01d1ecb6e8d572c14185105b9";
    };
  };
}

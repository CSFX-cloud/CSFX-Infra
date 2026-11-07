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
    version = "0.2.2-alpha.1038";
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-agent-amd64";
        sha256 = "f11c16993002f5803982f0bf355d6dfbca137ed6889077dbf87e06788a411f09";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-agent-arm64";
        sha256 = "4a2c40d3a39230f02a6c05db0a18279d81b49be845fcfb4458407556e154d81b";
      };
    };
    guestInit = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-guest-init-amd64";
        sha256 = "af3dd59507d48ca8382d78a6242c94f352ae9258eb581b24723d4e78a6906a05";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-guest-init-arm64";
        sha256 = "c8ea413cfbd73a4c14a0b391bb9b451bb131c029f0769de5713d4e92481dcf95";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-csfx-migrate-amd64";
          sha256 = "2cc30c63184ef32d934a110769269a0e04d52073a259fc6df05bd934bfc10e50";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-csfx-migrate-arm64";
          sha256 = "6b0dc28cd978fbac86c853e5bcab5e292485371a02fc91bc0acb3bac74ff62be";
        };
      };
      api-gateway = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-api-gateway-amd64";
          sha256 = "f26062d1c759e1833c1993a1e84ed8cc1e7cc7e7dc3a83959b33c99b4cc6744d";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-api-gateway-arm64";
          sha256 = "b1ecf86e5a40c95872557ac3bb88cd4b6b969cfd5297334ae2e7845126248942";
        };
      };
      registry = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-registry-amd64";
          sha256 = "0cf2e28afeba59c7b178d6aba66906ee8855e4835b97b7c84c775512470891c8";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-registry-arm64";
          sha256 = "998f725cd41dd26f046c0baaa038937084b123eb50fe529ab176bb4e370d869a";
        };
      };
      scheduler = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-scheduler-amd64";
          sha256 = "d35d2c3fec0ff54e7b60e24a0ca6705f2a7b19c15a533e0c324667d626ec7216";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-scheduler-arm64";
          sha256 = "22e95ac7dc6037a2a22c04526e9de7e39226bd9460d60a61c394591fba696247";
        };
      };
      volume-manager = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-volume-manager-amd64";
          sha256 = "4425309700ffddbf9fe561eced73a4acd9b408f81e64c57a1eb49301256aca84";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-volume-manager-arm64";
          sha256 = "f892dd45b9be2e8337dc57060b3c8954a24f98e5a1d1938306c3d49c6ebb8d65";
        };
      };
      failover-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-failover-controller-amd64";
          sha256 = "d803b4ea716863bfc4b6d3989a2b0c4a468f1412c5e997bb8a97404ac655fda2";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-failover-controller-arm64";
          sha256 = "1e8db8946442bc3f4db7a863d1edecbc5cdb6a7ac1281ab4b914da6b72ca8432";
        };
      };
      sdn-controller = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-sdn-controller-amd64";
          sha256 = "0c459eedf60253e77f93fc4e29f7c53d4967661d39799bcd203f9025aff2b74e";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-sdn-controller-arm64";
          sha256 = "12bba0da2b26213c106d1db2477128bf1c7fdd5d305528022c8d4388bd2878fe";
        };
      };
      object-storage = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-object-storage-amd64";
          sha256 = "328ff5f8aa50beb80716b5ec5fa7c6dcbf9c89f3623fce364664df282a350dae";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-object-storage-arm64";
          sha256 = "eea96c53f45b39f4736beb917a54b02fc3534762ac82fb54e8597c1b174e063b";
        };
      };
      site-builder = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-site-builder-amd64";
          sha256 = "2ca88efc83f0ecbd08c9ef7951682c904288dffd0363a2a37e8558b7ca8cfe6c";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-cp-site-builder-arm64";
          sha256 = "6cea3ead2457c02c1989422fd99e1b5f55bd65ddf6f87499bfb207e0b6deb06a";
        };
      };
      csfx-updater = {
        amd64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-updater-amd64";
          sha256 = "74a88a2d69759ad9162a47a6330e8f9ad4cc262d0486df8ead97a6d2c1262c19";
        };
        arm64 = {
          url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-updater-arm64";
          sha256 = "30dd7ee01607ad72eada16257175099739f88cfb2d638dcdc9e5ea5aa3329b01";
        };
      };
    };
    frontend = {
      url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.1038/csfx-frontend.tar.gz";
      sha256 = "15393a39e723e3ac7cdb32826726a609d18e2da9b0adf5e2af0e1dac657455d8";
    };
  };
}

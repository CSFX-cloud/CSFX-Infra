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
    version = "0.2.2-alpha.860";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-agent-amd64";
        sha256 = "35d0efc663dbd84577bf5d77ead904acbd892a1a419bd3e90c0eece6e44bb95d";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-agent-arm64";
        sha256 = "84071c056f472f1d39a3ffb0528d6c44b78a7c8129d0b40a699aa8bd06987d11";
      };
    };
    guestInit = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-guest-init-amd64";
        sha256 = "ce761a5581349e75faa8f57d43507c8289f171b46ec284a6164db58f2db53ef0";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-guest-init-arm64";
        sha256 = "ea72b970ac25671e8772ac0fe04cfe4bccd34946906c905f810b4b6bba51e63c";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-csfx-migrate-amd64";
          sha256 = "8ff50c569cf1bbfcb0c87df48ecf8126557d948c6a50e605f56a7b7d1407e02f";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-csfx-migrate-arm64";
          sha256 = "9c960eb9f5dd10487537554098207119651fe90fecdafcee8a0116bad30b4d2e";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-api-gateway-amd64";
          sha256 = "c319147d69513a057363dc097328e3c99cbf8d94c9c2092baeeebdf9bb5dc1ff";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-api-gateway-arm64";
          sha256 = "9b0ae18901d18f52aca22bfa8050b27d443a5a94be36ee0f9ad77bb27762b2ae";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-registry-amd64";
          sha256 = "769a67583ef6595066d2224d6145c3b36ba297c980d5732d764bf2dc705ac712";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-registry-arm64";
          sha256 = "9c33a00f71de8a7c0006d7768fc33dc641d1c3d96b3409ae6893693ea8cc78db";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-scheduler-amd64";
          sha256 = "834a9fc44907c8df6fc76381e6b85999cbd92f4db9b8d15ec95a34091024e57a";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-scheduler-arm64";
          sha256 = "dbeea11cbb60f7a178f20169a3ab2cf059bbb91d3d6980d26e9d912318782427";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-volume-manager-amd64";
          sha256 = "7a79522a467b98ba47b39842a5a6f98b2283ebc5a16a1be23d3a87d92fd7d5c0";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-volume-manager-arm64";
          sha256 = "cd515d4be3bc6f8eb7a6865f827cfaeff39d8bd445ac1ab441c4078d6bb9df88";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-failover-controller-amd64";
          sha256 = "82f732582bb65a7b65994673630c045ea8765e7c6ef418bad4cb0d0f8f862479";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-failover-controller-arm64";
          sha256 = "cce33cebb3c669331a2a9c4c64d943c9ca3bedc0e4c25168d9be95fa0c030bb9";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-sdn-controller-amd64";
          sha256 = "2267809bede194074d7f65c67ba97b589128c756484224d508575ee0f72347b4";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-sdn-controller-arm64";
          sha256 = "84c153600b0f3ba88be8ceebdf5010d4c9433ed1628c8d078617f6b336ab4072";
        };
      };
      object-storage = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-object-storage-amd64";
          sha256 = "9542743422b62342f094c08fc30136052531ea4b4bf6fe5280d14ce9215f5bb2";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-cp-object-storage-arm64";
          sha256 = "11f30715b70b991c72e1d3543e9cd1e1cffdfb8b2bc75f3f4e8e8b52f23e4aef";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-updater-amd64";
          sha256 = "77467bd17492ec93a5c0a5c37d5be3d474be1b1ea807f97a0d5862a33c5d6356";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-updater-arm64";
          sha256 = "7a6a9ac87b21a19d836b2e3ff1555249194fac4f79174e2384f3d80b0efac30d";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.860/csfx-frontend.tar.gz";
      sha256 = "f8f29ef10a1e40f2138f79c561bbccced461d48c06044851964fb7b79a552322";
    };
  };
}

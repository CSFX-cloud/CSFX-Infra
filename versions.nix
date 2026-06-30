{
  csfx = {
    version = "0.2.2-alpha.579";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-agent-amd64";
        sha256 = "4385210640cdeb4377b7f7eab2f3c077610813d0295f8d29b61acc619f44a084";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-agent-arm64";
        sha256 = "c7acd5057f2000784ad71518bd3c0153a6ac67b44d23a256abfb1728a0a98e38";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-cp-csfx-migrate-amd64";
          sha256 = "53df647f8bba85650b75b4a0bd6f0fa2c5c57a0c4f3ac91a17e3d0694b6bbb52";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-cp-csfx-migrate-arm64";
          sha256 = "db72a3e181672119bd2a040b225a24727654a46493dc7915146d0c6d608da455";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-cp-api-gateway-amd64";
          sha256 = "d31e7c4c200f9110766fd6619e36869651fd0529a6a8fe5c0d66d37207bcbf2b";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-cp-api-gateway-arm64";
          sha256 = "4a7bd8995253bdbb3709aa43ae1ccad92dab700714bb53d1edb8a3e254916c0a";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-cp-registry-amd64";
          sha256 = "2b7aebccab17ad0093cc63c6bdc7d6e6c44567e1dd65b3bbe1561cd880797e01";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-cp-registry-arm64";
          sha256 = "fec598f6e59afe1f20c8cf4d9baafbda57095d917247994e43119b1f8083919c";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-cp-scheduler-amd64";
          sha256 = "081991e7c9aec020037ab829bc90a8c97a5e10921028f33d7bfa8780ee7c7090";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-cp-scheduler-arm64";
          sha256 = "ba636e1b790cf4d21f6cbccc4eb4f73072ebe0fc88e9810ba9a17cefe6ee3d6f";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-cp-volume-manager-amd64";
          sha256 = "e51bd5195c00e69d40f4b997e7cb1742ae29844480438595ac7e97b92b7a744d";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-cp-volume-manager-arm64";
          sha256 = "8a56dfd7ebdbd57f9ecbb959068f5592257f53a227aeb7054d79082540101d9f";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-cp-failover-controller-amd64";
          sha256 = "ba4aa8ade28b6d8a49eb9e4fac73336073af2ec249d0892f071f09b421fe6005";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-cp-failover-controller-arm64";
          sha256 = "0d50f2fea348a8babc8b442110f32ef182af06672962be36b1c7b3e0923ab8e5";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-cp-sdn-controller-amd64";
          sha256 = "6d701c3f6ba395e9f139106810673211275d67b21aaf7a1ab88512930a2abe97";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-cp-sdn-controller-arm64";
          sha256 = "f17a5f295e9aa8ad9e1fa6d7f756c793577d5e6fc4e835f3f92626c56bd43fb5";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-updater-amd64";
          sha256 = "94350dd7e4bba0ae216a17aa57b6ecdb724914f3dbade94f4b3bba75c7e49c7a";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-updater-arm64";
          sha256 = "87efa7a28374519ed6c843e81caccb4e7a213578e48be7243d06ee18be9265f2";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.579/csfx-frontend.tar.gz";
      sha256 = "952628a30620ee452e2e618cfe3b88edaa7edd59de3485e6983f1375d9e5e76a";
    };
  };
}

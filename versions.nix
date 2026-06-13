{
  csfx = {
    version = "0.2.2-alpha.507";
    agent = {
      amd64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-agent-amd64";
        sha256 = "3900a588b51ff8a0e741cf97e9b8061a874339bfc3b229319a7de8d5172ab8dd";
      };
      arm64 = {
        url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-agent-arm64";
        sha256 = "c842bb5a0abe8f636e33b997c901d72abda1a898c220919fe6333f1c4963db53";
      };
    };
    controlPlane = {
      migrate = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-cp-csfx-migrate-amd64";
          sha256 = "cb67b26b0db3a6328a431b864aba894fd6a68aad220a092f7ee95c02bf2aacd2";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-cp-csfx-migrate-arm64";
          sha256 = "6e7edc3c9c38df9b4988d53855f697e7643de9b02aeddc90015b3a11d57e88f2";
        };
      };
      api-gateway = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-cp-api-gateway-amd64";
          sha256 = "40d2f1e38b71cca2a6d7920e93d04a66ce86dc0dff7130ff429006a7fbdf3ba8";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-cp-api-gateway-arm64";
          sha256 = "3eeccf7a3cda23323d70c9652d7fe0fc73612981dca55b89ef38010fa3384e40";
        };
      };
      registry = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-cp-registry-amd64";
          sha256 = "3d3bf1ebdfb4a242b5cddfab2bea439083774d3b4490ded029d93a768baa1d4a";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-cp-registry-arm64";
          sha256 = "0aca19883c8190981e3b82e6e69430fc757825b50ab177fc5335eb94d86e4c04";
        };
      };
      scheduler = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-cp-scheduler-amd64";
          sha256 = "216fd460539243cdaf317b3d747d51e4f3971ae0d8cb0fa57a0bac06aec2db28";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-cp-scheduler-arm64";
          sha256 = "ad8e0daef13130c947ff98e785903f8f264018cdfef40b6bc9459b1a0204eec1";
        };
      };
      volume-manager = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-cp-volume-manager-amd64";
          sha256 = "908c54e2b13a6a4fbdc4fea57c4d532c5a32293fb46d21dd8d6f8b24346f9904";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-cp-volume-manager-arm64";
          sha256 = "6a13fdfd892717af71ff959fb3385bd5995955fc724c300442dbd4d56c184a55";
        };
      };
      failover-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-cp-failover-controller-amd64";
          sha256 = "4c3602b7ca5e3625943d308ff4a06c1a798576f7f6e71ae44ec70a4a2e8a2a17";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-cp-failover-controller-arm64";
          sha256 = "23beff67da27a56ca965fd1e6b5c5df2b5e01153491a93276cca139e9f1d460a";
        };
      };
      sdn-controller = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-cp-sdn-controller-amd64";
          sha256 = "428cd2fc5b80fc3c23a6f6f4d87620cb5c44fb113bd5512ae1ad338f4e13f0f9";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-cp-sdn-controller-arm64";
          sha256 = "b16dcf7dd32c64a355ef90610ad52d9f4a0453a6aaa341854b7c511c4b102d25";
        };
      };
      csfx-updater = {
        amd64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-updater-amd64";
          sha256 = "e91b7081bf21c19586f67e1905d89890ea6ec9956b5c61070eba7f49287a3c0d";
        };
        arm64 = {
          url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-updater-arm64";
          sha256 = "394d93aaa1a1d6c2a749399a007267922f286e31e099aa7c9dd192352ad7eefd";
        };
      };
    };
    frontend = {
      url = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.507/csfx-frontend.tar.gz";
      sha256 = "fa8d35bb8c36301e8f8417f4167ec11ac953c5045612baa97a90e3ea08d15f5f";
    };
  };
}

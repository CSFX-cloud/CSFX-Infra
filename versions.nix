{
  csfx = {
    version = "0.2.2-alpha.454";
    images = {
      api-gateway         = { digest = "sha256:c2e083a98431be7c88e7ceb400d9a8a68ee9200654a3d80638f2b90a523bbe67"; };
      registry            = { digest = "sha256:ac18acccd87ce32c84a93b81f56a0d3aca45bee904facc3efbbd61610d33ee7c"; };
      scheduler           = { digest = "sha256:5c2ec747812fefab86e0fa5630ee30656606682562a8fa92501def54d1ad9a36"; };
      volume-manager      = { digest = "sha256:7a97a36b493612c524ee94bbfb1a9febe1b76b5a953a83baf7dad1aeeb2a5488"; };
      failover-controller = { digest = "sha256:837d8f2793a98157a18e4c2713da784080ed4cfdf7a59b21174fb6c6bb440269"; };
      sdn-controller      = { digest = "sha256:6040c04ba02505def0774a6bd8b73888d8dbbe3c2ce99f7dced94312810d6765"; };
    };
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.454/csfx-agent-amd64";
        sha256 = "f2c90b057a8ed2519d25edf27f56da94fb0b479d429e20af809be9a28c611ab4";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.454/csfx-agent-arm64";
        sha256 = "68fdb459513be2f3dbc55ffccf797f1659544b4dd4a95830d3919c9cb9eedbc7";
      };
    };
  };
}

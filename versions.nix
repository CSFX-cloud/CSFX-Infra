{
  csfx = {
    version = "0.2.2-alpha.459";
    images = {
      api-gateway         = { digest = "sha256:9692a8435db60fce4e4c0408ab719a06012b2db99665a446d351b2c714f2ae42"; };
      registry            = { digest = "sha256:a514bcec51db48d655ac7d8c876465923eea59f017b7b7ede1c3783399a3e589"; };
      scheduler           = { digest = "sha256:47b4c41af4b11adc87d6a777760c18beac4ce46e71b8c42bd7ce70d7b98df28c"; };
      volume-manager      = { digest = "sha256:eda2402f6d966493e98495750cff742875d0dc99baa9ba37d0e4b1867ea37869"; };
      failover-controller = { digest = "sha256:97c58d56473e30812e42369132f52a1dd76e30daa92b0cab5dc80bed299d98c8"; };
      sdn-controller      = { digest = "sha256:e66623b67927446022d2fc27dd0126454b65b0c2ee0f9101b8c14c2dcd8a5a60"; };
    };
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.459/csfx-agent-amd64";
        sha256 = "d98a7f9ef68673923fd728d897878956719e7f7d9dbdb25f3de6d168282a1bda";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.459/csfx-agent-arm64";
        sha256 = "40a6dce309e99614680c2a435d87a92dc14a05a5d901aa1c2ff86f49030c5bb1";
      };
    };
  };
}

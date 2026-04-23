{
  csfx = {
    version = "0.2.2-alpha.460";
    images = {
      api-gateway         = { digest = "sha256:9692a8435db60fce4e4c0408ab719a06012b2db99665a446d351b2c714f2ae42"; };
      registry            = { digest = "sha256:6b6140893e0da15d8e58eb587c217416d5f54f33850afcdb75b68bfa073a371f"; };
      scheduler           = { digest = "sha256:47b4c41af4b11adc87d6a777760c18beac4ce46e71b8c42bd7ce70d7b98df28c"; };
      volume-manager      = { digest = "sha256:eda2402f6d966493e98495750cff742875d0dc99baa9ba37d0e4b1867ea37869"; };
      failover-controller = { digest = "sha256:97c58d56473e30812e42369132f52a1dd76e30daa92b0cab5dc80bed299d98c8"; };
      sdn-controller      = { digest = "sha256:2fd1b75aef9bfe1ab2637c2ebaa4bf2e36f641cdb70d9e9eb30eb9b3af45829c"; };
    };
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.460/csfx-agent-amd64";
        sha256 = "2eb18eef7986610504bb4c66a4dc9c6a2abc99b5520aac07e2d43b0e342d0bdc";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.460/csfx-agent-arm64";
        sha256 = "1f8d608608d4b6b691585576e8b7954843d39315fcdc9200a185b64b7a311e4e";
      };
    };
  };
}

{
  csfx = {
    version = "0.2.2-alpha.458";
    images = {
      api-gateway         = { digest = "sha256:af31c033fd6b9f3210c3cb10f9fc314e252abc7097e97b7fed4aa14eddccb5c9"; };
      registry            = { digest = "sha256:2109d07bd884d2e0c7f1af320acfb06e37e48ce370efc43f84d7e2ad3b67ae6f"; };
      scheduler           = { digest = "sha256:00093702981b9e546023a73864b2bc61d1ecf6f87acbffad07919391906054e5"; };
      volume-manager      = { digest = "sha256:aa88983e2b3510950f4abe146f4de21bbe3f731c137a4d60a60b4943778c100e"; };
      failover-controller = { digest = "sha256:681eb5def7c86517549382338aa482dca9658c4d84b47d5785051a608940c97c"; };
      sdn-controller      = { digest = "sha256:f6f9d33dc9d6be614f10eb65fed9348a22acb39b689cbe8ddaa0f4641191a03b"; };
    };
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-agent-amd64";
        sha256 = "157432f0c49f43d8c91b61208e431c432c8713952aaa60520c61c80610a4b6ac";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.458/csfx-agent-arm64";
        sha256 = "79e813fb65e376c96aa58e80c112ec0170811d40bed1f84d10023863a0a67b37";
      };
    };
  };
}

{
  csfx = {
    version = "0.2.2-alpha.453";
    images = {
      api-gateway         = { digest = "sha256:6223f083f2dd45631933a72350f10cca8a174eab05395bdbab36c17db70f4af7"; };
      registry            = { digest = "sha256:35c70e3ba6156a8f052f1ae1e5070b320316831605125cfe8f4954deb80c472d"; };
      scheduler           = { digest = "sha256:df2043259e56acc63bce7ced9c5b2693242ae7a4e7cf819083902e1c47f3526f"; };
      volume-manager      = { digest = "sha256:e310a96762d540058d4616c382c358dd86ab1f73f0070faaad012c67c3f8ad0b"; };
      failover-controller = { digest = "sha256:d7916a64b087d4a4cc630666a9d84711183d141293b75dc5e27554ec08785675"; };
      sdn-controller      = { digest = "sha256:1d0f759e049cafb0f530a59496df717dd6269b111e53f09b8c26f83d6a73ac69"; };
    };
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.453/csfx-agent-amd64";
        sha256 = "a6b818694cbb5ade398cfb041ff9d084fad1d0057a5e42aaf6a6af02491535c5";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.453/csfx-agent-arm64";
        sha256 = "77232d5b5c4de7fd3b3bcd1288b26bcd34252b0b73f7771432796baae2f927bc";
      };
    };
  };
}

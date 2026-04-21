{
  csfx = {
    version = "0.2.2-alpha.457";
    images = {
      api-gateway         = { digest = "sha256:c2003d3c5196bcc029c61e1c01a3d7eab97db4c1198b495ae98127b249c61402"; };
      registry            = { digest = "sha256:868f25e73faab0831312682170bdf2b930ba7e818d7dbfdf9aa7139b4fcb6284"; };
      scheduler           = { digest = "sha256:ab012c0121e750623b77bd7f2c2794a5ce6e0566836f3e39580cda2d0f62d9bb"; };
      volume-manager      = { digest = "sha256:4664e67183a6c9898c52701e8db41e8477642a075ae259004464e9823039239c"; };
      failover-controller = { digest = "sha256:4e58c64337d91d0122bf8a777b9128f6d922c081d5c908473d52c275b8f31ed3"; };
      sdn-controller      = { digest = "sha256:9552d26b7baa99fa4b03e6e49ae9b0312d49696cd46d68f91f0092409b528660"; };
    };
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.457/csfx-agent-amd64";
        sha256 = "7b0c2c9d57ac35e506a56aa74b02e1ab0badecbcc0e32e27e4dc1fdfba7176e7";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.457/csfx-agent-arm64";
        sha256 = "95a8d8bdf2b01a09409456aacb69bacb530b88163e0aeb99e37926519d8dcaf4";
      };
    };
  };
}

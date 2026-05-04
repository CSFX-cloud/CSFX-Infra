{
  csfx = {
    version = "0.2.2-alpha.461";
    images = {
      api-gateway         = { digest = "sha256:0502eed3fa1fb096d414dacb8eaa1e2c9b7ef93fa92fec11fb0ac774127c9df2"; };
      registry            = { digest = "sha256:07ab7bdd3872c7523566b815d32acf12bea63c42c0a9cbad44f8c54f350e6264"; };
      scheduler           = { digest = "sha256:55a5b11e2809fc94754e81d97fc367fe1d5f934dc2e7a80fcf40dec46ec3657b"; };
      volume-manager      = { digest = "sha256:f3e0ccecbfd1ae2b94ccd5c77475615785b773256b9c2e74e26df9994ef7b4b7"; };
      failover-controller = { digest = "sha256:a0848af1403e4d1cc97fa174f8942d9d22c7ee3ea8dedd5118543047f7a42639"; };
      sdn-controller      = { digest = "sha256:aa9a57151e4fdc0277bc1ff885efd7aecfcd8be11a80baec8c4afab7f3e59ab3"; };
    };
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.461/csfx-agent-amd64";
        sha256 = "ec245d472ddf0903f376b1b4b922d34d764ae244b62b8889c883c7134d4148ef";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.461/csfx-agent-arm64";
        sha256 = "be995aceae5a2a59f8acb4c025bab0ddda1954cb24992cd392be1f3506f724f0";
      };
    };
  };
}

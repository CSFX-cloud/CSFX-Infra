{
  csfx = {
    version = "0.2.2-alpha.455";
    images = {
      api-gateway         = { digest = "sha256:73efe757bfcc0be15ca14c07dab06c977b1b0ecef5ba37a3a741a5f5f837e2d5"; };
      registry            = { digest = "sha256:955665c9999adf206d04217c12ff8488a9aa41eb41f061f6a5ce2c91c877a65f"; };
      scheduler           = { digest = "sha256:93fcf3581299c51bd4c8a2cc8da7f8dc153ba9b2b48041fc3f5370b49a3cbf54"; };
      volume-manager      = { digest = "sha256:cb6f2bf72b3ba970b7bd2540211163e4251d58c5952619fb47d8f46b3aec00c5"; };
      failover-controller = { digest = "sha256:38c099fc2ed725a2e03892e566d0a02c390ad4009fed91f3e10cb24b7f42ecca"; };
      sdn-controller      = { digest = "sha256:72a6becf85388dc99f95e2c515475150671f4c01b0df5649684bc20ea0c286bc"; };
    };
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.455/csfx-agent-amd64";
        sha256 = "6b362e31bc58110819a31d9116a15f848e23b0d15404c63aefc7bf4e726acb1a";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.455/csfx-agent-arm64";
        sha256 = "9a282040b829eea8c0c52652238b3a405b77945ff3090480af8030008b386509";
      };
    };
  };
}

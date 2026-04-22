{
  csfx = {
    version = "0.2.2-alpha.55";
    images = {
      api-gateway         = { digest = "sha256:6641449f06dace7a9f25e17ae48dc8ee68e4e571e942229ddea575a350c73dd7"; };
      registry            = { digest = "sha256:f2219b4a7672e92187fb93f9c0cdd2bb1e115750efc0b7ab5a3b00b1b12a0472"; };
      scheduler           = { digest = "sha256:39e41266f543c7ad921ddd9a00940afb32614a15ebb9ef081ac67846881896c6"; };
      volume-manager      = { digest = "sha256:f02851f4257bd960352718c31578a5cc4e97e4e9365a5f66ec2822ceacbe781c"; };
      failover-controller = { digest = "sha256:a1e2f37da14bdb7bf8ac5ebcf1767c05487a79557f1da2162685c13b11a87e3d"; };
      sdn-controller      = { digest = "sha256:200c4b594e1e15733025b04cd40f4f5856c793b7d979ba04b290bdf88ff12f24"; };
      patroni             = { digest = "sha256:04cbdfa32370fb8bcc9623bea93f12fda8f5c70b43a3a2b14713c2878fb66a6e"; };
    };
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.55/csfx-agent-amd64";
        sha256 = "a6da16dcb3ae846a2f8413d7d494acc578b4045754e211137e90bccf49999d32";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.55/csfx-agent-arm64";
        sha256 = "b11bca9f2d5191a61189f28b7f8b43e62616e34f3fc05b9b0e25d7c940cf7bec";
      };
    };
  };
}

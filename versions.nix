{
  csfx = {
    version = "0.2.2-alpha.449";
    images = {
      api-gateway         = { digest = "sha256:57b3807836a41cf2a0738e6333e2d96c900feece7f03c97cd5b1a51078dca88e"; };
      registry            = { digest = "sha256:eb3f9a1a2773d379e6059815bac2a772f36eca473bf1ab3a9fd8956675e4bc5e"; };
      scheduler           = { digest = "sha256:7c13ad5f85b5b03579add05119e78c7030c4e94457357a797e5b66470a101e10"; };
      volume-manager      = { digest = "sha256:f7f8d8845a8517a632b2a5adc6795b567d03e143a2efea5d9e47fcac296ad2d2"; };
      failover-controller = { digest = "sha256:f495ebe92291afb8bece49be8325d6be457d39a2c8615ed9f47109c6196f53e6"; };
      sdn-controller      = { digest = "sha256:49a11fd1ababa24143f6d0628a25260ed0ba54f69a4c9cd5c181a0911c72f12a"; };
    };
    agent = {
      amd64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.449/csfx-agent-amd64";
        sha256 = "4aa852ad894cdb48a621848405d14d72e0e00c0350edef1b02680c67a40cc901";
      };
      arm64 = {
        url    = "https://github.com/CSFX-cloud/CSFX-Core/releases/download/v0.2.2-alpha.449/csfx-agent-arm64";
        sha256 = "1c5d6bf2e50a8415e22a8b96528bcb7a485acfe2731855e70d14dba89fd80016";
      };
    };
  };
}

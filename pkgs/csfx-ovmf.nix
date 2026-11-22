{ OVMF }:

OVMF.overrideAttrs (old: {
  postPatch = (old.postPatch or "") + ''
    cp ${./csfx-ovmf-logo.bmp} MdeModulePkg/Logo/Logo.bmp
  '';
})

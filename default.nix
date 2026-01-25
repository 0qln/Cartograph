{pkgs ? import <nixpkgs> {}, ...}:
pkgs.stdenvNoCC.mkDerivation {
  pname = "Cartograph CF Nerd Font";
  version = "v1.0.3";
  src = ./.;

  buildInputs = with pkgs; [
    fontforge
    nerd-font-patcher
  ];

  configurePhase = ''
    cd src
  '';

  buildPhase = ''
    mkdir -p patched-fonts
    for font in *.otf; do
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher \
        --complete \
        --outputdir patched-fonts \
        "$font"
    done
  '';

  installPhase = ''
    mkdir -p "$out/share/fonts/opentype"
    cp patched-fonts/*.otf "$out/share/fonts/opentype/"
  '';
}

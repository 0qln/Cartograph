{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = _: {
    overlays.default = _: prev: {
      cartographcf-nerdfont = import ./default.nix {pkgs = prev;};
    };
  };
}

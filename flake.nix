{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    pkgs = import nixpkgs {system = "x86_64-linux";};
  in {
    overlays.default = _: prev: {
      cartographcf-nerdfont = import ./default.nix {pkgs = prev;};
    };
    packages."x86_64-linux".default = import ./default.nix {inherit pkgs;};
  };
}

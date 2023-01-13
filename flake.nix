{
  description = "Virtualization-based PlayStation 4 emulator.";
  inputs.nixpkgs.url = github:nixos/nixpkgs?ref=nixos-22.11;

  outputs = {
    self,
    nixpkgs,
  }: let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    genSystems = nixpkgs.lib.genAttrs supportedSystems;
    pkgs = genSystems (system:
      import nixpkgs {
        inherit system;
        # use clang
        replaceStdenv = {pkgs, ...}: pkgs.clangStdenv;
      });
  in {
    packages = genSystems (system: rec {
      orbital = pkgs.${system}.callPackage ./tools/nix {};
      default = orbital;
    });
  };
}

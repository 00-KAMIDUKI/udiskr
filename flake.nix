{
  description = "Lightweight alternative to udiskie";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    rust-overlay,
  }: let
    supportedSystems = ["x86_64-linux"];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    pkgsFor = nixpkgs.legacyPackages;

    udiskr-package = {pkgs ? import <nixpkgs> {}}: let
      rust-overlay-pkgs = pkgs.extend rust-overlay.overlays.default;

      rustPlatform = pkgs.makeRustPlatform {
        cargo = rust-overlay-pkgs.rust-bin.nightly.latest.minimal;
        rustc = rust-overlay-pkgs.rust-bin.nightly.latest.minimal;
      };
      manifest = (pkgs.lib.importTOML ./Cargo.toml).package;
    in
      rustPlatform.buildRustPackage {
        pname = manifest.name;
        version = manifest.version;
        cargoLock.lockFile = ./Cargo.lock;
        src = pkgs.lib.cleanSource ./.;
      };
  in {
    packages = forAllSystems (system: {
      default = pkgsFor.${system}.callPackage udiskr-package {};
    });
  };
}

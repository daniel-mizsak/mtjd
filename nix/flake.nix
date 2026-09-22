# Documentation:
#   - https://github.com/mitchellh/nixos-config
#   - https://github.com/zmre/mac-nix-simple-example
#   - https://github.com/MatthiasBenaets/nix-config
#   - https://github.com/caarlos0/dotfiles
{
  description = "Setting up everything with Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:Homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:Homebrew/homebrew-cask";
      flake = false;
    };
    lzhgus-homebrew-tap = {
      url = "github:lzhgus/homebrew-tap";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      lzhgus-homebrew-tap,
    }:
    let
      mkSystem = import ./mksystem.nix {
        inherit nixpkgs inputs;
      };
    in
    {
      darwinConfigurations.macos = mkSystem "macos" {
        system = "aarch64-darwin";
        user = "damz";
        is-darwin = true;
      };

      nixosConfigurations.nixos = mkSystem "nixos" {
        system = builtins.currentSystem;
        user = "damz";
      };
    };
}

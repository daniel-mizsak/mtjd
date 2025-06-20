# Documentation:
#   - https://github.com/mitchellh/nixos-config
#   - https://github.com/zmre/mac-nix-simple-example
#   - https://github.com/MatthiasBenaets/nix-config
#   - https://github.com/caarlos0/dotfiles
{
  description = "Setting up everything with Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    nix-homebrew,
  }: let
    mkSystem = import ./mksystem.nix {
      inherit nixpkgs inputs;
    };
  in {
    darwinConfigurations.macbook = mkSystem "macbook" {
      system = "aarch64-darwin";
      user = "damz";
      is-darwin = true;
    };

    nixosConfigurations.vm-arm = mkSystem "vm" {
      system = "aarch64-linux";
      user = "damz";
    };

    nixosConfigurations.vm-amd = mkSystem "vm" {
      system = "x86_64-linux";
      user = "damz";
    };
  };
}

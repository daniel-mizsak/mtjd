{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./modules/packages.nix
    ./modules/programs-nixos.nix
  ];
}

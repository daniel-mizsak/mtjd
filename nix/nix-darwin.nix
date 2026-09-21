{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./modules/packages.nix
    ./modules/programs-darwin.nix
  ];
}

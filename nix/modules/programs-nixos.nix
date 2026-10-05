{
  pkgs,
  currentSystemUser,
  ...
}:
{
  programs = {
    _1password = {
      enable = true;
    };
    firefox.enable = true;
    fish.enable = true;
    nix-ld.enable = true;
    zsh.enable = true;
  };

  users.users.${currentSystemUser}.packages = with pkgs; [
    kdePackages.kate
    vscode
  ];
}

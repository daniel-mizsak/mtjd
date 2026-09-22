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

  virtualisation.podman = {
    enable = true;
    defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
  };

  environment.variables.DOCKER_HOST = "unix://\${XDG_RUNTIME_DIR}/podman/podman.sock";

  users.users.${currentSystemUser}.packages = with pkgs; [
    docker-compose
    flameshot
    ghostty
    kdePackages.kate
    podman-desktop
    vscode
  ];
}

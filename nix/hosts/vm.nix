{
  config,
  pkgs,
  ...
}:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Budapest";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "hu_HU.UTF-8";
      LC_IDENTIFICATION = "hu_HU.UTF-8";
      LC_MEASUREMENT = "hu_HU.UTF-8";
      LC_MONETARY = "hu_HU.UTF-8";
      LC_NAME = "hu_HU.UTF-8";
      LC_NUMERIC = "hu_HU.UTF-8";
      LC_PAPER = "hu_HU.UTF-8";
      LC_TELEPHONE = "hu_HU.UTF-8";
      LC_TIME = "hu_HU.UTF-8";
    };
  };

  services = {
    xserver.enable = true;

    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    openssh = {
      enable = true;
      ports = [ 22 ];
    };
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true; # Creates a symlink from docker to podman
    defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
  };

  users.users."damz" = {
    isNormalUser = true;
    description = "Daniel Mizsak";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    home = "/home/damz";
    shell = pkgs.fish;
    packages = with pkgs; [
      docker-compose
      kdePackages.kate
      podman-desktop
      vscode
    ];
  };

  programs = {
    _1password = {
      enable = true;
    };
    firefox.enable = true;
    fish.enable = true;
    nix-ld.enable = true;
    zsh.enable = true;
  };

  # Do not change stateVersion after installation!
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "26.05";
}

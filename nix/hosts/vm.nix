{
  config,
  pkgs,
  ...
}: {
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
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    openssh = {
      enable = true;
      ports = [22];
    };
  };

  virtualisation.docker.enable = true;

  users.mutableUsers = false;
  users.users.damz = {
    isNormalUser = true;
    description = "Daniel Mizsak";
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
    ];
    home = "/home/damz";
    shell = pkgs.fish;
    packages = with pkgs; [
      kdePackages.kate
      vscode
    ];
    hashedPassword = "$y$j9T$SLcpv.fvXbk2PqUEOuHVL0$VZUxN7P8EXwsXVxCvReON7tOrV/ARfd.oyCQ3trt5aA";
  };

  security.sudo.extraRules = [
    {
      users = ["damz"];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];

  programs = {
    _1password = {enable = true;};
    firefox.enable = true;
    fish.enable = true;
    nix-ld.enable = true;
    zsh.enable = true;
  };

  # Do not change stateVersion after installation!
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}

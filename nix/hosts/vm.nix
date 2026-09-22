{
  pkgs,
  currentSystemUser,
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

  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=0
  '';

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    firewall.allowedUDPPorts = [ 5353 ];
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
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    openssh = {
      enable = true;
      ports = [ 2222 ];
    };
    resolved = {
      enable = true;
      settings.Resolve.MulticastDNS = true;
    };

  };

  environment.plasma6.excludePackages = [
    pkgs.kdePackages.discover
    pkgs.kdePackages.elisa
    pkgs.kdePackages.khelpcenter
    pkgs.kdePackages.kwin-x11
    pkgs.kdePackages.spectacle
  ];

  users.users.${currentSystemUser} = {
    isNormalUser = true;
    description = "Daniel Mizsak";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    home = "/home/${currentSystemUser}";
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIArEgeNCsIt8dFvyXKHKz1SYunldIoXXNAwTcRJTpbMc daniel@mizsak.com"
    ];
  };

  # Do not change stateVersion after installation!
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "26.05";
}

{...}: {
  # Homebrew
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    brews = [
      "mas"
      "postgresql@16"
      "sevenzip"
    ];
    casks = [
      "1password"
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "alacritty"
      "aldente"
      "betterdisplay"
      "db-browser-for-sqlite"
      "dbeaver-community"
      "devtoys"
      "docker-desktop"
      "ghostty"
      "github"
      "hiddenbar"
      "iterm2"
      "karabiner-elements"
      "keyboardcleantool"
      "mullvad-browser"
      "mullvad-vpn"
      "obs"
      "obsidian"
      "openinterminal"
      "orbstack"
      "parallels@19"
      "podman-desktop"
      "postman"
      "raspberry-pi-imager"
      "raycast"
      "scroll-reverser"
      "signal"
      "spotify"
      "sublime-text"
      "synology-drive"
      "tailscale-app"
      "updf"
      "visual-studio-code"
      "vivaldi"
      "vlc"
      "vnc-viewer"
      "wezterm"
    ];
    masApps = {
      # General
      "Compressor" = 424390742;
      "Final Cut Pro" = 424389933;
      "Keynote" = 409183694;
      "Magnet" = 441258766;
      "Motion" = 434290957;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Windows App" = 1295203466;
      "Xcode" = 497799835;
      # Safari Extensions
      "1Password for Safari" = 1569813296;
      "AdGuard for Safari" = 1440147259;
      "Return YT Dislikes" = 6463305263;
      "Speed Player for Safari" = 1521133201;
      "SponsorBlock for YouTube" = 1573461917;
    };
  };
}

{ ... }:
{
  homebrew = {
    enable = true;
    global = {
      autoUpdate = false;
    };
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };
    casks = [
      "1password"
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "alacritty"
      "aldente"
      "boosteroid"
      "claude"
      "codex-app"
      "dbeaver-community"
      "docker-desktop"
      "ghostty"
      "github"
      "hiddenbar"
      "iina"
      "karabiner-elements"
      "keyboardcleantool"
      "lens"
      "libreoffice"
      "localsend"
      "mullvad-browser"
      "mullvad-vpn"
      "obs"
      "obsidian"
      "openinterminal"
      "parallels@19"
      "pomotroid"
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
      "vnc-viewer"
      "wezterm"
      "zed"
    ];
    masApps = {
      # General
      "Compressor" = 424390742;
      "Final Cut Pro" = 424389933;
      "Magnet" = 441258766;
      "Motion" = 434290957;
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

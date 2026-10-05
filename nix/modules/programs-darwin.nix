{ ... }:
{
  programs.fish.enable = true;

  homebrew = {
    enable = true;
    global = {
      autoUpdate = false;
    };
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };
    brews = [
      "podman"
    ];
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
      "ghostty"
      "github"
      "hiddenbar"
      "iina"
      "karabiner-elements"
      "keyboardcleantool"
      "kimi"
      "lens"
      "libreoffice"
      "localsend"
      "lzhgus/tap/capso"
      "mullvad-browser"
      "mullvad-vpn"
      "obs"
      "obsidian"
      # "openinterminal"
      "parallels@19"
      "podman-desktop"
      "postman"
      "raspberry-pi-imager"
      "raycast"
      "scroll-reverser"
      "signal"
      "sublime-text"
      "synology-drive"
      "tailscale-app"
      "updf"
      "utm"
      "visual-studio-code"
      "vivaldi"
      "realvnc-connect-viewer"
      "wezterm"
      "zcode"
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

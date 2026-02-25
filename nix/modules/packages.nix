{pkgs, ...}: {
  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
  ];

  # Nix
  environment = {
    variables = {
      EDITOR = "nvim";
      SUDO_EDITOR = "nvim";
      TERMINAL = "wezterm";

      DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
      DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = "1";
    };

    systemPackages = with pkgs; [
      # Terminal
      _1password-cli
      alejandra
      atuin
      azure-cli
      bat
      btop
      bun
      curl
      direnv
      dotnet-sdk_10
      dust
      eza
      fastfetch
      fd
      ffmpegthumbnailer
      fish
      fzf
      gcc
      gh
      git
      github-copilot-cli
      gnumake
      gnutar
      go
      hadolint
      htop
      hugo
      hyperfine
      icu
      imagemagick
      jq
      just
      just-lsp
      kubectl
      lazydocker
      lazygit
      navi
      neovim
      ngrok
      nodejs_24
      oh-my-posh # Sometimes bugs out. To fix run: `rm -f ~/.cache/oh-my-posh/init.*`
      openssl
      poppler
      powershell
      prettier
      pulumi-bin
      rclone
      ripgrep
      shellcheck
      shfmt
      stripe-cli
      terraform
      texliveFull
      tlrc
      tmux
      tokei
      tree
      uv
      wget
      xh
      yazi
      yt-dlp
      zoxide
      zsh
    ];
  };
}

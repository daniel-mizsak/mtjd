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
      TERMINAL = "ghostty";
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
      codex
      curl
      direnv
      (dotnetCorePackages.combinePackages [
        dotnetCorePackages.sdk_8_0
        dotnetCorePackages.sdk_10_0
      ])
      dust
      eza
      fastfetch
      fd
      ffmpegthumbnailer
      fish
      fossil
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
      pinact
      poppler
      powershell
      prettier
      pulumi-bin
      rclone
      repomix
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
      zizmor
      zoxide
      zsh
    ];
  };
}

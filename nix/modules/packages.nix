{ pkgs, ... }:
{
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

      DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
    };

    systemPackages = with pkgs; [
      # Terminal
      _1password-cli
      age
      atuin
      azure-cli
      bat
      btop
      bun
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
      ffmpeg
      fish
      fossil
      fzf
      gcc
      gh
      git
      gnumake
      gnutar
      go
      golangci-lint
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
      lazygit
      neovim
      ngrok
      nixfmt
      nodejs_24
      oh-my-posh # Sometimes bugs out. To fix run: `rm -f ~/.cache/oh-my-posh/init.*`
      openssl
      pinact
      powershell
      prek
      prettier
      pulumi-bin
      rclone
      repomix
      ripgrep
      ruff
      shellcheck
      shfmt
      stripe-cli
      statix
      terraform
      texliveFull
      tlrc
      tmux
      tokei
      tree
      tree-sitter
      ty
      uv
      wget
      yazi
      yt-dlp
      zizmor
      zoxide
      zsh
    ];
  };
}

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

      DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
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
      neovim
      ngrok
      nodejs_24
      oh-my-posh # Sometimes bugs out. To fix run: `rm -f ~/.cache/oh-my-posh/init.*`
      openssl
      pinact
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
      yazi
      yt-dlp
      zizmor
      zoxide
      zsh
    ];
  };
}

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

      DOTNET_ROOT = "${pkgs.dotnet-sdk_8}/share/dotnet";
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
      csharpier
      curl
      direnv
      dotnet-sdk_8
      dust
      eza
      fastfetch
      fd
      ffmpegthumbnailer
      fzf
      gcc
      gh
      git
      github-copilot-cli
      gnumake
      gnutar
      go
      hadolint
      hyperfine
      htop
      icu
      imagemagick
      jq
      just
      kubectl
      lazydocker
      lazygit
      navi
      neovim
      ngrok
      nodejs_24
      oh-my-posh
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
      zoxide
    ];
  };
}

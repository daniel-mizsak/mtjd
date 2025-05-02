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
      DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = 1;
    };

    systemPackages = with pkgs; [
      # Terminal
      _1password-cli
      alejandra
      ansible
      ansible-lint
      atuin
      bat
      btop
      csharpier
      deadnix
      direnv
      dotnet-sdk_8
      eza
      fastfetch
      fd
      ffmpegthumbnailer
      fzf
      gcc
      gh
      git
      gnumake
      gnutar
      go
      hadolint
      htop
      icu
      imagemagick
      jq
      kubectl
      lazydocker
      lazygit
      molecule
      neovim
      oh-my-posh
      openssl
      poppler
      powershell
      pre-commit
      rclone
      ripgrep
      shellcheck
      shfmt
      statix
      stripe-cli
      terraform
      texliveFull
      tlrc
      tmux
      tree
      uv
      wget
      yamllint
      yazi
      zoxide
    ];
  };
}

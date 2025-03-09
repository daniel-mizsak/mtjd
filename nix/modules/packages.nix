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
      pulumi
      rclone
      ripgrep
      shellcheck
      shfmt
      statix
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

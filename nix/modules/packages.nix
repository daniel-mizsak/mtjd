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
    };
    systemPackages = with pkgs; [
      # Terminal
      _1password-cli
      alejandra
      atuin
      bat
      btop
      bzip2
      deadnix
      direnv
      eza
      fastfetch
      fd
      ffmpegthumbnailer
      fzf
      gcc
      git
      gnumake
      htop
      imagemagick
      jq
      kubectl
      lazydocker
      lazygit
      libffi
      ncurses
      neovim
      oh-my-posh
      openssl
      poppler
      pre-commit
      readline
      ripgrep
      statix
      tlrc
      tmux
      tree
      wget
      yazi
      zlib
      zoxide

      dotnet-sdk_8
      go
      pyenv
    ];
  };
}

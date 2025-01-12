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

      PYENV_ROOT = "$HOME/.pyenv";
      CPPFLAGS = "-I${pkgs.zlib.dev}/include -I${pkgs.libffi.dev}/include -I${pkgs.readline.dev}/include -I${pkgs.bzip2.dev}/include -I${pkgs.openssl.dev}/include";
      CXXFLAGS = "-I${pkgs.zlib.dev}/include -I${pkgs.libffi.dev}/include -I${pkgs.readline.dev}/include -I${pkgs.bzip2.dev}/include -I${pkgs.openssl.dev}/include";
      CFLAGS = "-I${pkgs.openssl.dev}/include";
      LDFLAGS = "-L${pkgs.zlib.out}/lib -L${pkgs.libffi.out}/lib -L${pkgs.readline.out}/lib -L${pkgs.bzip2.out}/lib -L${pkgs.openssl.out}/lib";
      CONFIGURE_OPTS = "-with-openssl=${pkgs.openssl.dev}";
      PYENV_VIRTUALENV_DISABLE_PROMPT = "1";
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

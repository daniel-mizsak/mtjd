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

      # Required for Pyenv
      #   - https://semyonsinchenko.github.io/ssinchenko/post/using-pyenv-with-nixos/
      #   - https://github.com/pyenv/pyenv/wiki/common-build-problems#build-failed-error-the-python-zlib-extension-was-not-compiled-missing-the-zlib
      CPPFLAGS =
        "-I${pkgs.bzip2.dev}/include "
        + "-I${pkgs.libffi.dev}/include "
        + "-I${pkgs.ncurses.dev}/include "
        + "-I${pkgs.openssl.dev}/include "
        + "-I${pkgs.readline.dev}/include "
        + "-I${pkgs.sqlite.dev}/include "
        + "-I${pkgs.xz.dev}/include "
        + "-I${pkgs.zlib.dev}/include";
      LDFLAGS =
        "-L${pkgs.bzip2.out}/lib "
        + "-L${pkgs.libffi.out}/lib "
        + "-L${pkgs.ncurses.out}/lib "
        + "-L${pkgs.openssl.out}/lib "
        + "-L${pkgs.readline.out}/lib "
        + "-L${pkgs.sqlite.out}/lib "
        + "-L${pkgs.xz.out}/lib "
        + "-L${pkgs.zlib.out}/lib";
      CONFIGURE_OPTS = "-with-openssl=${pkgs.openssl.dev}";
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
      gnutar
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
      sqlite
      statix
      tlrc
      tmux
      tree
      wget
      xz
      yazi
      zlib
      zoxide

      dotnet-sdk_8
      go
      pyenv
    ];
  };
}

{
  user,
  is-darwin,
  inputs,
}: {
  config,
  pkgs,
  ...
}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (pkgs.lib) mkMerge mkIf;
  repository = "mtjd";
in {
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "v1.2.0";
          hash = "sha256-q26XVS/LcyZPRqDNwKKA9exgBByE0muyuNb0Bbar2lY=";
        };
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.1";
          hash = "sha256-vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.8.0";
          hash = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
        };
      }
    ];
  };

  home = {
    stateVersion = "24.11";
    username = user;

    file = mkMerge [
      {
        ### Terminal
        # atuin
        ".config/atuin/config.toml".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/config/atuin/config.toml";

        # bat
        ".config/bat/themes/Catppuccin Mocha.tmTheme".source = "${config.home.homeDirectory}/${repository}/dotfiles/config/bat/themes/Catppuccin Mocha.tmTheme";

        # btop
        ".config/btop/btop.conf".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/config/btop/btop.conf";
        ".config/btop/themes/catppuccin_mocha.theme".source = "${config.home.homeDirectory}/${repository}/dotfiles/config/btop/themes/catppuccin_mocha.theme";

        # fastfetch
        ".config/fastfetch/config.jsonc".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/config/fastfetch/config.jsonc";

        # ghostty
        ".config/ghostty/config".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/config/ghostty/config";

        # git
        ".gitconfig".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/git/.gitconfig";
        ".gitignore_global".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/git/.gitignore_global";
        ".gitmessage".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/git/.gitmessage";

        # neovim
        ".config/nvim".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/config/nvim";

        # oh-my-posh
        ".config/oh-my-posh/oh-my-posh.toml".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/config/oh-my-posh/oh-my-posh.toml";

        # ssh
        ".ssh/config".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/ssh/config";
        ".ssh/config.d/github".source = "${config.home.homeDirectory}/${repository}/dotfiles/ssh/config.d/github";
        ".ssh/config.d/mlops".source = "${config.home.homeDirectory}/${repository}/dotfiles/ssh/config.d/mlops";

        # tmux
        ".config/tmux/tmux.conf".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/config/tmux/.tmux.conf";
        ".tmux/plugins/tpm".source = pkgs.fetchFromGitHub {
          owner = "tmux-plugins";
          repo = "tpm";
          rev = "v3.1.0";
          sha256 = "sha256-CeI9Wq6tHqV68woE11lIY4cLoNY8XWyXyMHTDmFKJKI=";
        };

        # yazi
        ".config/yazi".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/config/yazi";

        # zsh
        ".zshrc".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/shell/zsh/.zshrc";
      }

      (mkIf is-darwin {
        # alacritty
        ".config/alacritty/catppuccin-mocha.toml".source = "${config.home.homeDirectory}/${repository}/dotfiles/config/alacritty/catppuccin-mocha.toml";
        ".config/alacritty/alacritty.toml".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/config/alacritty/alacritty.toml";

        # karabiner
        ".config/karabiner/karabiner.json".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/config/karabiner/karabiner.json";

        # sublime
        "/Users/${user}/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/sublime/Preferences.sublime-settings";

        # vscode
        "/Users/${user}/Library/Application Support/Code/User/settings.json".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/vscode/settings.json";

        # wezterm
        ".config/wezterm/wezterm.lua".source =
          mkOutOfStoreSymlink "${config.home.homeDirectory}/${repository}/dotfiles/config/wezterm/wezterm.lua";
      })
    ];
    activation = mkMerge [
      {
        batCache = "${pkgs.bat}/bin/bat cache --build";
      }
      (mkIf is-darwin {
        brewUpgrade = "/opt/homebrew/bin/brew upgrade --greedy";
      })
    ];
  };
}

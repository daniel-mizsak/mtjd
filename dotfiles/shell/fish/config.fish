if status is-interactive
    function fish_greeting
        if not set -q TMUX; and test "$TERM_PROGRAM" != vscode
            fastfetch
        end
    end

    # Atuin
    atuin init fish --disable-up-arrow | source

    # Oh-My-Posh
    oh-my-posh init fish --config $HOME/.config/oh-my-posh/oh-my-posh.toml | source

    # Zoxide
    zoxide init --cmd cd fish | source

    ##### Alias #####
    alias cat="bat"
    alias ls="eza --color=always --all --icons=always"
    alias ll="eza --color=always --all --long --icons=always"
end

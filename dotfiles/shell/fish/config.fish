if status is-interactive
    ##### General #####
    export EDITOR=nvim
    export SUDO_EDITOR=nvim

    # Use github ssh key on macOS
    # https://apple.stackexchange.com/questions/48502/how-can-i-permanently-add-my-ssh-private-key-to-keychain-so-it-is-automatically
    if test (uname) = Darwin
        ssh-add --apple-use-keychain ~/.ssh/id_github -q
    end

    # Make complete-and-search the default tab behavior
    # https://github.com/fish-shell/fish-shell/issues/11193
    bind \t '
        if commandline --search-field >/dev/null
            commandline --function complete
        else
            commandline --function complete-and-search
        end
    '

    # Welcome message
    function fish_greeting
        set fastfetch_whitelist WezTerm ghostty
        if not set --query TMUX
            if contains -- "$TERM_PROGRAM" $fastfetch_whitelist
                fastfetch
            end
        end
    end

    ##### Tools #####
    # Atuin
    atuin init fish --disable-up-arrow | source

    # Bat
    export BAT_THEME="Catppuccin Mocha"

    # Direnv
    direnv hook fish | source

    # Ghostty
    # https://github.com/ghostty-org/ghostty/discussions/2832
    # https://github.com/ghostty-org/ghostty/discussions/4725

    if set --query GHOSTTY_RESOURCES_DIR
        set --local ghostty_shell_integration "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
        if test -f "$ghostty_shell_integration"
            source "$ghostty_shell_integration"
        end
    end

    # Dotnet
    fish_add_path $HOME/.dotnet/tools

    # Oh-My-Posh
    oh-my-posh init fish --config $HOME/.config/oh-my-posh/oh-my-posh.toml | source

    # Uv
    uv generate-shell-completion fish | source
    fish_add_path $HOME/.local/bin

    # Yazi
    function yy
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # Zoxide
    zoxide init --cmd cd fish | source

    ##### Alias #####
    # Directory
    # https://fishshell.com/docs/current/interactive.html#abbreviations
    function multicd
        echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
    end
    abbr --add dotdot --regex '^\.\.+$' --function multicd

    alias cat="bat"
    alias ls="eza --color=always --all --icons=always"
    alias ll="eza --color=always --all --long --icons=always"

    # Docker
    abbr --add dps "docker ps --all"
    abbr --add di "docker images --all"
    abbr --add dv "docker volume"
    abbr --add dx "docker exec --interactive --tty"

    # Git
    abbr --add gcm --set-cursor 'git commit -m "%"'

    # Kubernetes
    alias k="kubectl"

    # Python
    abbr --add pip uv pip
    abbr --add create_venv "uv venv --python 3.12"
    abbr --add activate_venv "source .venv/bin/activate"
    abbr --add pip_install "uv pip install --requirements requirements.txt"
end

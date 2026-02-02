if status is-interactive
    ##### General #####
    export EDITOR=nvim
    export SUDO_EDITOR=nvim

    # Make complete-and-search the default tab behavior
    # https://github.com/fish-shell/fish-shell/issues/11193
    bind \t '
		if commandline --search-field >/dev/null
			commandline -f complete
		else
			commandline -f complete-and-search
		end
	'

    # Welcome message
    function fish_greeting
        set fastfetch_whitelist WezTerm ghostty
        if not set -q TMUX
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

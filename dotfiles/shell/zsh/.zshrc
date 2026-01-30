##### General #####
export EDITOR=nvim
export SUDO_EDITOR=nvim

# Use github ssh key on macOS
# https://apple.stackexchange.com/questions/48502/how-can-i-permanently-add-my-ssh-private-key-to-keychain-so-it-is-automatically
if [[ "$(uname)" == "Darwin" ]]; then
    ssh-add --apple-use-keychain ~/.ssh/id_github -q
fi

# Insensitive completion
# https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/completion.zsh
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'  # case insensitive
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'  # hyphen insensitive

autoload -Uz compinit && compinit

# Open buffer line in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# Expands history expressions like !! or !$ when you press space
bindkey ' ' magic-space

# Zsh Autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
source ${HOME}/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh Syntax Highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source ${HOME}/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


##### Tools #####
# Bat
# https://github.com/sharkdp/bat
export BAT_THEME="Catppuccin Mocha"

# Direnv
# https://direnv.net
eval "$(direnv hook zsh)"

# Dotnet
export PATH="$PATH:$HOME/.dotnet/tools"

# Fastfetch
# https://github.com/fastfetch-cli/fastfetch
if [ -z "$TMUX" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
  fastfetch
fi

# Fzf
# https://github.com/junegunn/fzf
source <(fzf --zsh)
setopt globdots
zstyle ':completion:*' special-dirs false

# Fzf-Tab
# https://github.com/Aloxaf/fzf-tab?tab=readme-ov-file#install
source ${HOME}/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' fzf-flags --color=fg:5
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# Atuin
# https://github.com/atuinsh/atuin
# Atuin should be loaded after fzf so that it is used for ctrl + r
eval "$(atuin init zsh --disable-up-arrow)"

# Oh-My-Posh
# https://ohmyposh.dev/docs/installation/prompt
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ${HOME}/.config/oh-my-posh/oh-my-posh.toml)"
fi

# Uv
# https://docs.astral.sh/uv/
eval "$(uv generate-shell-completion zsh)"
export PATH="${HOME}/.local/bin:$PATH"

# Yazi
# https://yazi-rs.github.io/docs/quick-start
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Zoxide
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init --cmd cd zsh)"


##### Alias #####
# System
# https://github.com/ohmyzsh/ohmyzsh/blob/c690f731618959cba3b85500acee20ebf43e51c1/lib/key-bindings.zsh#L90
bindkey "^[[3~" delete-char

# Directory
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias cat="bat"
alias ls="eza --color=always --all --icons=always"
alias ll="eza --color=always --all --long --icons=always"
# Docker
alias dps="docker ps --all"
alias di="docker images --all"
alias dx="docker exec --interactive --tty"
# Kubernetes
alias k="kubectl"
# Python
alias pip="uv pip"
alias create_venv="uv venv --python 3.12"
alias activate_venv="source .venv/bin/activate"
alias pip_install="uv pip install --requirements requirements.txt"

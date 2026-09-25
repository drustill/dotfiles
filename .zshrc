eval "$(/opt/homebrew/bin/brew shellenv)"
export EDITOR='vim'
export CLICOLOR=1

PS1='%F{cyan}%~%f$ '

typeset -U path
path=("$HOME/.local/bin" "$HOME/.cargo/bin" $path /usr/local/go/bin)

[[ -r ~/.zsh_aliases ]] && source ~/.zsh_aliases
[[ -r ~/.zsh.local ]] && source ~/.zsh.local

bindkey -e

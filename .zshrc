eval "$(/opt/homebrew/bin/brew shellenv)"
export EDITOR='vim'
export CLICOLOR=1

PS1='%F{cyan}%~%f$ '
[[ -r ~/.zsh_aliases ]] && source ~/.zsh_aliases

export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH=/Users/dstill/.foreman/bin:/opt/rbx/infosec/safe-git-push:/Users/dstill/.local/bin/:/Users/dstill/.local/bin/:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/pkg/env/global/bin:/Users/dstill/.cargo/bin:/Applications/iTerm.app/Contents/Resources/utilities
export PATH=/Users/dstill/git/roblox/game-engine/Tools/Util:$PATH

export PATH="$PATH:$(go env GOPATH)/bin"

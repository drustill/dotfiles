# Better ls
alias ls='eza -a'
alias ll='eza -l'

set -g fish_key_bindings fish_vi_key_bindings
set -g fish_greeting

# =============
# Abbreviations
# =============

# -- Repo
abbr -a dotfiles "git --git-dir=$HOME/.cfg --work-tree=$HOME"

# -- LLM
abbr -a --set-cursor lm -- 'llm "%   "'
abbr -a --set-cursor lb -- 'pbpaste | llm "%   "'

# -- Postgres
abbr -a psql -- 'psql -h $PGHOST -U postgres -d postgres'

# -- Git
abbr -a brd -- git branch --merged dev | grep -v '^\*' | grep -v 'main' | xargs -n 1 git branch -d
abbr -a st -- 'git status'

# -- Python
abbr -a vpy -- 'python -m venv venv && source venv/bin/activate.fish && clear && which pip && python --version'
abbr -a mkpy -- 'mkdir -p $argv && cd $argv && vpy'

# -- NPM
abbr -a --set-cursor='%' -- ntypm 'npm i --save-dev @types/%'

# -- Docker @TODO
# abbr -a -- 'docker-compose up -d'
# abbr -a -- 'docker-compose down'
# abbr -a -- 'docker ps'

# =============
# Environment
# =============
#
set -gx XDG_CONFIG_HOME "$HOME/.config"

# -- Node, PNPM
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

set -gx NVM_DEFAULT_CURRENT lts
nvm use 20.15.0 >> /dev/null

# -- Shell
set -gx STARSHIP_SHELL "fish"
set -gx STARSHIP_CONFIG "$XDG_CONFIG_HOME/starship/starship.toml"
set -gx HOMEBREW_NO_ENV_HINTS 1

# -- $PATH
set -gx EZA_CONFIG_DIR "$XDG_CONFIG_HOME/eza"
set -gx SCRIPT_LIB "$HOME/scripts"
fish_add_path "$SCRIPT_LIB/bin"


# =============
# Starship Prompt

# Remove default mode prompt
builtin functions -e fish_mode_prompt

# Virtualenv breaks starship prompt
set -g VIRTUAL_ENV_DISABLE_PROMPT 1

# Set up the session key that will be used to store logs
# We don't use `random [min] [max]` because it is unavailable in older versions of fish shell
set -gx STARSHIP_SESSION_KEY (string sub -s1 -l16 (random)(random)(random)(random)(random)0000000000000000)

starship init fish | source

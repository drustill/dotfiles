#!/bin/bash
# setup.sh — clean dotfiles installer with logging and fish

set -euo pipefail

LOGFILE="$HOME/setup.log"
exec 3>&1  # Save stdout
exec >"$LOGFILE" 2>&1  # Redirect all output to log

log() { printf "\e[1;32m✔\e[0m %s\n" "$1" >&3; }
fail() { printf "\e[1;31m✘\e[0m %s\n" "$1" >&3; exit 1; }

log "Beginning dotfiles setup. Logging to $LOGFILE"

# Copy ~/dotfiles/.config to ~/.config
if [ -d "$HOME/.cfg" ]; then
  log "Using bare repo — skipping .config copy."
else
  echo "Copying dotfiles to ~/.config..." >&3
  mkdir -p ~/.config
  cp -r ~/dotfiles/.config/* ~/.config/ \
    && log "Copied dotfiles to ~/.config." \
    || fail "Failed to copy dotfiles."
fi

# Copy .vimrc to home
if [ -f "$HOME/dotfiles/.config/vim/.vimrc" ]; then
  cp "$HOME/dotfiles/.config/vim/.vimrc" "$HOME/.vimrc" \
    && log "Copied .vimrc to home directory." \
    || fail "Failed to copy .vimrc."
else
  log ".vimrc not found in dotfiles — skipping."
fi

# Install vim-plug
PLUG_VIM="$HOME/.vim/autoload/plug.vim"
if [ ! -f "$PLUG_VIM" ]; then
  log "Installing vim-plug..." >&3
  curl -fLo "$PLUG_VIM" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && log "vim-plug installed." || fail "Failed to install vim-plug."
else
  log "vim-plug already installed."
fi

# log "Installing Vim plugins..." >&3
# vim -V3 -E -u NONE \
#   -c "source ~/.vim/autoload/plug.vim" \
#   -c "source ~/.vimrc" \
#   -c "PlugInstall" \
#   -c "qall" \
#   && log "Vim plugins installed." \
#   || fail "Failed to install Vim plugins. Check $LOGFILE for details."

# Fish install
if ! command -v fish &>/dev/null; then
  echo "Installing Fish..." >&3
  sudo apt-get install -y fish \
    && log "Fish installed." || fail "Failed to install Fish."
  # Set fish as default shell
  chsh -s "$(which fish)" \
    && log "Fish set as default shell." || fail "Failed to set Fish as default shell."
else
  log "Fish already installed."
fi

# Fisher install
if ! fish -c 'functions -q fisher' &>/dev/null; then
  echo "Installing Fisher..." >&3
  fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher' \
    && log "Fisher installed." || fail "Failed to install Fisher."
else
  log "Fisher already installed."
fi

# Bash-based NVM
if [ ! -d "$HOME/.nvm" ]; then
  echo "Installing bash-based nvm..." >&3
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    && log "nvm (bash) installed." || fail "Failed to install nvm (bash)."
else
  log "nvm already installed."
fi

# nvm.fish
if ! fish -c 'functions -q nvm' &>/dev/null; then
  echo "Installing nvm.fish via Fisher..." >&3
  fish -c 'fisher install FabioAntunes/fish-nvm edc/bass' \
    && log "nvm.fish installed." || fail "Failed to install nvm.fish."
else
  log "nvm.fish already installed."
fi

# Rust
# if [ ! -f "$HOME/.cargo/env" ]; then
#   echo "Installing Rust..." >&3
#   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
#     && log "Rust installed." || fail "Failed to install Rust."
# else
#   log "Rust already installed."
# fi

# # eza
# if ! command -v eza &>/dev/null; then
#   echo "Installing eza..." >&3
#   cargo install eza \
#     && log "eza installed." || fail "Failed to install eza."
# else
#   log "eza already installed."
# fi

# Starship
if [ ! -x "$HOME/.local/bin/starship" ]; then
  echo "Installing Starship..." >&3
  mkdir -p ~/.local/bin
  curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin -y \
    && log "Starship installed." || fail "Failed to install Starship."
else
  log "Starship already installed."
fi

log "Setup complete. Log saved to $LOGFILE"

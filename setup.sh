#!/bin/bash
# setup.sh sets up the dotfiles environment

set -e

log() { printf "\e[1;32m✔\e[0m %s\n" "$1"; }
fail() { printf "\e[1;31m✘\e[0m %s\n" "$1" >&2; exit 1; }

# Copy ~/dotfiles/.config to ~/.config
if [ -d "$HOME/.cfg" ]; then
  echo "Using bare repo (dotfiles alias set) — skipping copy."
  exit 0
else
  echo "No dotfiles alias — doing normal copy."
  mkdir -p ~/.config
  cp -r ~/dotfiles/.config/* ~/.config/
fi

# Install fisher if not installed
if ! fish -c 'functions -q fisher'
then
  echo "Fisher not found. Installing..."
  fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher'
else
  echo "Fisher is already installed."
fi

# Install bash based nvm
if [ ! -d "$HOME/.nvm" ]; then
  echo "Installing bash-based nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash &>/dev/null \
    && log "nvm (bash) installed." || fail "Failed to install nvm (bash)."
else
  log "nvm already installed."
fi

# Install nvm.fish if not installed
if ! fish -c 'functions -q nvm'
then
  echo "Installing nvm.fish via Fisher..."
  fish -c 'fisher install FabioAntunes/fish-nvm edc/bass'
else
  echo "nvm.fish already installed."
fi

# Rust + cargo
if [ ! -f "$HOME/.cargo/env" ]; then
  echo "Installing Rust and cargo..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
else
  echo "Rust already installed."
fi

# eza using cargo
if ! command -v eza &> /dev/null; then
  echo "Installing eza..."
  cargo install eza
else
  echo "eza already installed."
fi

# starship
if ! command -v starship &> /dev/null; then
  echo "Installing starship..."
  mkdir -p ~/.local/bin
  curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin -y
else
  echo "Starship already installed."
fi

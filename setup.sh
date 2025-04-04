#!/bin/bash
# setup.sh sets up the dotfiles environment

set -e

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

# Install nvm.fish if not installed
if ! fish -c 'functions -q nvm'
then
  echo "Installing nvm.fish via Fisher..."
  fish -c 'fisher install jorgebucaran/nvm.fish'
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

# starship
if ! command -v starship &> /dev/null; then
  echo "Installing starship..."
  mkdir -p ~/.local/bin
  curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin -y
else
  echo "Starship already installed."
fi

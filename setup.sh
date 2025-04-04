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

# Install fish if not installed
if ! command -v fish &> /dev/null
then
  echo "Fish shell not found. Installing..."
  sudo apt-get install fish -y
else
  echo "Fish shell is already installed."
fi

# Install fisher if not installed
if ! command -v fisher &> /dev/null
then
  echo "Fisher not found. Installing..."
  curl -sL https://git.io/fisher | fish -c 'source && fisher install jorgebucaran/fisher'
else
  echo "Fisher is already installed."
fi

# nvm
if [ ! -d "$HOME/.nvm" ]; then
  echo "Installing nvm..."
  fish -c "fisher install jorgebucaran/nvm.fish"
else
  echo "nvm already installed."
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

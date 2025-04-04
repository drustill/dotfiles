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

# Rust + cargo
if [ ! -f "$HOME/.cargo/env" ]; then
    echo "Installing Rust and cargo..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "Rust already installed."
fi

# nvm
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
else
    echo "nvm already installed."
fi

# starship
if ! command -v starship &> /dev/null; then
    echo "Installing starship..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
else
    echo "Starship already installed."
fi

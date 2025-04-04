#!/bin/bash
# setup.sh sets up the dotfiles environment

# Copy ~/dotfiles/.config to ~/.config
echo "Copying dotfiles to ~/.config..."
mkdir -p ~/.config
cp -r ~/dotfiles/.config/* ~/

# Install fish if not installed
if ! command -v fish &> /dev/null
then
    echo "Fish shell not found. Installing..."
    sudo apt-get install fish -y
else
    echo "Fish shell is already installed."
fi

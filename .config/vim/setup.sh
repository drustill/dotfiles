#!/usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

SOURCE="$(realpath .)"
DESTINATION="$HOME/.vimrc"

echo "Setting up Vim..."

# Move .vimrc to the home directory
if [ -e "$DESTINATION" ] || [ -L "$DESTINATION" ]; then
    echo "Backing up existing .vimrc to .vimrc.bak"
    mv "$DESTINATION" "$DESTINATION.bak"
fi

ln -sf "$SOURCE/.vimrc" "$DESTINATION"

echo "Vim setup complete."

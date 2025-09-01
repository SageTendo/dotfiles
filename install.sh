#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

# Bash
ln -sf "$DOTFILES/bash/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES/bash/.bash_profile" "$HOME/.bash_profile"
ln -sf "$DOTFILES/bash/.bash_completion" "$HOME/.bash_completion"

# Neovim
mkdir -p "$HOME/.config/nvim"
ln -sf "$DOTFILES/nvim/init.vim" "$HOME/.config/nvim/init.vim"

# Vim
ln -sf "$DOTFILES/vim/.vimrc" "$HOME/.vimrc"
ln -sfn "$DOTFILES/vim/.vim" "$HOME/.vim"

# Themes
ln -sfn "$DOTFILES/themes" "$HOME/.themes"

# Install Oh My Bash from GitHub (if not already installed)
if [ ! -d "$HOME/.oh-my-bash" ]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
    echo "✅ Oh My Bash installed from repo"
    
    # Re-run script
    source .bashrc
    ./$DOTFILES/install.sh
else
    echo "ℹ️ Oh My Bash already installed"
fi

# Install Spicetify via official script if not installed
if ! command -v spicetify &> /dev/null; then
    echo "Installing Spicetify..."
    cp -r ~/dotfiles/config/spicetify ~/.config/spicetify
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh)"
    echo "✅ Spicetify installed"

    # Re-run script
    source .bashrc
    ./$DOTFILES/install.sh
else
    echo "ℹ️ Spicetify already installed"
fi

echo "✅ Dotfiles installed successfully"
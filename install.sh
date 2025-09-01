#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

echo "🚀 Starting dotfiles installation..."

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

# Install Oh My Bash
if [ ! -d "$HOME/.oh-my-bash" ]; then
    echo "Installing Oh My Bash..."
    (
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" "" --unattended
    )
    echo "✅ Oh My Bash installed"
else
    echo "ℹ️ Oh My Bash already installed"
fi

# Install Spicetify
if ! command -v spicetify &> /dev/null; then
    echo "Installing Spicetify..."
    mkdir -p "$HOME/.config"
    cp -r "$DOTFILES/config/spicetify" "$HOME/.config/spicetify"
    
    # Run Spicetify installer in a subshell, auto-answer "no" to Marketplace
    (
    # Prevent script from stopping the main shell
    set +e
    curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh \
    | sed '/Do you want to install spicetify Marketplace/,/^fi/d' \
    | sh
    set -e
    )

    # Update paths
    export PATH="$HOME/.spicetify:$PATH"

    # Fix Spotify permissions (Flatpak)
    sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
    sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps
    echo "✅ Spicetify installed"
else
    echo "Spicetify already installed"
fi

exec bash
echo "🎉 Dotfiles installation completed successfully!"

#!/bin/bash

# Create directories in the Home folder
echo "Creating default directories in the Home folder..."
cd ~ && mkdir -p Documents Downloads Repos Work Development

# Update and upgrade system
echo "Updating and upgrading system..."
sudo apt update && sudo apt upgrade -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y build-essential procps curl file git zsh

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    sudo chsh -s $(which zsh) $USER
else
    echo "Oh My Zsh is already installed."
fi

# Install Homebrew
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.zshrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed."
fi

# Install NVM via Homebrew
if ! brew list nvm &>/dev/null; then
    echo "Installing NVM via Homebrew..."
    brew install nvm
    mkdir -p ~/.nvm
else
    echo "NVM is already installed."
fi

# Install zsh-syntax-highlighting via Homebrew
if ! brew list zsh-syntax-highlighting &>/dev/null; then
    echo "Installing zsh-syntax-highlighting via Homebrew..."
    brew install zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting is already installed."
fi

# Install additional packages
echo "Installing additional packages..."
brew install llvm python neovim tmux fastfetch htop btop ripgrep lazygit go stow

# Setting up Git SSH key
echo "Setting up Git SSH key..."
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    ssh-keygen -t ed25519 -C "your_email@example.com" -f "$HOME/.ssh/id_ed25519" -q -N ""
    echo "SSH key generated successfully!"
else
    echo "SSH key already exists. Skipping key generation."
fi

echo "Your SSH public key is:"
cat ~/.ssh/id_ed25519.pub
echo
echo "Copy this key and add it to your Git hosting service (GitHub, GitLab, etc.)."

# Wait for user confirmation before proceeding
read -p "Press Enter once you have added the SSH key to your Git hosting service..."

# Clone and set up dotfiles
DOTFILES_REPO="git@github.com:brailyguzman/dotfiles.git"
DOTFILES_DIR="$HOME/Dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
    echo "Dotfiles cloned."
else
    echo "Dotfiles repository already exists. Pulling latest changes..."
    git -C "$DOTFILES_DIR" pull
fi

# Backup old .zshrc file
mv ~/.zshrc ~/.zshrc.bak

echo "Symlinking dotfiles using stow..."
cd "$DOTFILES_DIR"
stow .

# Final message
echo "Setup complete! Restart your terminal or run 'exec zsh' to apply changes."

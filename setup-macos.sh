#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting setup..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing Homebrew first..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Updating Homebrew..."
brew update

echo "Installing CLI tools..."
brew install git
brew install python
brew install lua
brew install luarocks
brew install neovim
brew install lazygit
brew install docker
brew install docker-compose

echo "Installing Applications (GUI)..."
brew install --cask pycharm
brew install --cask google-chrome
brew install --cask ghostty
brew install --cask visual-studio-code
brew install --cask spotify
brew install --cask dbeaver-community
brew install --cask bruno

echo "Setup complete!"


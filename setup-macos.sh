#!/bin/bash
#chmod +x setup_my_mac.sh

# ========== TURBO PROFESSIONAL MAC SETUP SCRIPT (CUSTOM LIST) ==========

set -e  # Exit immediately if a command exits with a non-zero status

# --- Helper Functions ---

COLOR_RESET="\033[0m"
COLOR_GREEN="\033[1;32m"
COLOR_YELLOW="\033[1;33m"
COLOR_RED="\033[1;31m"
COLOR_CYAN="\033[1;36m"

function info {
    echo -e "${COLOR_CYAN}[INFO]${COLOR_RESET} $1"
}

function success {
    echo -e "${COLOR_GREEN}[SUCCESS]${COLOR_RESET} $1"
}

function warn {
    echo -e "${COLOR_YELLOW}[WARNING]${COLOR_RESET} $1"
}

function error {
    echo -e "${COLOR_RED}[ERROR]${COLOR_RESET} $1"
}

function install_if_missing {
    if brew list "$1" &>/dev/null || brew list --cask "$1" &>/dev/null; then
        warn "$1 already installed. Skipping."
    else
        info "Installing $1..."
        if [ "$2" == "cask" ]; then
            brew install --cask "$1"
        else
            brew install "$1"
        fi
    fi
}

# --- Check and Install Homebrew ---

if ! command -v brew &>/dev/null; then
    info "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    success "Homebrew already installed."
fi

info "Updating Homebrew..."
brew update

# --- Install CLI Packages ---

info "Installing CLI Tools..."

install_if_missing git
install_if_missing python
install_if_missing lua
install_if_missing luarocks
install_if_missing neovim
install_if_missing lazygit
install_if_missing ripgrep
install_if_missing awscli
install_if_missing terraform
install_if_missing localstack

# --- Install GUI Applications ---

info "Installing Applications (GUI)..."

install_if_missing pycharm cask
install_if_missing google-chrome cask
install_if_missing ghostty cask
install_if_missing visual-studio-code cask
install_if_missing spotify cask
install_if_missing dbeaver-community cask
install_if_missing bruno cask
install_if_missing docker cask
install_if_missing rectangle cask
install_if_missing slack cask


# --- Install Microsoft Apps ---

info "Installing Microsoft Office apps..."

install_if_missing microsoft-outlook cask
install_if_missing microsoft-onenote cask
install_if_missing microsoft-word cask
install_if_missing microsoft-excel cask
install_if_missing microsoft-teams cask


# --- Final Cleanup ---

success "All requested installations completed!"

info "Cleaning up Homebrew cache..."
brew cleanup

success "✅ Your Mac is now fully set up with your selected tools!"
echo ""
success "🚀 All Done. Have an awesome coding session!"


#!/usr/bin/env bash
#
# Script for setting up a new mac machine
#


echo "Setup starting 💻"

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Adding brew to zprofile file
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

# Adding brew to shell environment
eval "$(/opt/homebrew/bin/brew shellenv)"


# Git config
echo "Setting up Git config..."
read -p "Enter your Git name: " git_name
read -p "Enter your Git email: " git_email
git config --global user.name "$git_name"
git config --global user.email "$git_email"
git config --global init.defaultBranch main
git config --global pull.rebase true

# SSH Key
echo "Generating SSH key..."
ssh-keygen -t ed25519 -C "$git_email" -f ~/.ssh/id_ed25519 -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519


PACKAGES=(
    openjdk
    bun
    python3
    uv
    jq
    ngrok
    git
    dockutil
    tree
    wget
    lazydocker
    zsh-autosuggestions
    zsh-syntax-highlighting
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

CLIS=(
    railway
    render
    gh
)

echo "Installing CLIs..."
brew install ${CLIS[@]}

BROWSERS=(
    google-chrome
    arc
    thebrowsercompany-dia
)

echo "Installing browsers apps..."
brew install --cask ${BROWSERS[@]}


COMMUNICATION_TOOLS=(
    slack
    zoom
    telegram
    whatsapp
)

echo "Installing communication tools..."
brew install --cask ${COMMUNICATION_TOOLS[@]}


DEV_TOOLS=(
    sf
    proxyman
    orbstack
    ghostty
)

echo "Installing dev tools..."
brew install --cask ${DEV_TOOLS[@]}

DEV_CLI_TOOLS=(
    herdr
    lazygit
)

echo "Installing dev CLI tools..."
brew install ${DEV_CLI_TOOLS[@]}

UTILITY_APPS=(
    appcleaner
    caffeine
    scroll-reverser
    raycast
    notion
    notion-calendar
    obsidian
    latest
    hiddenbar
    figma
    shottr
    keka
)

echo "Installing utility apps..."
brew install --cask ${UTILITY_APPS[@]}

MULTIMEDIA_APPS=(
    spotify
    vlc
)

echo "Installing multimedia apps..."
brew install --cask ${MULTIMEDIA_APPS[@]}

AI_TOOLS=(
    rtk
    opencode
)

echo "Installing AI tools..."
brew install ${AI_TOOLS[@]}

AI_APPS=(
    wispr-flow
    claude
    chatgpt
    codex
    claude-code
    opencode-desktop
)

echo "Installing AI apps..."
brew install --cask ${AI_APPS[@]}

# Wire herdr into the agent CLIs.
# Each integration expects its agent config directory to already exist,
# which is not the case before the agent has been run once.
echo "Installing herdr integrations..."
mkdir -p "$HOME/.claude" "$HOME/.codex" "$HOME/.config/opencode"
for agent in claude codex opencode; do
    herdr integration install "$agent" || echo "herdr integration install $agent failed, skipping"
done

# Run the herdr server now and at login
brew services start herdr

# Bun global packages
echo "Installing Bun global packages..."
bun add --global typescript ts-node

# Set up Dock
dockutil --remove all
dockutil --add "/Applications/Dia.app"
dockutil --add "/Applications/Notion.app"
dockutil --add "/Applications/Notion Calendar.app"
dockutil --add "/Applications/Ghostty.app"
dockutil --add "/Applications/Spotify.app"
dockutil --add "/Applications/Slack.app"
dockutil --add "/Applications/Obsidian.app"
killall Dock

# macOS System Defaults
echo "Configuring macOS defaults..."

# Set wallpaper
WALLPAPER_URL="https://misc-assets.raycast.com/wallpapers/glaze_1.heic"
WALLPAPER_PATH="$HOME/Pictures/glaze_1.heic"
mkdir -p "$HOME/Pictures"
curl -fsSL "$WALLPAPER_URL" -o "$WALLPAPER_PATH"
osascript -e "tell application \"System Events\" to set picture of every desktop to POSIX file \"$WALLPAPER_PATH\""

# Enable Dark Mode
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

# Disable Siri
defaults write com.apple.assistant.support "Assistant Enabled" -bool false
defaults write com.apple.Siri VoiceTriggerUserEnabled -bool false
defaults write com.apple.Siri StatusMenuVisible -bool false
defaults write com.apple.Siri UserHasDeclinedEnable -bool true

defaults write com.apple.finder AppleShowAllFiles YES
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeatDelay -int 15
defaults write com.apple.finder ShowPathbar -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
killall Siri 2>/dev/null || true
killall SystemUIServer
killall Finder


# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Configure ZSH plugins
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc


#Install Lazy VIM
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

brew upgrade
brew cleanup

echo "Add this SSH key to GitHub:"
cat ~/.ssh/id_ed25519.pub

echo "Setup complete ✅"

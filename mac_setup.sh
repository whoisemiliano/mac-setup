#!/usr/bin/env bash
#
# Script for setting up a new mac machine
#


echo "Setup starting 💻"

# Install Rosetta
sudo softwareupdate --install-rosetta --agree-to-license

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
    openjdk@11
    node
    python3
    jq
    ngrok
    git
    mas
    watchman
    hub
    dockutil
    tree
    wget
    lazydocker
    lazygit
    zsh-autosuggestions
    zsh-syntax-highlighting
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

CLIS=(
    vercel-cli
    render
    gh
)

echo "Installing CLIs..."
brew install ${CLIS[@]}

BROWSERS=(
    google-chrome
    arc
)

echo "Installing browsers apps..."
brew install --cask ${BROWSERS[@]}


API_TOOLS=(
    postman
)

echo "Installing api tools..."
brew install --cask ${API_TOOLS[@]}


COMMUNICATION_TOOLS=(
    slack
    zoom
    telegram
    whatsapp
)

echo "Installing communication tools..."
brew install --cask ${COMMUNICATION_TOOLS[@]}


DEV_TOOLS=(
    fork
    cmux
    sf
    cursor
    tableplus
    proxyman
    orbstack
)

echo "Installing dev tools..."
brew install --cask ${DEV_TOOLS[@]}

OFFICE_APPS=(
    microsoft-auto-update
    microsoft-excel
)

echo "Installing office apps..."
brew install --cask ${OFFICE_APPS[@]}

EMAIL_CLIENTS=(
    superhuman
)

echo "Installing email clients apps..."
brew install --cask ${EMAIL_CLIENTS[@]}

UTILITY_APPS=(
    appcleaner
    caffeine
    scroll-reverser
    raycast
    beyond-compare
    notion
    notion-calendar
    latest
    hiddenbar
    figma
    soqlxplorer
    shottr
    keka
    keystore-explorer
)

echo "Installing utility apps..."
brew install --cask ${UTILITY_APPS[@]}

MULTIMEDIA_APPS=(
    spotify
    vlc
)

echo "Installing multimedia apps..."
brew install --cask ${MULTIMEDIA_APPS[@]}

AI_APPS=(
    wispr-flow
    claude
    chatgpt
    codex
    claude-code
)

echo "Installing AI apps..."
brew install --cask ${AI_APPS[@]}

# npm global packages
echo "Installing npm global packages..."
npm install -g typescript ts-node

#Remove All Items From Dock
dockutil --remove all
killall Dock

#Setup Dock
dockutil --add /Applications/Superhuman.app
dockutil --add /Applications/Notion.app
dockutil --add /Applications/Notion\ Calendar.app
dockutil --add /Applications/Google\ Chrome.app
dockutil --add /Applications/Cursor.app
dockutil --add /Applications/Spotify.app
dockutil --add /Applications/Figma.app
dockutil --add /Applications/Slack.app
dockutil --add /Applications/zoom.us.app
dockutil --add /Applications/Notes.app
killall Dock

# macOS System Defaults
echo "Configuring macOS defaults..."
defaults write com.apple.finder AppleShowAllFiles YES
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeatDelay -int 15
defaults write com.apple.finder ShowPathbar -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
killall Finder


# Setup code path

cat << EOF >> ~/.bash_profile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

cat << EOF >> ~/.zprofile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

# Install VS Code Extensions

code --install-extension salesforce.salesforcedx-vscode-expanded
code --install-extension mechatroner.rainbow-csv
code --install-extension esbenp.prettier-vscode
code --install-extension christian-kohler.path-intellisense
code --install-extension quicktype.quicktype
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension ecmel.vscode-html-css
code --install-extension eamodio.gitlens
code --install-extension sleistner.vscode-fileutils
code --install-extension dbaeumer.vscode-eslint
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension aaron-bond.better-comments
code --install-extension formulahendry.auto-close-tag
code --install-extension vscode-icons-team.vscode-icons
code --install-extension MohithShrivastava.dx-code-companion
code --install-extension VignaeshRamA.sfdx-package-xml-generator
code --install-extension Nik-Creation.lwc-salesforce

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

echo "Setup complete ✅"

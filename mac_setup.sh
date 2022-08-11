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
)

echo "Installing packages..."
brew install ${PACKAGES[@]}


BROWSERS=(
    google-chrome
    firefox
    brave-browser
)

echo "Installing browsers apps..."
brew install --cask ${BROWSERS[@]}


API_TOOLS=(
    postman
    soapui
)

echo "Installing api tools..."
brew install --cask ${API_TOOLS[@]}


COMMUNICATION_TOOLS=(
    google-chat
    slack
    microsoft-teams
    zoom
    telegram
    whatsapp
)

echo "Installing communication tools..."
brew install --cask ${COMMUNICATION_TOOLS[@]}


DEV_TOOLS=(
    fork
    iterm2
    sfdx
    visual-studio-code
)

echo "Installing dev tools..."
brew install --cask ${DEV_TOOLS[@]}

OFFICE_APPS=(
    microsoft-auto-update
    microsoft-excel
    microsoft-powerpoint
    microsoft-word
    microsoft-outlook
)

echo "Installing office apps..."
brew install --cask ${OFFICE_APPS[@]}

UTILITY_APPS=(
    appcleaner
    caffeine
    scroll-reverser
    rectangle
    jumpcut
    istat-menus
    beyond-compare
    notion
    mimestream
    itsycal
    alt-tab
)

echo "Installing utility apps..."
brew install --cask ${UTILITY_APPS[@]}

MULTIMEDIA_APPS=(
    spotify
    vlc
)

echo "Installing multimedia apps..."
brew install --cask ${MULTIMEDIA_APPS[@]}

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

# Install mo-dx-plugin used by Salesforce DX Code Companion VS Code Extension
echo y | sfdx plugins:install mo-dx-plugin

echo "Setup complete ✅"
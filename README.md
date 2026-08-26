<h1 align="center">mac-setup</h1>

<p align="center">
  One command. Fresh Mac. Ready to build.
</p>

<p align="center">
  <img alt="macOS 14+" src="https://img.shields.io/badge/macOS-14%2B-000000?logo=apple&logoColor=white">
  <img alt="Apple Silicon" src="https://img.shields.io/badge/Apple-Silicon-8A2BE2">
  <img alt="Bash" src="https://img.shields.io/badge/shell-Bash-4EAA25?logo=gnubash&logoColor=white">
</p>

An opinionated setup script for turning a new Apple silicon Mac into my development environment.

## ⚡ Quick start

Open Terminal and run:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/whoisemiliano/mac-setup/master/mac_setup.sh)"
```

The script asks for your Git name and email. The rest of the setup runs automatically.

> [!IMPORTANT]
> This script is designed for a fresh Apple silicon Mac running macOS 14 or newer. Review the script before running it on an existing machine.

## 🧰 The toolkit

| Category | Tools |
|---|---|
| Core | OpenJDK (latest), Bun, Python, uv, Git, jq, ngrok, tree, wget |
| Terminal | lazygit, lazydocker, zsh-autosuggestions, zsh-syntax-highlighting |
| CLIs | Railway, Render, GitHub CLI |
| Browsers | Google Chrome, Arc, Dia |
| Communication | Slack, Zoom, Telegram, WhatsApp |
| Development | Ghostty, Proxyman, OrbStack, herdr, Salesforce CLI |
| Productivity | Raycast, Notion, Notion Calendar, Figma, Shottr, Keka |
| Utilities | AppCleaner, Caffeine, Scroll Reverser, Latest, Hidden Bar |
| Media | Spotify, VLC |
| AI | Claude, ChatGPT, Wispr Flow, Codex, Claude Code, OpenCode, RTK |

TypeScript and `ts-node` are also installed globally with Bun.

## ✨ macOS, personalized

The script configures more than development tools:

- Applies the [Glaze wallpaper](https://misc-assets.raycast.com/wallpapers/glaze_1.heic)
- Enables Dark Mode
- Disables Siri and its voice trigger
- Shows hidden files and filename extensions in Finder
- Enables the Finder path bar
- Sets a faster keyboard repeat rate

### Dock

The Dock is cleared and rebuilt in this order:

`Arc` → `Notion` → `Notion Calendar` → `Ghostty` → `Spotify` → `Slack` → `Zoom` → `Notes`

## 🛠️ Developer environment

The setup also:

1. Installs Homebrew and adds it to the shell environment.
2. Configures Git with `main` as the default branch and pull rebasing enabled.
3. Generates an Ed25519 SSH key and adds it to the SSH agent.
4. Installs Oh My Zsh and enables syntax highlighting and autosuggestions.
5. Installs the LazyVim starter configuration.
6. Upgrades installed Homebrew packages and cleans the download cache.

At the end, the script prints the generated SSH public key so it can be added to GitHub.

## 🔐 Permissions

macOS may ask for permission when Terminal controls System Events to apply Dark Mode and the wallpaper. Approve the prompt so those personalization steps can finish.

Rosetta is not installed automatically. If an Intel-only app ever needs it, macOS will offer to install it at that time.

## 🎛️ Make it yours

The package and application lists live in [`mac_setup.sh`](./mac_setup.sh). Add, remove, or reorder entries there to change what gets installed and how the Dock is arranged.

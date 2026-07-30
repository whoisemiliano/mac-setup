# mac-setup

Script to set up a new Apple machine from scratch.

## Run

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/whoisemiliano/mac-setup/master/mac_setup.sh)"
```

> The script will prompt for your Git name and email at the start — everything else runs automatically.

## What it does

- Installs **Rosetta** and **Homebrew**
- Configures **Git** (name, email, default branch, pull rebase)
- Generates an **SSH key** (ed25519) and adds it to the agent
- Installs packages, CLIs, and casks grouped by category:

| Category | Tools |
|---|---|
| Packages | OpenJDK (latest), Bun, Python, uv, Git, jq, ngrok, dockutil, tree, wget, lazygit, lazydocker, and Zsh plugins |
| CLIs | Railway, Render, gh |
| Browsers | Google Chrome, Arc, Dia |
| Communication | Slack, Zoom, Telegram, WhatsApp |
| Dev Tools | Conductor, Fork, Proxyman, OrbStack, cmux, sf |
| Utilities | Raycast, Notion, Notion Calendar, Figma, Shottr, Keka, and more |
| Multimedia | Spotify, VLC |
| AI Apps & Tools | Claude, ChatGPT, Wispr Flow, Codex, Claude Code, OpenCode, RTK |

- Sets up the **Dock** with Arc, Notion, Notion Calendar, Fork, Conductor, cmux, Spotify, Slack, Zoom, and Notes
- Downloads and applies the **Glaze wallpaper**
- Enables **Dark Mode** and disables **Siri**
- Applies **macOS defaults** (hidden files, key repeat, path bar, file extensions)
- Installs **OhMyZsh** with `zsh-autosuggestions` and `zsh-syntax-highlighting`
- Installs **LazyVim**
- Installs Bun globals: `typescript`, `ts-node`
- Runs `brew upgrade` and `brew cleanup`
- Prints your **SSH public key** to add to GitHub

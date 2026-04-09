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
| Packages | openjdk, node, python3, git, jq, wget, lazygit, lazydocker, mas, watchman, and more |
| CLIs | vercel, render, gh |
| Browsers | Google Chrome, Arc |
| API Tools | Postman |
| Communication | Slack, Zoom, Telegram, WhatsApp |
| Dev Tools | Cursor, Fork, TablePlus, Proxyman, OrbStack, cmux, sf |
| Office | Microsoft Excel |
| Email | Superhuman |
| Utilities | Raycast, Notion, Notion Calendar, Figma, Shottr, Keka, and more |
| Multimedia | Spotify, VLC |
| AI Apps | Claude, ChatGPT, Wispr Flow, Codex, Claude Code |

- Sets up the **Dock** with a curated app list
- Applies **macOS defaults** (hidden files, key repeat, path bar, file extensions)
- Configures the **Cursor** CLI path
- Installs **OhMyZsh** with `zsh-autosuggestions` and `zsh-syntax-highlighting`
- Installs **LazyVim**
- Installs npm globals: `typescript`, `ts-node`
- Runs `brew upgrade` and `brew cleanup`
- Prints your **SSH public key** to add to GitHub

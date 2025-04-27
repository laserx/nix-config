# Nix Flake Configuration

This repository contains my macOS system configuration managed using Nix Flakes.

## Overview

This repository uses Nix Flakes to manage macOS (Darwin) system and user environment configurations, including:
- macOS (Darwin) system configuration (`systems/`)
- Home-manager user environment configuration (`homes/`)
- Reusable configuration modules (`modules/`)

## Getting Started

### Prerequisites

- macOS system
- [Nix](https://determinate.systems/nix-installer/) installed (Determinate Systems installer recommended)
- [Flakes feature](https://nixos.wiki/wiki/Flakes) enabled (usually enabled by default with recent Nix versions)

### Installation and Application

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/laserx/nix-config.git
    ```

2.  **Apply the configuration**:
    ```bash
    flake switch --pick --show-trace
    ```

## Repository Structure

```
.
├── flake.nix         # Flake entry point, defines system and user configurations
├── flake.lock        # Dependency lock file
├── README.md         # Project description
├── systems/          # System-specific configurations (nix-darwin)
│   └── aarch64-darwin/ # macOS ARM architecture
│       └── hizashi/    # Configuration for hostname 'hizashi'
│           └── default.nix
├── homes/            # Home-Manager user configurations
│   └── aarch64-darwin/ # macOS ARM architecture
│       └── laserx@hizashi/ # Configuration for user 'laserx' on host 'hizashi'
│           └── default.nix
└── modules/          # Reusable configuration modules
    ├── darwin/       # nix-darwin system modules
    │   ├── dock/
    │   └── homebrew/
    └── home/         # Home-Manager modules
        ├── atuin/
        ├── bat/
        ├── bottom/
        ├── direnv/
        ├── eza/
        ├── fastfetch/
        ├── fish/
        ├── ghostty/
        ├── git/
        ├── gittools/ # Includes gitui, git-cliff, gh
        ├── nixvim/
        │   └── plugins/ # NixVim plugin examples
        │       ├── lualine/
        │       └── which-key/
        ├── starship/
        ├── tmux/
        ├── yazi/
        ├── zoxide/
        └── zsh/
```

## Included Configuration Modules

### System Modules (`modules/darwin/`)
- **Dock**: Customize macOS Dock settings.
- **Homebrew**: Manage Homebrew packages and Casks via Nix.

### User Modules (`modules/home/`)
- **Shells & Prompts**: Fish, ZSH, Starship
- **Terminal Tools**: Tmux, Ghostty (modern terminal), Atuin (shell history sync)
- **Filesystem & Preview**: Eza (ls alternative), Yazi (terminal file manager), Bat (cat alternative), Zoxide (smarter cd)
- **Version Control**: Basic Git configuration, GitUI (TUI Git client), Git-Cliff (changelog generator), GH (GitHub CLI)
- **Editor**: NixVim (configure Neovim using Nix)
  - Plugin Examples: Lualine (status line), Which-Key (keybinding hints)
- **System Monitoring & Info**: Bottom (htop alternative), Fastfetch (system information)
- **Development**: Direnv (directory-specific environments)

## Resource Links

- [Nix Manual](https://nixos.org/manual/nix/stable/)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Nix Flakes Wiki](https://nixos.wiki/wiki/Flakes)
- [nix-darwin Documentation](https://github.com/LnL7/nix-darwin)
- [sops-nix Project](https://github.com/Mic92/sops-nix)

## License

This project is licensed under the [MIT License](./LICENSE).

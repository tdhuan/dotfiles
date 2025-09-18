# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managed using GNU Stow for macOS and Ubuntu systems. The configuration includes Neovim setups (both `nvim` and `lzvim`), shell configurations, terminal emulator settings (Kitty and WezTerm), and development environment tools.

## Architecture

- **Root level**: Contains platform-specific Makefiles and the main bootstrap script
- **Module structure**: Each tool/application has its own directory (`nvim/`, `lzvim/`, `zsh/`, `kitty/`, `wezterm/`, `tmux/`)  
- **OS-specific configs**: `macos/` and `ubuntu/` directories contain platform-specific scripts and Makefiles
- **Stow integration**: Each module directory contains the actual config files that get symlinked to their target locations

### Key Components

- **nvim/**: Basic Neovim configuration with Lua-based setup (`config/` and `plugins/` subdirs)
- **lzvim/**: Enhanced Neovim setup with additional plugins including Copilot integration
- **bootstrap.sh**: Source-safe script that creates directories and installs essential tools (`bat`, `ripgrep`, `stow`)
- **Platform Makefiles**: Different stow targets for macOS vs Ubuntu systems

## Common Commands

### Initial Setup
```bash
git clone https://github.com/tdhuan/dotfiles.git && cd dotfiles && source bootstrap.sh && make all
```

### macOS (root Makefile)
```bash
make all      # Stow lzvim, nvim, kitty configs to ~/.config, wezterm and zsh to home
make delete   # Remove all symlinks
```

### Ubuntu (ubuntu/Makefile)  
```bash
cd ubuntu && make create  # Stow lzvim, kitty to ~/.config, wezterm, zsh, tmux to home
cd ubuntu && make delete  # Remove Ubuntu symlinks
bash ubuntu/bootstrap.sh  # Install bat via apt
```

### Testing/Validation
- Launch `nvim` and verify plugins load correctly
- Start new Zsh session to test aliases and themes
- Open Kitty to verify configuration is applied
- Open WezTerm to verify `.wezterm.lua` is loaded from home directory
- Test stow operations with dry run: `stow -n -t ~ zsh`

## Development Guidelines

### Code Style
- **Shell scripts**: Use `bash` with `set -euo pipefail`, prefer functions, 2-space indentation
- **Lua (Neovim)**: Format with `stylua` using the `stylua.toml` files in each Neovim directory:
  - Indent: 2 spaces
  - Column width: 120 characters
- **Directory naming**: lowercase, OS-specific configs in `macos/` or `ubuntu/`

### File Organization
- Dotfiles within module folders keep their leading dot (e.g., `zsh/.zshrc`, `wezterm/.wezterm.lua`)
- Each Neovim config (`nvim/`, `lzvim/`) has separate `lua/config/` and `lua/plugins/` directories
- WezTerm config follows official docs: `.wezterm.lua` in home directory (not `.config/wezterm/`)
- Platform-specific bootstrapping handled in dedicated OS directories

### Security
- Never commit secrets or tokens
- Review shell scripts before execution as they modify system defaults
- Test configurations in safe environments before applying to main system

## Important Files

- `AGENTS.md`: Contains comprehensive repository guidelines including build commands, coding style, and testing procedures
- `bootstrap.sh`: Creates essential directories and installs core tools via Homebrew/apt
- `stylua.toml`: Lua formatting configuration (present in both nvim dirs)
- Platform-specific Makefiles with different stow targets for macOS vs Ubuntu
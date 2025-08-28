#!/bin/bash
set -euo pipefail

echo "Create workspaces directory"
mkdir -p "$HOME/workspaces" && echo "Created workspaces directory" || { echo "Failed to create workspaces directory" >&2; exit 1; }
echo "Create testing directory"
mkdir -p "$HOME/testing" && echo "Created testing directory" || { echo "Failed to create testing directory" >&2; exit 1; }
echo "Create learning directory"
mkdir -p "$HOME/learning" && echo "Created learning directory" || { echo "Failed to create learning directory" >&2; exit 1; }
echo "Create ~/.config/lzvim directory"
mkdir -p "$HOME/.config/lzvim" && echo "Created ~/.config/lzvim directory" || { echo "Failed to create ~/.config/lzvim directory" >&2; exit 1; }
echo "Create ~/.config/nvim directory"
mkdir -p "$HOME/.config/nvim" && echo "Created ~/.config/nvim directory" || { echo "Failed to create ~/.config/nvim directory" >&2; exit 1; }
echo "Create ~/.config/kitty directory"
mkdir -p "$HOME/.config/kitty" && echo "Created ~/.config/kitty directory" || { echo "Failed to create ~/.config/kitty directory" >&2; exit 1; }
echo "Create screenshots directory"
mkdir -p "$HOME/screenshots" && echo "Created screenshots directory" || { echo "Failed to create screenshots directory" >&2; exit 1; }
echo "Install bat"
brew install bat && echo "Installed bat" || { echo "Failed to install bat" >&2; exit 1; }
echo "Install ripgrep"
brew install ripgrep && echo "Installed ripgrep" || { echo "Failed to install ripgrep" >&2; exit 1; }
echo "Install stow"
brew install stow && echo "Installed stow" || { echo "Failed to install stow" >&2; exit 1; }

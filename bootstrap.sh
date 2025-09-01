#!/bin/bash
set -euo pipefail

create_dir() {
  local dir="$1"
  echo "Create ${dir} directory"
  mkdir -p "${dir}" && echo "Created ${dir} directory" || { echo "Failed to create ${dir} directory" >&2; exit 1; }
}

install_pkg() {
  local pkg="$1"
  echo "Install ${pkg}"
  brew install "${pkg}" && echo "Installed ${pkg}" || { echo "Failed to install ${pkg}" >&2; exit 1; }
}

directories=(
  "$HOME/workspaces"
  "$HOME/testing"
  "$HOME/learning"
  "$HOME/.config/lzvim"
  "$HOME/.config/nvim"
  "$HOME/.config/kitty"
  "$HOME/screenshots"
)

for dir in "${directories[@]}"; do
  create_dir "$dir"
done

packages=(bat ripgrep stow)

for pkg in "${packages[@]}"; do
  install_pkg "$pkg"
done


#!/bin/bash
set -euo pipefail

create_dir() {
  local dir="$1"
  echo "Create ${dir} directory"
  if mkdir -p "${dir}"; then
    echo "Created ${dir} directory"
  else
    echo "Failed to create ${dir} directory" >&2
    exit 1
  fi
}

install_pkg() {
  local pkg="$1"
  echo "Install ${pkg}"

  # Skip if already installed
  if brew list --formula --versions "${pkg}" >/dev/null 2>&1; then
    echo "Already installed ${pkg}"
    return 0
  fi

  if brew install "${pkg}"; then
    echo "Installed ${pkg}"
  else
    echo "Failed to install ${pkg}" >&2
    exit 1
  fi
}

# Ensure Homebrew is available
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Please install from https://brew.sh and re-run." >&2
  exit 1
fi

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

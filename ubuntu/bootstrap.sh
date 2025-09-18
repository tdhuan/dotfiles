#!/bin/bash

# Detect if this script is being sourced (supports bash and zsh)
_UBUNTU_BOOTSTRAP_SOURCED=0
if [ -n "${ZSH_EVAL_CONTEXT:-}" ]; then
  case $ZSH_EVAL_CONTEXT in *:file) _UBUNTU_BOOTSTRAP_SOURCED=1;; esac
elif [ -n "${BASH_SOURCE:-}" ]; then
  # shellcheck disable=SC2128
  if [ "${BASH_SOURCE[0]:-}" != "$0" ]; then _UBUNTU_BOOTSTRAP_SOURCED=1; fi
fi

# Only enforce strict mode when executed directly, not when sourced
if [ "$_UBUNTU_BOOTSTRAP_SOURCED" -eq 0 ]; then
  set -euo pipefail
fi

fail() {
  local code=${1:-1}
  if [ "$_UBUNTU_BOOTSTRAP_SOURCED" -eq 1 ]; then
    return "$code"
  else
    exit "$code"
  fi
}

create_dir() {
  local dir="$1"
  echo "Create ${dir} directory"
  if [ -d "${dir}" ]; then
    echo "Already created ${dir} directory"
    return 0
  fi
  if mkdir -p "${dir}"; then
    echo "Created ${dir} directory"
  else
    echo "Failed to create ${dir} directory" >&2
    fail 1
  fi
}

install_pkg() {
  local pkg="$1"
  echo "Install ${pkg}"

  # Already installed?
  if dpkg -s "${pkg}" >/dev/null 2>&1; then
    echo "Already installed ${pkg}"
    return 0
  fi

  if sudo apt-get install -y "${pkg}"; then
    echo "Installed ${pkg}"
  else
    echo "Failed to install ${pkg}" >&2
    fail 1
  fi
}

main() {
  # Ensure apt-get exists
  if ! command -v apt-get >/dev/null 2>&1; then
    echo "apt-get not found. This script targets Ubuntu/Debian." >&2
    return 1
  fi

  # Create common directories
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
    create_dir "$dir" || return 1
  done

  # Update package lists once
  echo "Update apt package lists"
  if ! sudo apt-get update; then
    echo "Failed to update package lists" >&2
    return 1
  fi

  # Install base tool(s) for Ubuntu
  # Note: On Ubuntu/Debian, the 'bat' binary is named 'batcat'.
  packages=(bat ripgrep stow)
  for pkg in "${packages[@]}"; do
    install_pkg "$pkg" || return 1
  done
}

if [ "$_UBUNTU_BOOTSTRAP_SOURCED" -eq 0 ]; then
  main "$@"
else
  main "$@" || return $?
fi

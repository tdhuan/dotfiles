#!/bin/bash

# Detect if this script is being sourced (supports bash and zsh)
_BOOTSTRAP_SOURCED=0
if [ -n "${ZSH_EVAL_CONTEXT:-}" ]; then
  case $ZSH_EVAL_CONTEXT in *:file) _BOOTSTRAP_SOURCED=1;; esac
elif [ -n "${BASH_SOURCE:-}" ]; then
  # shellcheck disable=SC2128 # BASH_SOURCE used intentionally
  if [ "${BASH_SOURCE[0]:-}" != "$0" ]; then _BOOTSTRAP_SOURCED=1; fi
fi

# Only enforce strict mode when executed directly, not when sourced
if [ "$_BOOTSTRAP_SOURCED" -eq 0 ]; then
  set -euo pipefail
fi

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

fail() {
  # Exit if executed directly; return if sourced
  local code=${1:-1}
  if [ "$_BOOTSTRAP_SOURCED" -eq 1 ]; then
    return "$code"
  else
    exit "$code"
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
    fail 1
  fi
}

# Ensure Homebrew is available
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Please install from https://brew.sh and re-run." >&2
  fail 1
fi

main() {
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

  packages=(bat ripgrep stow)

  for pkg in "${packages[@]}"; do
    install_pkg "$pkg" || return 1
  done
}

# Execute when run directly; when sourced, run and return status without exiting the shell
if [ "$_BOOTSTRAP_SOURCED" -eq 0 ]; then
  main "$@"
else
  main "$@" || return $?
fi

# Repository Guidelines

## Project Structure & Module Organization
- Root: dotfiles managed via GNU Stow (`stow`).
- `zsh/`, `tmux/`, `kitty/`: user shell and terminal configs (symlinked into `$HOME`).
- `nvim/` and `lzvim/`: Neovim configs (Lua), each with its own `stylua.toml`.
- `macos/` and `ubuntu/`: OS-specific scripts and Makefiles.
- `bootstrap.sh`: creates common folders and installs base tools (Homebrew).

## Build, Test, and Development Commands
- `make all` (macOS): stows `lzvim`, `nvim`, `kitty`, and `zsh` into the correct targets.
- `make delete` (macOS): unstows configs (use when reverting/cleaning).
- `cd ubuntu && make create`: stows `lzvim`, `kitty`, `zsh`, `tmux` for Ubuntu.
- `cd ubuntu && make delete`: unstows Ubuntu symlinks.
- `source bootstrap.sh`: create directories and install `bat`, `ripgrep`, `stow` via Homebrew.
- `bash ubuntu/bootstrap.sh`: install `bat` via `apt` on Ubuntu.

## Coding Style & Naming Conventions
- Shell: `bash` with `set -euo pipefail`; prefer functions, 2‑space indent.
- Lua (Neovim): format with `stylua` using repo `stylua.toml` files.
- Directories: lowercase; OS-specific config in `macos/` or `ubuntu/`.
- Dotfiles inside module folders keep leading dot (e.g., `zsh/.zshrc`).

## Testing Guidelines
- No automated tests. Validate manually:
  - Launch `nvim` and confirm plugins/settings load.
  - Start a new Zsh session and confirm aliases and theme.
  - Open Kitty and verify `kitty/kitty.conf` is applied.
  - For macOS tweaks, run `bash macos/.macos` and verify behavior.

## Commit & Pull Request Guidelines
- Commits: short, imperative subject; optionally use type prefixes (e.g., `refactor:`, `fix:`). Example: `fix: correct zsh alias path`.
- PRs: include purpose, OS target (macOS/Ubuntu), affected modules, manual verification steps/output, and screenshots when UI is impacted.
- Avoid bundling unrelated tooling changes; keep stow targets and scripts in separate commits.

## Security & Configuration Tips
- Do not commit secrets or tokens; prefer environment variables and local overrides.
- Review `.zshrc` and OS scripts before stowing/running; these change shell behavior and system defaults.
- When unsure, test with `stow -n` (dry run) before applying: `stow -n -t ~ zsh`.


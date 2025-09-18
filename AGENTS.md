# Repository Guidelines

## Project Structure & Module Organization
- Root dotfiles are stowed into \$HOME using GNU Stow; each module (e.g., `zsh/`, `tmux/`, `kitty/`) mirrors the target directory layout, so files keep their leading dots inside module folders.
- `nvim/` and `lzvim/` hold separate Neovim Lua configs, each with its own `stylua.toml`; keep shared logic duplicated only when absolutely necessary.
- OS-specific bootstrapping lives in `macos/` and `ubuntu/`; run scripts from the correct directory so they reference relative paths correctly.
- Helper scripts like `bootstrap.sh` create common folders and install base tooling; review before executing on a new machine.

## Build, Test, and Development Commands
- `make all` (macOS): stows `lzvim`, `nvim`, `kitty`, and `zsh` into the home directory.
- `make delete` (macOS): unstows the above modules to reset the environment.
- `cd ubuntu && make create`: stows the Ubuntu targets (`lzvim`, `kitty`, `zsh`, `tmux`).
- `cd ubuntu && make delete`: removes Ubuntu symlinks safely.
- `source bootstrap.sh` (macOS) or `bash ubuntu/bootstrap.sh` (Ubuntu): install required CLI tools (`bat`, `ripgrep`, `stow`).
- Use `stow -n -t ~ <module>` for dry-run validation before writing symlinks.

## Coding Style & Naming Conventions
- Shell scripts should use `bash`, start with `set -euo pipefail`, prefer functions, and indent with two spaces.
- Lua files are formatted with `stylua` using each config’s local `stylua.toml`; keep modules lowercase and align with Neovim’s runtime paths.
- Preserve directory kebab case and keep dotfiles named with their leading dot inside module folders (e.g., `zsh/.zshrc`).

## Testing Guidelines
- There is no automated suite; validate manually by launching `nvim`, starting a Zsh session, and opening Kitty to confirm configuration loads.
- For macOS defaults, run `bash macos/.macos` in a safe environment and verify system changes before committing.

## Commit & Pull Request Guidelines
- Commit messages are short and imperative; optional prefixes like `fix:` or `refactor:` help categorize intent.
- Pull requests should state purpose, target OS (macOS/Ubuntu), affected modules, and include manual verification steps or screenshots for UI-impacting changes.

## Security & Configuration Tips
- Never commit secrets or host-specific tokens; rely on local overrides.
- Review shell and OS scripts before running them, especially when updating defaults or installing packages.
- When unsure, prefer `stow -n` dry runs and keep unrelated tooling changes in separate commits.

# This file is used for macos
.PHONY: all

all:
	stow -t ~/.config/karabiner karabiner
	stow -t ~/.config/lzvim lzvim
	stow -t ~/.config/nvim nvim
	stow -t ~/.config/kitty kitty
	stow -t ~ wezterm
	stow -t ~ zsh
	stow -t ~ claude

delete:
	stow -D -t ~/.config/karabiner karabiner
	stow -D -t ~/.config/nvim nvim
	stow -D -t ~/.config/kitty kitty
	stow -D -t ~ wezterm
	stow -D -t ~ zsh
	stow -D -t ~ claude

.PHONY: all

all:
	stow -t ~/.config/nvim nvim
	stow -t ~/.config/kitty kitty

delete:
	stow -D -t ~/.config/nvim nvim
	stow -D -t ~/.config/kitty kitty

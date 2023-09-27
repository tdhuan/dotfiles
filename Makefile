.PHONY: all

all:
	stow -t ~/.config/nvim nvim
	stow -t ~/.config/kitty kitty
	stow -t ~ zsh

delete:
	stow -D -t ~/.config/nvim nvim
	stow -D -t ~/.config/kitty kitty
	stow -D -t ~ zsh

for-ubuntu:
	stow -t ~/.config/nvim ubuntu-nvim
	stow -t ~/.config/kitty ubuntu-kitty
	stow -t ~ ubuntu-zsh
	
delete-ubuntu:
	stow -D -t ~/.config/nvim ubuntu-nvim
	stow -D -t ~/.config/kitty ubuntu-kitty
	stow -D -t ~ ubuntu-zsh


.PHONY: create

create:
	stow -t ~/.config/lzvim lzvim
	stow -t ~/.config/nvim nvim
	stow -t ~/.config/kitty kitty
	stow -d .. -t ~/.config/herdr herdr
	stow -t ~ wezterm
	stow -t ~ zsh
	stow -t ~ tmux
	stow -t ~ claude

delete:
	stow -D -t ~/.config/nvim nvim
	stow -D -t ~/.config/kitty kitty
	stow -D -d .. -t ~/.config/herdr herdr
	stow -D -t ~ wezterm
	stow -D -t ~ zsh
	stow -D -t ~ tmux
	stow -D -t ~ claude

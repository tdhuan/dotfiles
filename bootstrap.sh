#!/bin/bash

echo "Create workspaces directory"
mkdir $HOME/workspaces
echo "Create testing directory"
mkdir $HOME/testing
echo "Create learning directory"
mkdir $HOME/learning
echo "Create ~/.config/lzvim directory"
mkdir $HOME/.config/lzvim
echo "Create ~/.config/nvim directory"
mkdir $HOME/.config/nvim
echo "Create ~/.config/kitty directory"
mkdir $HOME/.config/kitty
echo "Create screenshots directory"
mkdir $HOME/screenshots
echo "Install bat"
brew install bat
echo "Install ripgrep"
brew install ripgrep
echo "Install stow"
brew install stow

#!/bin/bash
set -euo pipefail

# install syntax highglighting
# https://github.com/sharkdp/bat

echo "Install bat"
sudo apt install bat && echo "Installed bat" || { echo "Failed to install bat" >&2; exit 1; }

#!/usr/bin/env bash
# Auto-adjust kitty font size based on current screen resolution.
# Requires kitty to be running with remote control enabled and listening on /tmp/kitty.

set -euo pipefail
SOCKET="unix:/tmp/kitty"

# Determine the width of the primary display
if command -v xrandr >/dev/null 2>&1; then
    width=$(xrandr | awk '/\*/ {print $1; exit}' | cut -d'x' -f1)
else
    width=""
fi

# Choose a font size based on the detected width
if [[ -n "$width" ]]; then
    if [[ "$width" -ge 3840 ]]; then
        size=16
    elif [[ "$width" -ge 2560 ]]; then
        size=14
    else
        size=11
    fi
    kitty @ --to "$SOCKET" set-font-size "$size" >/dev/null 2>&1 || true
fi

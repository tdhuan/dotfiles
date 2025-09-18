#!/usr/bin/env bash
# Auto-adjust kitty font size based on current screen resolution.
# Requires kitty to be running with remote control enabled and listening on /tmp/kitty.

set -euo pipefail
SOCKET="unix:/tmp/kitty"

# Default to a comfortable size for the built-in MacBook Retina display
size=13

# Determine the width of the primary display using xrandr when available
if command -v xrandr >/dev/null 2>&1; then
    width=$(xrandr | awk '/\*/ {print $1; exit}' | cut -d'x' -f1)
    if [[ -n "$width" ]]; then
        if [[ "$width" -ge 3840 ]]; then
            size=16
        elif [[ "$width" -ge 1920 ]]; then
            size=14
        fi
    fi
fi

# On macOS, prefer the built-in Retina display font size when detected
if [[ "$(uname -s)" == "Darwin" ]] && command -v system_profiler >/dev/null 2>&1; then
    if system_profiler SPDisplaysDataType 2>/dev/null | grep -q "Built-in Retina"; then
        size=13
    fi
fi

kitty @ --to "$SOCKET" set-font-size "$size" >/dev/null 2>&1 || true

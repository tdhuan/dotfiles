local wezterm = require("wezterm")

local config = {}

-- Color scheme
config.color_scheme = "Atlas (base16)"

-- Font configuration for Ubuntu
config.font = wezterm.font("Iosevka Term", { weight = "Medium" })
config.font_size = 11.0

-- Window configuration
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- Tab bar
config.use_fancy_tab_bar = false
config.tab_max_width = 100

config.default_cursor_style = "BlinkingBar"

-- Disable default key bindings that conflict with vim
config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

-- Scrollback
config.scrollback_lines = 10000

return config

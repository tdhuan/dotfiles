local wezterm = require("wezterm")

local config = {}

-- Color scheme
config.color_scheme = "Palenight (Gogh)"

-- Font configuration
config.font = wezterm.font("Iosevka Term", { weight = "DemiBold" })
config.font_size = 15.0

-- Window configuration
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

config.window_background_opacity = 0.95
config.macos_window_background_blur = 20

-- Tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

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

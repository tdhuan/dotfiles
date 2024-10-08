local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local custom_everforest = require("lualine.themes.everforest")
custom_everforest.insert.a.bg = "#88C0D0"
custom_everforest.command.a.bg = "#fdc8Ec"

lualine.setup({
	options = {
		icons_enabled = true,
		theme = custom_everforest,
    component_separators = "",
    section_separators = "",
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics", { icon = "" } },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

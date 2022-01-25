local status_ok, lua_line = pcall(require, "lualine")
if not status_ok then
	return
end
--cool function for progress
--[[ local progress = function()
local current_line = vim.fn.line(".")
local total_lines = vim.fn.line("$")
-- local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
local chars = { "██", "▇▇", "▆▆", "▅▅", "▄▄", "▃▃", "▂▂", "▁▁", "  " }
local line_ratio = current_line / total_lines
local index = math.ceil(line_ratio * #chars)
return chars[index]
end ]]

local termIcon = function()
	local icon = ""
	return icon
end
------------------------------------------------------------------------------
lua_line.setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox-material",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree", "Starify", "alpha" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{
				"branch",
				icon = "",
			},
			{
				"diff",
				symbols = { added = " ", modified = "ﰣ ", removed = " " },
			},
		},
		lualine_c = {
			"filename",
			{
				"diagnostics",
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
		}, -- finding a way to change diagnostics icon here
		lualine_x = { "filesize", termIcon, "filetype" },
		lualine_y = { { "progress", icon = "" } },
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
	tabline = {
		lualine_a = { "tabs" },
		lualine_b = { "buffers" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = {},
})

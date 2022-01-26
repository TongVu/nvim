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

------------------------------------------------------------------------------
lua_line.setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree", "Starify", "alpha" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			"mode",
			{ "branch", icon = "" },
			"filename",
			{
				"diagnostics",
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				always_visible = false,
			},
		},
		lualine_x = {
			{ "diff", icon = " ", symbols = { added = " ", modified = "ﰣ ", removed = " " } },
			"filetype",
			{ "location", icon = ":" },
		},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {},
		lualine_b = { "tabs", "buffers" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = {},
})

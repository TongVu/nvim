local status_ok, git = pcall(require, "gitsigns")
if not status_ok then
	return
end
-- ■ ● ▎ x  ⏽   |
git.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	keymaps = {
		-- Default keymap options

		noremap = true,
		["n gn"] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'" },
		["n gp"] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'" },
		-- STAGE HUNK
		["n <leader>gs"] = "<cmd>Gitsigns stage_hunk<CR>",
		["v <leader>gs"] = ":Gitsigns stage_hunk<CR>",
		-- UNDO _ RESET HUNK/BUFFER
		["n <leader>gu"] = "<cmd>Gitsigns undo_stage_hunk<CR>",
		["n <leader>gr"] = "<cmd>Gitsigns reset_hunk<CR>",
		["v <leader>gr"] = ":Gitsigns reset_hunk<CR>",
		["n <leader>gR"] = "<cmd>Gitsigns reset_buffer<CR>",
		-- Preview & Blame
		["n <leader>gp"] = "<cmd>Gitsigns preview_hunk<CR>",
		["n <leader>gb"] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
		-- STAGE BUFFER & RESET BUFFER INDEX
		["n <leader>gS"] = "<cmd>Gitsigns stage_buffer<CR>",
		["n <leader>gU"] = "<cmd>Gitsigns reset_buffer_index<CR>",
		-- Text objects
		["o ih"] = ":<C-U>Gitsigns select_hunk<CR>",
		["x ih"] = ":<C-U>Gitsigns select_hunk<CR>",
	},
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})

vim.cmd([[ highlight GitSignsAdd guifg=#8ec07c ]])
vim.cmd([[ highlight GitSignsChange guifg=#2ac3de]])
vim.cmd([[ highlight GitSignsDelete guifg=#fb4939]])

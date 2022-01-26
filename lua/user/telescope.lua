local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local actions = require("telescope.actions")
telescope.setup({
	defaults = {

		prompt_prefix = " ", --🔍 ﲵ
		selection_caret = "  ", -- " "

		path_display = { "smart" },
		file_ignore_patterns = { "node_modules" },
		mappings = {
			i = {
				-- ["<C-n>"] = actions.cycle_history_next,
				-- ["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<Esc>"] = actions.close, -- press Ctrl+c to close

				["<Down>"] = actions.move_selection_next, -- move by up and down keys
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default, -- hit enter to select
				["<C-x>"] = actions.select_horizontal, -- like below
				["<C-v>"] = actions.select_vertical, -- ctrl +v to vertical split + open the file
				["<C-t>"] = actions.select_tab, -- select and open a new tab with the selected file

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-_>
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		current_buffer_fuzzy_find = {
			sorting_strategy = "ascending",
		},
		file_browser = {
			hidden = "true",
		},

		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, --[[ override the generic sorter ]]
			override_file_sorter = true, -- override the file sorter
			case_mose = "smart_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
		},
	},
})
telescope.load_extension("fzf")
telescope.load_extension("projects")
telescope.load_extension("file_browser")

-- TELESCOPE KEY MAPS
-- ================================================================================ --
-- NORMAL MODE
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files()<cr>", opts)
keymap("n", "/", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require'telescope.builtin'.buffers()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)
keymap("n", "<leader>m", "<cmd>lua require'telescope.builtin'.diagnostics({bufnr=0})<cr>", opts)
keymap("n", "<leader>f/", "<cmd>lua require'telescope'.extensions.file_browser.file_browser()<cr>", opts)
keymap("n", "<leader>fp", "<cmd>Telescope projects<cr>", opts)

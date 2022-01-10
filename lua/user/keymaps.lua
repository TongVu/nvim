-- ========================================================================================================================================================== --
-- $HOME/.config/nvim/lua/keymaps.lua
-- ========================================================================================================================================================== --
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- ***************** --
-- ****** Normal *** --
-- ***************** --
-- Better window navigation
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<leader>-", ":vertical resize -5<CR>", opts)
keymap("n", "<leader>=", ":vertical resize +5<CR>", opts)
keymap("n", "<leader><Up>", ":resize -5<CR>", opts)
keymap("n", "<leader><Down>", ":resize +5<CR>", opts)

-- Navigate buffers
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bnext<CR>:bd#<CR>", opts) -- use vim Bbye to delete buffer without messing with layout

-- Move text up and down
keymap("n", "<S-Down>", "<Esc>:m .+1<CR>", opts)
keymap("n", "<S-Up>", "<Esc>:m .-2<CR>", opts)

-- Easier move half page with J and K
keymap("n", "J", "<C-d>", opts)
keymap("n", "K", "<C-u>", opts)

-- Split pane
keymap("n", "<leader>vs", "<C-w>v<cr>", opts)
keymap("n", "<leader>s", "<C-w>s<cr>", opts)

-- TAB navigation
keymap("n", "<leader>t", ":tabnew<cr>", opts)
keymap("n", "<S-l>", ":tabnext<cr>", opts)
keymap("n", "<S-h>", ":tabprev<cr>", opts)

-- Write file (save file)
keymap("n", "<leader>w", ":w<cr>", opts)
-- Source file
keymap("n", "<leader>s.", ":so %<cr>", opts)
-- Faster quit
keymap("n", "<leader>q", ":q<cr>", opts)


-- ***************** --
-- ****** Visual *** --
-- ***************** --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- ***************** --
-- **** Terminal *** --
-- ***************** --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)





-- ================================================================================ --
-- *********************** TELESCOPE KEY MAPS      ******************** --
-- ================================================================================ --
-- NORMAL MODE
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>/", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n","<leader>f/","<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>",{noremap = true})
keymap("n","<leader>fp","<cmd>Telescope projects<cr>",{noremap = true})


-- ================================================================================ --
-- ***********************      NVIM_TREE MAPS                 ******************** --
-- ================================================================================ --
-- NORMAL MODE
keymap("n", "<C-b>", ":NvimTreeToggle<cr>", opts)
keymap("n", "<C-f>", ":NvimTreeFindFile<cr>", opts)
-- nnoremap <leader>r :NvimTreeRefresh<CR> -- Still haven't known what Refresh does



-- ================================================================================ --
-- ***********************      BUFFERS PICKER                 ******************** --
-- ================================================================================ --
-- keymap("n", "<leader>gb", ":BufferLinePick<CR>", opts)

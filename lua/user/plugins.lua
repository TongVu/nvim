-- ========================================================================================================================================================== --
-- $HOME/.config/nvim/lua/plugins.lua
-- ========================================================================================================================================================== --
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local cmd = vim.cmd
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]


return require('packer').startup(function()
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter, still haven't known how to use fast wrap
    use "numToStr/Comment.nvim" -- Easily comment stuff with gcc and gbc
    use "kyazdani42/nvim-web-devicons" -- Icon fonts for everythings
    use 'kyazdani42/nvim-tree.lua' -- File folder explorer
    use 'norcalli/nvim-colorizer.lua' -- colorizer  -- haven't configured it yet

    -- using packer.nvim
    use "moll/vim-bbye" -- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout
    use "nvim-lualine/lualine.nvim" -- show the status line and tabline
    use "lukas-reineke/indent-blankline.nvim" -- indent blankline

    ---- Fast go to Projects
    use "goolord/alpha-nvim"
    use "ahmedkhalf/project.nvim" --[[ provides superior project management - integrated with telescope. haven't known how to use this stuff ]]
    use "lewis6991/impatient.nvim" --[[  Speed up loading Lua modules in Neovim to improve startup time. ]]

    ---- Colorscheme
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    -- use 'morhetz/gruvbox'
    use 'folke/tokyonight.nvim' -- This one is also my go-to colorscheme

    -- ======================================================================== --
    -- These 2 things cmp and snippets go together to have a better experience  --
    -- ======================================================================== --
    --cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- ======================================================================== --
    -- ===============              LSP STACK                   =============== --
    -- ======================================================================== --
    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use 'folke/lsp-colors.nvim' --better lsp color
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
    -- -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- better syntax hightlight
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- ======================================================================== --
    -- ===============            TELESCOPE STACK               =============== --
    -- ======================================================================== --
    use { 'nvim-telescope/telescope.nvim',requires = { {'nvim-lua/plenary.nvim'} }} -- modern and amazing fuzzy finder -- plenary uses for asyncronous
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim ***
    use { "nvim-telescope/telescope-file-browser.nvim" } --Install this to have a Telescope file broswer in nvim editor
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- allows fuzzy find in telescope
    -- Git
    use 'lewis6991/gitsigns.nvim' -- for better icon to dealing with git
    use "akinsho/toggleterm.nvim" -- terminals
end)



local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Color Scheme
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,
	},
	{
		"glepnir/zephyr-nvim",
		requires = { "nvim-treesitter/nvim-treesitter", opt = true },
		lazy = false,
		priority = 1000,
	},
	"nvim-tree/nvim-tree.lua",
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"glepnir/lspsaga.nvim",
	"lewis6991/gitsigns.nvim",
	"akinsho/bufferline.nvim",
	"moll/vim-bbye",
	"akinsho/toggleterm.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"tpope/vim-commentary",
	"theprimeagen/harpoon",
	"windwp/nvim-ts-autotag",
	"MunifTanjim/prettier.nvim",
	{
		"barrett-ruth/live-server.nvim",
		build = "yarn global add live-server",
		config = true,
	},
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-cmp",
		},
		cmd = "Neorg",
	},

	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"onsails/lspkind-nvim",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to
	-- LSP
	"williamboman/mason.nvim",
	"nvim-lua/plenary.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"jose-elias-alvarez/null-ls.nvim",

	-- DAP
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
	},
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	"nvim-telescope/telescope-media-files.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
}
local opts = {
	defaults = {
		lazy = false,
	},
	install = {
		colorscheme = { "catppuccin" },
	},
	ui = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	},
}
require("lazy").setup(plugins, opts)

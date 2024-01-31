-- Bootstrap lazy.nvim
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


-- Actual plugins
local plugins = {
	'nvim-lua/plenary.nvim',

	-- Colorscheme
	{
		"sainnhe/sonokai",
		lazy = true
	},

	-- Essentials for editing
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"tpope/vim-commentary",
	{
		"m4xshen/autoclose.nvim",
		config = function() require("autoclose").setup() end
	},

	-- Space(macs|vim)-like keybinding preview
	"folke/which-key.nvim",

	-- LSP
	require "lsp",

	-- AI helper
	"exafunction/codeium.vim",

	-- Sneak'n'run around in a file
	"justinmk/vim-sneak",

	-- Fuzzy finders
	require "telescope",

	-- Filetree
	require "neotree"
}
local opts = {}

require("lazy").setup(plugins, opts)

-- Lazy.nvim setup
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

-- Main lazy.nvim setup
require("lazy").setup({
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
		end,
	},
	-- LazyVim core and additional plugins
	{
		"LazyVim/LazyVim",
		import = "lazyvim.plugins",
		opts = {
			news = {
				lazyvim = true,
				neovim = true,
			},
		},
	},
	-- Additional LazyVim extras
	{ import = "lazyvim.plugins.extras.linting.eslint" },
	{ import = "lazyvim.plugins.extras.formatting.prettier" },
	{ import = "lazyvim.plugins.extras.lang.typescript" },
	{ import = "lazyvim.plugins.extras.lang.json" },
	{ import = "lazyvim.plugins.extras.lang.tailwind" },
	{ import = "lazyvim.plugins.extras.util.mini-hipatterns" },
	{ import = "lazyvim.plugins.extras.lang.python" },
	{ import = "lazyvim.plugins.extras.lsp.none-ls" },
	{ import = "plugins" }, -- Load all plugins from the plugins directory
	{ import = "lsp" },

	-- You can add other specific configurations or imports here
	checker = { enabled = true, notify = false },
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"rafamadriz/friendly-snippets",
			},
		},
	},
	debug = false,
})

-- Uncomment or modify as necessary based on your setup
-- defaults = {
--    lazy = false,
--    version = false,
-- },
-- dev = {
--    path = "~/.ghq/github.com",
-- },

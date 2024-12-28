return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "obsidian",
					path = "~/Desktop/obsidian",
				},
			},
			disable_frontmatter = true,
			-- templates = {
			-- 	subdir = "templates",
			-- 	date_format = "%Y-%m-%d",
			-- 	time_format = "%H:%M:%S",
			-- },

			mappings = {
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			ui = {
				checkboxes = {},
				bullets = {},
			},
		})
	end,
}

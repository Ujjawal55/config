return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = false,
		keys = function()
			return {}
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.auto_register = false -- Disable automatic registration of mappings
			opts.show_help = false -- Disable the help text in the popup
			opts.triggers = {} -- Disable automatic triggering

			-- You can add a specific trigger if you want, e.g.:
			-- opts.triggers = {"<leader>"}

			-- Optionally, you can set up a keymap to manually trigger Which Key
			vim.keymap.set("n", "<leader>wk", "<cmd>WhichKey<cr>", { desc = "Show Which Key" })
		end,
	},
}

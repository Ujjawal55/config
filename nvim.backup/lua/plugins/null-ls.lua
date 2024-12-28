return {
	"jose-elias-alvarez/null-ls.nvim",
	opts = function(_, opts)
		local null_ls = require("null-ls")
		opts.sources = opts.sources or {} -- Ensure opts.sources is initialized as a table
		vim.list_extend(opts.sources, {
			null_ls.builtins.formatting.google_java_format, -- Java formatter
		})
	end,
}

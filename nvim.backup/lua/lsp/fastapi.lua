return {
	-- LSP configuration for FastAPI
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "basic",
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
								diagnosticMode = "workspace",
								reportGeneralTypeIssues = "warning",
								reportOptionalMemberAccess = "warning",
							},
						},
					},
				},
			},
		},
	},

	-- Treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, {
					"python",
					"json",
					"yaml",
					"toml",
					"markdown",
				})
			end
		end,
	},

	-- Mason configuration
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"pyright",
				"ruff",
				"black",
				"isort",
				"debugpy",
			})
		end,
	},

	-- Linting configuration
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				python = { "ruff" },
			},
		},
	},

	-- Formatting configuration
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				python = { "isort", "black" },
			},
		},
	},

	-- Python LSP enhancement
	{
		"HallerPatrick/py_lsp.nvim",
		config = function()
			require("py_lsp").setup({
				virtual_env_detection = true,
			})
		end,
	},

	-- Debugging support
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap-python",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local dap = require("dap")
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "FastAPI",
					program = "${file}",
					args = {},
					env = {
						PYTHONPATH = "${workspaceFolder}",
					},
					justMyCode = false,
				},
			}
			require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
			require("dapui").setup()
		end,
	},
}

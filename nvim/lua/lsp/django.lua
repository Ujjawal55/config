return {
	-- LSP configuration for Django
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "basic", -- Set to 'basic' to reduce strictness
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
								diagnosticMode = "workspace",
								reportIncompatibleVariableOverride = false, -- Disable specific error
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
				vim.list_extend(opts.ensure_installed, { "python", "html", "css", "javascript", "htmldjango" })
			end
		end,
	},

	-- Mason configuration for installing necessary tools
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "pyright", "ruff", "black", "isort", "djlint" })
		end,
	},

	-- Linting configuration
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				python = { "ruff" },
				htmldjango = { "djlint" },
			},
		},
	},

	-- Formatting configuration
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				python = { "isort", "black" },
				htmldjango = { "djlint" },
			},
		},
	},

	-- Django-specific plugin
	{
		"tweekmonster/django-plus.vim",
		config = function()
			vim.g.django_plus_auto_start_server = 0 -- Example setting, adjust as needed
		end,
	},

	-- Python LSP enhancement
	{
		"HallerPatrick/py_lsp.nvim",
		config = function()
			require("py_lsp").setup()
		end,
	},
	--
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
					name = "Django",
					program = "${workspaceFolder}/manage.py",
					args = { "runserver" },
					django = true,
				},
			}
			require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
			require("dapui").setup()
		end,
	},
}

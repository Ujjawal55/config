return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					quit_on_open = true,
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- set keymaps
		-- local keymap = vim.keymap -- for conciseness
		--
		-- keymap.set("n", "<leader>pf", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		-- keymap.set(
		-- 	"n",
		-- 	"<leader>ef",
		-- 	"<cmd>NvimTreeFindFileToggle<CR>",
		-- 	{ desc = "Toggle file explorer on current file" }
		-- ) -- toggle file explorer on current file
		-- keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		-- keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
		-- if vim.fn.argc(-1) == 0 then
		-- 	vim.cmd("NvimTreeFocus")
		-- end
		-- vim.g.loaded_netrwPlugin = 1
	end,
}
-- return {
--
-- 	{
-- 		"nvim-tree/nvim-tree.lua",
-- 		config = function()
-- 			require("nvim-tree").setup({
-- 				on_attach = function(bufnr)
-- 					local api = require("nvim-tree.api")
--
-- 					local function opts(desc)
-- 						return {
-- 							desc = "nvim-tree: " .. desc,
-- 							buffer = bufnr,
-- 							noremap = true,
-- 							silent = true,
-- 							nowait = true,
-- 						}
-- 					end
--
-- 					-- default mappings
-- 					api.config.mappings.default_on_attach(bufnr)
--
-- 					-- custom mappings
-- 					vim.keymap.set("n", "t", api.node.open.tab, opts("Tab"))
-- 				end,
-- 				actions = {
-- 					open_file = {
-- 						quit_on_open = true,
-- 					},
-- 				},
-- 				sort = {
-- 					sorter = "case_sensitive",
-- 				},
-- 				view = {
-- 					width = 30,
-- 					relativenumber = true,
-- 				},
-- 				renderer = {
-- 					group_empty = true,
-- 				},
-- 				filters = {
-- 					dotfiles = true,
-- 					custom = {
-- 						"node_modules/.*",
-- 					},
-- 				},
-- 				log = {
-- 					enable = true,
-- 					truncate = true,
-- 					types = {
-- 						diagnostics = true,
-- 						git = true,
-- 						profile = true,
-- 						watcher = true,
-- 					},
-- 				},
-- 			})
-- 		end,
-- 	},
-- }
--
--

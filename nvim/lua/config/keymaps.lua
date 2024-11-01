local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- change the keymap of launch lazy plugin
keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { noremap = true, silent = true, desc = "lauch lazy ui" })

keymap.set("n", "x", '"_x')
keymap.set("n", "x", '"_x')

--Modify normal mode key
keymap.set("i", "jj", "<Esc>", opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- greatest remap ever
keymap.set(
	"x",
	"<leader>p",
	[["_dP]],
	{ noremap = true, silent = true, desc = "replace the current text without replacing the buffer" }
)

-- File explorer with NvimTree
-- keymap.set("n", "<Leader>e", ":NvimTreeToggle<Return>", opts)

-- Tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "go to previous  tab" })
keymap.set("n", "<leader>tf", "<cmd>tabew %<CR>", { desc = "open current buffer in new tab" })

-- Split window
keymap.set("n", "<leader>sh", "<C-w>v", { desc = "split horizontally" })
keymap.set("n", "<leader>sv", "<C-w>s", { desc = "split vertically" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "split make equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close the current split" })
-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

-- move content with visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Modified ctrl+d/u
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- chmod , find-replace
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--  toggle the warning given by lsp
keymap.set(
	"n",
	"<leader>td",
	":lua toggle_warnings()<CR>",
	{ silent = true, noremap = true, desc = "toggle the warning" }
)

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

--move to bottom and center
keymap.set("n", "G", "Gzz", { noremap = true, silent = true, desc = "move to bottom and center" })

-- keymap for obsidian
local function insert_markdown_metadata()
	local metadata = [[---
date: ]] .. os.date("%Y-%m-%d") .. "\n" .. [[
tags: 
links: 
---

]]
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(buf, 0, 0, false, vim.split(metadata, "\n"))
end

vim.keymap.set("n", "<leader>ot", function()
	insert_markdown_metadata()
end, { noremap = true, silent = true, desc = "Insert markdown metadata" })

-- keymap for python template
local function insert_python_main()
	local template = [[def main():
    pass

if __name__ == "__main__":
    main()
]]
	-- Get the current buffer
	local buf = vim.api.nvim_get_current_buf()
	-- Get cursor position
	local cursor = vim.api.nvim_win_get_cursor(0)
	local row = cursor[1] - 1 -- Convert to 0-based index

	-- Insert the template at cursor position
	vim.api.nvim_buf_set_lines(buf, row, row, false, vim.split(template, "\n"))

	-- Move cursor to inside the main function (after pass)
	vim.api.nvim_win_set_cursor(0, { row + 2, 4 }) -- +2 for the line after 'def main():', 4 spaces indent
end

vim.keymap.set("n", "<leader>pt", function()
	insert_python_main()
end, { noremap = true, silent = true, desc = "Insert Python main template" })

-- keymap for bash script template

local function bash_template()
	local metadata = [[
#!/bin/bash

# Author: Ujjawal Kumar
# Date of Creation: ]] .. os.date("%Y-%m-%d") .. "\n" .. [[
# Description: 
# Date of Updation: ]] .. os.date("%Y-%m-%d") .. "\n" .. [[

]]
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(buf, 0, 0, false, vim.split(metadata, "\n"))
end

vim.keymap.set("n", "<leader>bt", function()
	bash_template()
end, { noremap = true, silent = true, desc = "bash template" })

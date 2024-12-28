-- setting the gap between the two key command

vim.g.mapleader = " "
vim.opt.guicursor = {
	"n-ci-v:block",
}

vim.opt.statusline = "%=%{strftime('%A, %d %B %Y | %I:%M %p')} | %t%{&modified?' [+]':''}"
vim.opt.laststatus = 2
vim.opt.cmdheight = 1
vim.opt.showmode = true

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""
vim.opt.shortmess:append("F") -- stop the file name directory to appear after the file has been saved

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- python lsp_b_
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff_lsp"

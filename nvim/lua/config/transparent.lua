--this line is responsible for removing the cursorline highlights
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", underline = false })
-- this is used to remove the brackground of the statusline
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "white" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "gray" })

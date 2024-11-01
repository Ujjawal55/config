-- Example from GitHub discussion[6]
function M.colorize()
	vim.wo.number = false
	vim.wo.relativenumber = false
	vim.wo.statuscolumn = ""
	vim.wo.signcolumn = "no"
	local orig_buf = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(orig_buf, 0, -1, false)
	while #lines > 0 and vim.trim(lines[#lines]) == "" do
		lines[#lines] = nil
	end
	local buf = vim.api.nvim_create_buf(false, true)
	vim.keymap.set("n", "i", "<cmd>startinsert<cr>", { silent = true, buffer = buf })
	vim.keymap.set("n", "v", "<cmd>startvisual<cr>", { silent = true, buffer = buf })
	vim.keymap.set("n", "w", "<cmd>normal w<cr>", { silent = true, buffer = buf })
	vim.keymap.set("n", "b", "<cmd>normal b<cr>", { silent = true, buffer = buf })
	vim.keymap.set("n", "0", "<cmd>normal 0<cr>", { silent = true, buffer = buf })
	vim.keymap.set("n", "$", "<cmd>normal $<cr>", { silent = true, buffer = buf })
	vim.keymap.set("n", "x", "<cmd>normal x<cr>", { silent = true, buffer = buf })
	vim.keymap.set("n", "cw", "<cmd>normal cw<cr>", { silent = true, buffer = buf })
	local channel = vim.api.nvim_open_term(buf, {})
	vim.api.nvim_chan_send(channel, table.concat(lines, "\r\n"))
	vim.api.nvim_set_current_buf(buf)
	vim.keymap.set("n", "q", "<cmd>qa!<cr>", { silent = true, buffer = buf })
	vim.api.nvim_create_autocmd("TermEnter", { buffer = buf, command = "stopinsert" })
	vim.defer_fn(function()
		-- go to the end of the terminal buffer
		vim.cmd.startinsert()
	end, 10)
end

require("config.lazy")
require("config.transparent")
vim.o.shell = "/usr/bin/fish"

-- automating the process of showing the diagnostic or not...

vim.g.show_warnings = true -- Initialize the global variable
function _G.toggle_warnings()
	vim.g.show_warnings = not vim.g.show_warnings

	if vim.g.show_warnings then
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			severity_sort = true,
		})
		print("Warnings enabled")
	else
		vim.diagnostic.config({
			virtual_text = {
				severity = { min = vim.diagnostic.severity.ERROR },
			},
			signs = {
				severity = { min = vim.diagnostic.severity.ERROR },
			},
			underline = {
				severity = { min = vim.diagnostic.severity.ERROR },
			},
			severity_sort = true,
		})
		print("Warnings disabled (Errors still visible)")
	end
end

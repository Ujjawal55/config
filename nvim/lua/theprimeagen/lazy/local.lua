local local_plugins = {
    {
        "ThePrimeagen/harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local harpoon_mark = require("harpoon.mark")
            local harpoon_ui = require("harpoon.ui")

            -- Keybindings
            vim.keymap.set("n", "<leader>a", harpoon_mark.add_file)
            vim.keymap.set("n", "<C-e>", harpoon_ui.toggle_quick_menu)

            -- Navigate to marks
            vim.keymap.set("n", "<C-h>", function() harpoon_ui.nav_file(1) end)
            vim.keymap.set("n", "<C-l>", function() harpoon_ui.nav_file(2) end)
            vim.keymap.set("n", "<C-n>", function() harpoon_ui.nav_file(3) end)
            vim.keymap.set("n", "<C-s>", function() harpoon_ui.nav_file(4) end)
        end
    },
    {
        "ThePrimeagen/vim-apm",
        config = function()
            --[[
            local apm = require("vim-apm")

            apm:setup({})
            vim.keymap.set("n", "<leader>apm", function() apm:toggle_monitor() end)
            --]]
        end
    },
    {
        "ThePrimeagen/vim-with-me",
        config = function() end
    },
}

return local_plugins


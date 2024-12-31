-- return {
--     'MeanderingProgrammer/render-markdown.nvim',
--     dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
--     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
--     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
--     ---@module 'render-markdown'
--     ---@type render.md.UserConfig
--     opts = {},
-- }


return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        enabled = true,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
            heading = {
                sign = false,
                icons = { "◈ ", "◇ ", "○ ", "● ", "□ ", "■ " },
                -- Remove both backgrounds and foregrounds to let colorscheme handle it
                backgrounds = {},
                foregrounds = {},
            },
            code = {
                sign = false,
                width = "block",
                right_pad = 2,
            },
            bullet = {
                enabled = true,
            },
        },
    }
}


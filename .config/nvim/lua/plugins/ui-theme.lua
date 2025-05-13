return {
    { "folke/tokyonight.nvim" },
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        opts = {
            italic_comment = true
        },
        config = function(_, opts)
            local theme = require("dracula")
            theme.setup(opts)
        end
    },
    { "rose-pine/neovim", name = "rose-pine" },
    { "nyoom-engineering/oxocarbon.nvim" },
    { "catppuccin/nvim", name = "catppuccin" },
    {
        'andrew-george/telescope-themes',
        dependencies = {
            'nvim-telescope/telescope.nvim'
        },
        keys = {
            { "<leader>uT", "<CMD>Telescope themes<CR>", "Change Theme" }
        },
        config = function()
            require('telescope').load_extension('themes')
        end
    }
}

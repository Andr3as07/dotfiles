return {
    {
        "f-person/git-blame.nvim",
        event = "VeryLazy",
        dependenceis = {
            "folke/snacks.nvim",
        },
        opts = {
            enabled = true,
            delay = 0,
            date_format = "%r",
            virtual_text_column = 80,
            highlight_group = "Question"
        },
        config = function(_, opts)
            Snacks.toggle({
                name = "Git Blame Overlay",
                get = function()
                    return vim.g.gitblame_enabled
                end,
                set = function(state)
                    vim.g.gitblame_enabled = state
                end
            }):map("<leader>uB")

            require("gitblame").setup(opts)
        end
    },
    {
        "FabijanZulj/blame.nvim",
        lazy = false,
        keys = {
            { "<leader>gb", "<CMD>BlameToggle window<CR>", { name = "Git Blame" } }
        },
        config = function(_, opts)
            require("blame").setup({})
        end
    }
}

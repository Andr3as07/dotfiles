return {
    {
        "f-person/git-blame.nvim",
        event = "VeryLazy",
        opts = {
            enabled = true,
            delay = 0,
            date_format = "%r",
            virtual_text_column = 80,
            highlight_group = "Question"
        }
    },
    {
        "folke/snacks.nvim",
        config = function(_, _)
            Snacks.toggle({
                name = "Git Blame Overlay",
                get = function()
                    return vim.g.gitblame_enabled
                end,
                set = function(state)
                    vim.g.gitblame_enabled = state
                end
            }):map("<leader>uB")
        end
    },
    {
        "FabijanZulj/blame.nvim",
        lazy = false,
        keys = {
            { "<leader>gb", "<CMD>BlameToggle window<CR>", { name = "Git Blame" } }
        },
        config = function(opts, _)
            require("blame").setup({})
        end
    }
}

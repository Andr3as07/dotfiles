return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        signs = true, -- show icons in the signs column
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below

        -- keywords recognized as todo comments
        keywords = {
            FIX = {
                icon = " ", -- icon used for the sign, and in search results
                color = "error", -- can be a hex color, or a named color (see below)
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                -- signs = false, -- configure signs for some keywords individually
            },
            NOCOMMIT = { icon = " ", color = "error", alt = { "NO COMMIT", "NOCHECKIN", "NO CHECKIN" } },
            TODO = { icon = " ", color = "info" },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
            TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
    }
}
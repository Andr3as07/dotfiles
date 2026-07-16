return {
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
    { "AlphaTechnolog/pywal.nvim" },
    {
        "zaldih/themery.nvim",
        lazy = false,
        keys = {
            { "<leader>uT", "<CMD>Themery<CR>", desc = "Change Theme" }
        },
        config = function()
            local themes = {}
            local seen = {}
            for _, f in ipairs(vim.fn.globpath(vim.fn.stdpath("data") .. "/lazy/*/colors", "*.{vim,lua}", false, true)) do
                local name = vim.fn.fnamemodify(f, ":t:r")
                if not seen[name] then
                    seen[name] = true
                    table.insert(themes, name)
                end
            end
            require("themery").setup({
                themes = themes,
                livePreview = true
            })
        end
    }
}

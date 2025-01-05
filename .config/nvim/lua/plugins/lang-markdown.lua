return {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    lazy = true,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function (_, _)
        -- NOTE: Fix for https://github.com/epwalsh/obsidian.nvim/issues/286
        vim.api.nvim_create_autocmd({"BufEnter"}, {
            pattern = "*.md",
            callback = function()
                vim.b.saved_conceallevel = vim.opt.conceallevel:get()
                vim.opt.conceallevel = 2
            end
        })

        vim.api.nvim_create_autocmd({"BufLeave"}, {
            pattern = "*.md",
            callback = function()
                if vim.b.saved_conceallevel ~= nil then
                    vim.opt.conceallevel = vim.b.saved_conceallevel
                end
            end
        })


    end
}

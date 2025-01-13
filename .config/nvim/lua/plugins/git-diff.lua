return {
    "sindrets/diffview.nvim",
    keys = {
        { "<leader>gd", function()
            if next(require('diffview.lib').views) == nil then
                vim.cmd('DiffviewOpen')
            else
                vim.cmd('DiffviewClose')
            end
        end, desc = "Diff View" }
    }
}

return {
    "ntpeters/vim-better-whitespace",
    lazy = false,
    keys = {
        { "<leader>ut", "<CMD>ToggleWhitespace<CR>", desc = "Toogle Whitespace" }
    },
    config = function()
        vim.g.better_whitespace_enabled = false
    end
}

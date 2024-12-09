return {
    "smoka7/hop.nvim",
    lazy = false,
    opts = {
        case_insensitive = true
    },
    config = function(_, opts)
        local hop = require("hop")
        hop.setup(opts)

        vim.keymap.set({"n", "v", "o"}, "<A-f>", hop.hint_char2)
        vim.keymap.set({"n", "v", "o"}, "<A-a>", hop.hint_anywhere)
        vim.keymap.set({"n", "v", "o"}, "<A-w>", hop.hint_words)
        vim.keymap.set({"n", "v", "o"}, "<A-l>", hop.hint_lines_skip_whitespace)
    end
}

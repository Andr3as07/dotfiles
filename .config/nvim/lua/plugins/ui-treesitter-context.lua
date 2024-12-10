return {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    opts = {
        multiline_threshold = 5,
        mode = "topline"
    },
    config = function(_, opts)
        local ctx = require("treesitter-context")
        ctx.setup(opts)
        vim.cmd(":hi TreesitterContextBottom gui=underline guisp=Grey")
        vim.cmd(":hi TreesitterContextLineNumberBottom gui=underline guisp=Grey")
    end
}

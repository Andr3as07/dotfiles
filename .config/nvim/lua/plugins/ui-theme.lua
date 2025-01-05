return {
--  {
--      "folke/tokyonight.nvim",
--      lazy = false,
--      priority = 1000,
--      opts = {},
--      config = function()
--          vim.cmd("colorscheme tokyonight")
--      end
--  },
    {

        "Mofiqul/dracula.nvim",
        opts = {
            italic_comment = true
        },
        config = function(opts, _)
            local theme = require("dracula")
            theme.setup(opts)
            vim.cmd("colorscheme dracula")
        end
    },
--  {
--      "nyoom-engineering/oxocarbon.nvim",
--      lazy = false
--  }
}

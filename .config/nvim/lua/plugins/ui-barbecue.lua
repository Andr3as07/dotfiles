return {
    "utilyre/barbecue.nvim",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons"
    },
    opts = {

    },
    keys = {
        { "<leader>uW", function() require("barbecue.ui").toggle() end, desc = "Toggle Winbar" }
    },
    config = function(opts, _)
        require("barbecue").setup(opts)
    end
}

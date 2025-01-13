return {
    "NachoNievaG/atac.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    keys = {
        { "<leader>ta", "<CMD>Atac<CR>", desc = "HTTP Client (Atac)" }
    },
    opts = {},
    config = function(opts, _)
        require("atac").setup(opts)
    end
}

return {
    {
        "mfussenegger/nvim-dap-python",
        lazy = false,
        config = function(_, _)
            require("dap-python").setup("python3")
        end
    }
}

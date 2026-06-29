return {
    {
        "mason-org/mason.nvim",
        keys = {
            { "<leader>tM", "<CMD>Mason<CR>", desc = "Mason" }
        },

        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "clangd",
                "pylsp",
                "gopls",
            }
        }
    },
}

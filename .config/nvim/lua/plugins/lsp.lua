local function on_attach(client, bufnr)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename"})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Definition"})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Implementation"})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = "References"})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover"})
end

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
            "mason-org/mason-lspconfig.nvim"
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "clangd",
                "pylsp"
            }
        }
    },
}

local function on_attach(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename"})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action"})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Definition"})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Implementation"})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = "References"})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover"})
end

return {{
    "williamboman/mason.nvim",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
}, {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"neovim/nvim-lspconfig"},
    opts = {
        ensure_installed = { "lua_ls", "jsonls", "yamlls", "csharp_ls", "gopls", "pylsp", "intelephense", "phpactor" }
    }
}, {
    "neovim/nvim-lspconfig",
    dependencies = {"williamboman/mason-lspconfig.nvim"},
    config = function()
        local lspconfig = require("lspconfig")
        require("mason-lspconfig").setup_handlers({function(server_name)
            lspconfig[server_name].setup {
                on_attach = on_attach
            }
        end})
    end
}}

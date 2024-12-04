local function on_attach(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
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
        ensure_installed = { "lua_ls", "jsonls", "yamlls", "csharp_ls" }
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

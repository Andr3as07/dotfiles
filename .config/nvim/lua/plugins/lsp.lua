local function on_attach(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename"})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action"})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Definition"})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Implementation"})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = "References"})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover"})
end

local function tableMerge(t1, t2)
    if t2 == nil then
        return t1
    end
    for k,v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                tableMerge(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

local specific_configurations = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    }
}

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
                "lua_ls"
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()

            local lspconfig = require("lspconfig")
            local servers = require("mason-lspconfig").get_installed_servers()

            local general_config = {
                on_attach = on_attach
            }

            for _, server in ipairs(servers) do
                local specific_config = specific_configurations[server]
                local config = tableMerge(general_config, specific_config)
                lspconfig[server].setup(config)
            end
        end
    }
}

return {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-calc",
        "f3fora/cmp-spell",
    },
    -- Not all LSP servers add brackets when completing a function.
    -- To better deal with this, LazyVim adds a custom option to cmp,
    -- that you can configure. For example:
    --
    -- ```lua
    -- opts = {
    --   auto_brackets = { "python" }
    -- }
    -- ```
    opts = function()
        -- vim.api.nvim_set_hl(0, "CmpGhostText", {
        --     link = "Comment",
        --     default = true
        -- })
        local cmp = require("cmp")
        local defaults = require("cmp.config.default")()
        local auto_select = true

        vim.opt.spell = true
        vim.opt.spelllang = { "en_us" }

        local kind_icons = {
            Text = "",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰇽",
            Variable = "󰂡",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰅲",
	    Codeium = ""
        }

        return {
	    virtual_text = {
                enabled = true,
	        manual = false
	    },
            auto_brackets = {}, -- configure any filetype to auto add brackets
            completion = {
                completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect")
            },
            preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-n>"] = cmp.mapping.select_next_item({
                    behavior = cmp.SelectBehavior.Insert
                }),
                ["<C-p>"] = cmp.mapping.select_prev_item({
                    behavior = cmp.SelectBehavior.Insert
                }),
                ["<C-Space>"] = cmp.mapping.complete(),
                -- ["<CR>"] = LazyVim.cmp.confirm({
                --     select = auto_select
                -- }),
                -- ["<C-y>"] = LazyVim.cmp.confirm({
                --     select = true
                -- }),
                -- ["<S-CR>"] = LazyVim.cmp.confirm({
                --     behavior = cmp.ConfirmBehavior.Replace
                -- }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<C-CR>"] = function(fallback)
                    cmp.abort()
                    fallback()
                end,
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                -- ["<tab>"] = function(fallback)
                --     return LazyVim.cmp.map({"snippet_forward", "ai_accept"}, fallback)()
                -- end
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
		{ name = "codeium" },
		{ name = "luasnip" },
                { name = "buffer-lines"},
                { name = "path" },
                { name = "buffer" },
                { name = "bufname" },
                { name = 'calc' },
                { name = "spell" },
                { name = 'emoji' }
            }),

            formatting = {
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = (kind_icons[vim_item.kind] or vim_item.kind) -- This will only show the icon if it exists, otherwise it will show the name of the item kind
                    -- Source
                    vim_item.menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[LaTeX]",
			codeium = ""
                    })[entry.source.name] or entry.source.name
                    return vim_item
                end
            },
            
            experimental = {
                -- -- only show ghost text when we show ai completions
                -- ghost_text = vim.g.ai_cmp and {
                --     hl_group = "CmpGhostText"
                -- } or false
                gost_text = {
                    hl_group = true
                }
            },
            sorting = defaults.sorting
        }
    end,
    -- main = "lazyvim.util.cmp"
}

return {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-calc",
        "f3fora/cmp-spell",
        "lukas-reineke/cmp-rg",
        "roginfarrer/cmp-css-variables",
        "pontusk/cmp-sass-variables",
        "mmolhoek/cmp-scss",
        -- "kbwo/cmp-yank",
    },
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
            window = {
                -- completion = cmp.config.window.bordered({}),
                documentation = cmp.config.window.bordered({}),
            },
            -- Set view to follow cursor while typing
            view = {
                entries = {
                    follow_cursor = true,
                },
            },
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
                ['<TAB>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
		        { name = "luasnip" },
                { name = "nvim_lsp" },
		        -- { name = "codeium" },
                { name = "buffer-lines"},
                { name = "css-variables" },
                { name = "scss variables" },
                { name = "sass-variables" },
                { name = "obsidian.nvim" },
                -- { name = "cmp-yank" },
                -- { name = "rg" },
                { name = "path" },
                { name = "buffer" },
                { name = "bufname" },
                { name = "calc" },
                { name = "spell" },
                -- { name = 'emoji' },
            }),

            formatting = {
                fields = { "menu", "abbr", "kind" },
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = (kind_icons[vim_item.kind] or '') .. " " .. vim_item.kind
                    -- Source
                    vim_item.menu = ({
                        nvim_lsp = "󰰍",
                        luasnip = "",
                        buffer = "",
                        path = "",
                        rg = "󰬎",
            			codeium = "",
                        spell = "󰊄",
                        calc = "󰃬"
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
}

return {
    { 'saadparwaiz1/cmp_luasnip' },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        config = function(_, _)
            local ls = require('luasnip')

            ls.config.set_config {
                history = true,
                updateevents = "TextChanged,TextChangedI",
                enable_autosnippets = true,
            }

            -- Backward and forward through insert nodes
            vim.keymap.set({"i", "s"}, "<A-k>", function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })

            vim.keymap.set({"i", "s"}, "<A-j>", function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true })

            -- Cycle through choice nodes
            vim.keymap.set({"i", "s"}, "<A-n>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end
    }
}

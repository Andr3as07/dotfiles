return {
    'catgoose/nvim-colorizer.lua',
    event = "VeryLazy",
    opts = {
        lazy_load = true,
        user_default_options = {
            mode = "virtualtext",
            virtualtext = "⬤"
        }
    },
    config = function(_, opts)
        -- vim.o.termguicolors = true
        require('colorizer').setup(opts)
    end
}

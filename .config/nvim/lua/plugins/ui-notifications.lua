return {
    "rcarriga/nvim-notify",
    lazy = false,
    opts = {
        stages = "fade_in_slide_out",
        render = "compact"
    },
    dependencies = {
        'nvim-telescope/telescope.nvim'
    },
    config = function(_, opts)
        local notify = require("notify")
        notify.setup(opts)
        vim.notify = notify


        local telescope = require("telescope")
        vim.keymap.set("n", "<leader>fn", telescope.extensions.notify.notify, {
            desc = "Show Notifications"
        })
    end
}

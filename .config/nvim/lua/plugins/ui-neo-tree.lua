return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim" -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
        default_component_configs = {
            indent = {
              with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
              expander_collapsed = "",
              expander_expanded = "",
              expander_highlight = "NeoTreeExpander",
            },
            git_status = {
              symbols = {
                unstaged = "󰄱",
                staged = "󰱒",
              },
            },
          },
        filesystem = {
            filtered_items = {
                visible = true, -- This is what you want to see
                hide_dotfiles = false,
                hide_gitignored = false,
            },
            follow_current_file = { enabled = true },
        },
        open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },

    },
    keys = {
        {
            "<leader>fe",
            function()
                require("neo-tree.command").execute({
                    toggle = true,
                    dir = vim.loop.cwd()
                })
            end,
            desc = "Explorer NeoTree"
        },
        {
            "<leader>ge",
            function()
                require("neo-tree.command").execute({
                    toggle = true,
                    source = "git_status"
                })
            end,
            desc = "Git Explorer NeoTree"
        },
        {
        "<leader>be",
            function()
                require("neo-tree.command").execute({
                    source = "buffers",
                    toggle = true
                })
            end,
            desc = "Buffer Explorer NeoTree",
        },
    }
}

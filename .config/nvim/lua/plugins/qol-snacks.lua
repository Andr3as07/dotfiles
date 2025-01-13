return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        scroll = {
            enabled = true
        },
        dim = {
            enabled = true
        },
        input = {
            enabled = true
        },
        bigfile = {
            enabled = true
        },
        notifier = {
            enabled = false
        },
        quickfile = {
            enabled = true
        },
        statuscolumn = {
            enabled = true
        },
        words = {
            enabled = true
        },
        dashboard = {
            enabled = true,
            sections = {
                { section = "header" },
                -- {
                --     pane = 2,
                --     section = "terminal",
                --     -- cmd = "colorscript -e square",
                --     height = 5,
                --     padding = 1,
                -- },
                { section = "keys", gap = 1, padding = 1 },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                { section = "startup" },
            }
        }
    },
    keys = {
        { "<leader>tt", function() Snacks.terminal() end, desc = "Toggle Terminal" },
        { "<leader>gB", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
        { "<leader>.", function() Snacks.scratch() end, desc = "Select Scratch Buffer" }
    }
}

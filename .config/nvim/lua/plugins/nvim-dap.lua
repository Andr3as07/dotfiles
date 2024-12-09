return {
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        dependencies = {
            "jay-babu/mason-nvim-dap.nvim",
            "williamboman/mason.nvim",
        },
        config = function(_, _)
            local dap = require("dap")

            vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Breakpoint' })
            vim.keymap.set('n', '<Leader>dl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "Logpoint" })
            vim.keymap.set('n', '<leader>dc',  dap.continue, { desc = "Continue Debugging" })
            vim.keymap.set('n', '<leader>do', dap.step_over, { desc = "Step Over" })
            vim.keymap.set('n', '<leader>di', dap.step_into, { desc = "Step into" })
            vim.keymap.set('n', '<leader>ds', dap.step_out, { desc = "Step out" }) 
            vim.keymap.set('n', '<Leader>dk', function() dap.close() end, { desc = "Stop Debugging"})

            vim.keymap.set('n', '<F5>',  dap.continue, { desc = "Continue Debugging" })
            vim.keymap.set('n', '<F10>', dap.step_over, { desc = "Step Over" })
            vim.keymap.set('n', '<F11>', dap.step_into, { desc = "Step into" })
            vim.keymap.set('n', '<F12>', dap.step_out, { desc = "Step out" })
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        opts = {},
        config = function(_, opts)
            local dapui = require("dapui")
            dapui.setup(opts)

            vim.keymap.set('n', '<leader>dI', dapui.toggle, { desc = 'Debug Interface' })
        end
    }
}

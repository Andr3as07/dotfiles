return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'searchcount', 'selectioncount' },
            lualine_z = { 'location', 'progress' }
        }
    },
    config = function()
        -- vim.opt.laststatus = 0
        vim.opt.showmode = false
        vim.opt.ruler = false
        vim.opt.showcmd = false
        vim.opt.statusline = ''
    end
}

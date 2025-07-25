return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' }
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff' },
            lualine_c = { 'filename', 'diagnostics' },
            lualine_x = {
                {
                    'encoding',
                    cond = function()
                        return vim.bo.fileencoding ~= 'utf-8'
                    end
                },
                {
                    'fileformat',
                    cond = function()
                        return vim.bo.fileformat ~= 'unix'
                    end
                },
                'filetype'
            },
            lualine_y = { 'searchcount', 'selectioncount', 'lsp_status' },
            lualine_z = { 'location', 'progress' }
        },
        extensions = {
            'lazy',
            'neo-tree'
        }
    },
}

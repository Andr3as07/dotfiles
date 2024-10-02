local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fi', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- NOTE: This requires `ripgrep´ to be installed
vim.keymap.set('n', '<leader>fr', function() 
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)






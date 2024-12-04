
-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = LazyVim.safe_keymap_set

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selection up and down a line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Leave cursor in place while using C-d and C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep the search term in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace the currently selected word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-k>", ":wincmd k<CR>");
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>");
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>");
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>");


local map = vim.keymap.set

-- laxy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- File Management
map("n", "<leader>fx", "<cmd>Explore<cr>", { desc = "Explore" })

-- Resize windows
map("n", "<C-Up>",    "<cmd>resize -2<cr>",          { desc = "Resize Up"})
map("n", "<C-Down>",  "<cmd>resize 2<cr>",           { desc = "Resize Down"})
map("n", "<C-Left>",  "<cmd>vertical resize -2<cr>", { desc = "Resize Left"})
map("n", "<C-Right>", "<cmd>vertical resize 2<cr>",  { desc = "Resize Right"})

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Reselect last pasted text
map("n", "<leader>v", "printf('`[%s`]', getregtype()[0])", { desc = "Reselect last pasted area", expr = true })

-- Toggle Spell checking
Snacks.toggle({
    name = "Spell checking",
    get = function()
        return vim.opt.spell._value
    end,
    set = function(state)
        vim.opt.spell = state
    end
}):map("<leader>us")

-- Change text without putting it into the register
map("n", "c", '"_c')
map("n", "C", '"_C')
map("n", "cc", '"_cc')
map("x", "CC", '"_CC')

-- Remove trailing whitespace
map("n", "<leader><space>", "<cmd>StripTrailingWhitespace<cr>", { desc = "Strip trailing whitespace"})

-- Insert semicolon at the end
map("n", "<leader>;", "<esc>miA;<esc>`ii", { desc = "Insert Semicolon at the end"})


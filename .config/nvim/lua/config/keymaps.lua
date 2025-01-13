
local map = vim.keymap.set

-- laxy
map("n", "<leader>tL", "<cmd>Lazy<cr>", { desc = "Lazy" })

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


-- Toggle Scroll
Snacks.toggle({
    name = "Scroll Mode",
    get = function()
        return Snacks.scroll.enabled
    end,
    set = function(state)
        if state == false then
            Snacks.scroll.disable()
        else
            Snacks.scroll.enable()
        end
    end
}):map("<leader>us")

-- Toggle Dim
Snacks.toggle({
    name = "Dimmed Mode",
    get = function()
        return Snacks.dim.enabled
    end,
    set = function(state)
        if state == false then
            Snacks.dim.disable()
        else
            Snacks.dim.enable()
        end
    end
}):map("<leader>ud")

Snacks.toggle.option("spell", {name = "Spell Checking"}):map("<leader>uS")
Snacks.toggle.option("wrap", {name = "Wrap"}):map("<leader>uw")
Snacks.toggle.dim():map("<leader>ud")
Snacks.toggle.inlay_hints():map("<leader>ug")
Snacks.toggle.line_number():map("<leader>ul")

-- Change text without putting it into the register
map("n", "c", '"_c')
map("n", "C", '"_C')
map("n", "cc", '"_cc')
map("x", "CC", '"_CC')

-- Remove trailing whitespace
map("n", "<leader><space>", "<cmd>StripTrailingWhitespace<cr>", { desc = "Strip trailing whitespace"})

-- Insert semicolon at the end
map("n", "<leader>;", "<esc>miA;<esc>`ii", { desc = "Insert Semicolon at the end"})


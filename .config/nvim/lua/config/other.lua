-- Use 4 spaces as tabs
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Enable Visual Scrolling
Snacks.scroll.enable()

-- Relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- 80 column mark
vim.o.colorcolumn = "80"

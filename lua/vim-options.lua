-- VIM OPTIONS

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>") -- delete search w/ space-h
vim.keymap.set("n", "<leader>in", "gg=G") -- indent
vim.keymap.set("n", "<leader>sa", "ggVG") -- select all
vim.keymap.set("i", "jk", "<Esc>") -- select all

-- remove some mappings
vim.keymap.set("n", "<leader>i", "")
vim.keymap.set("n", "<leader>a", "")
vim.keymap.set("n", "<leader>u", "")
vim.keymap.set("n", "<leader>y", "")
vim.keymap.set("n", "<leader>d", "")

-- folding
vim.keymap.set("n", "<leader>fa", "zM")
vim.keymap.set("n", "<leader>ua", "zR")

-- spelling
vim.opt.spelllang = { "en_us", "it" }
vim.opt.spell = true
vim.keymap.set("n", "<leader>sk", "]s") -- jump to previous misspelled word
vim.keymap.set("n", "<leader>sj", "[s") -- jump to next misspelled word
vim.keymap.set("n", "<leader>sg", "zg") -- add word to dictionary

-- braces
vim.keymap.set("i", "{", "{}<Esc>ha", { noremap = true, silent = true })
vim.keymap.set("i", "[", "[]<Esc>ha", { noremap = true, silent = true })
vim.keymap.set("i", "(", "()<Esc>ha", { noremap = true, silent = true })
vim.keymap.set("i", "'", "''<Esc>ha", { noremap = true, silent = true })
vim.keymap.set("i", '"', '""<Esc>ha', { noremap = true, silent = true })

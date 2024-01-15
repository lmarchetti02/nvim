-- VIM OPTIONS

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.foldmethod = "indent"

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>") -- delete search w/ space-h
vim.keymap.set("n", "<leader>in", "gg=G") -- indent
vim.keymap.set("n", "<leader>gc", ":!git commit -m ''") -- indent

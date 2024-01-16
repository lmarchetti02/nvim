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

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>") -- delete search w/ space-h
vim.keymap.set("n", "<leader>in", "gg=G") -- indent

-- GIT
vim.keymap.set("n", "<leader>pl", ":!git pull<CR>") -- pull
vim.keymap.set("n", "<leader>ps", ":!git push<CR>") -- push
vim.keymap.set("n", "<leader>ad", ":!git add .") -- add all
vim.keymap.set("n", "<leader>gc", ":!git commit -m ''") -- indent

-- remove some mappings
vim.keymap.set("n", "<leader>i", "")
vim.keymap.set("n", "<leader>a", "")
vim.keymap.set("n", "<leader>u", "")
vim.keymap.set("n", "<leader>y", "")
vim.keymap.set("n", "<leader>d", "")

-- folding Luca
vim.keymap.set("n", "<leader>fa", "zM")
vim.keymap.set("n", "<leader>ua", "zR")

-- spelling
vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.keymap.set("n", "<leader>sk", "]s")
vim.keymap.set("n", "<leader>sj", "[s")

vim.keymap.set("n", "<leader>ng", ":Neogit<CR>")

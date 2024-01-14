-- VIM OPTIONS
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>') -- delete search w/ space-h


-- LAZY.NVIM PACKAGE MANAGER
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("plugins") -- import plugins

-- TELESCOPE
local builtin = require "telescope.builtin"
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- NEO-TREE
vim.keymap.set('n', '<leader>fs', ':Neotree reveal filesystem left<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree focus<CR>')

-- TREESITTER
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = { "c", "cpp", "lua", "cmake", "python", "latex", "csv" },
	higlight = { enable = true },
	indent = { enable = true }
})

-- COLORSCHEME
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

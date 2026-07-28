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
vim.opt.showmode = false

require("vim-options") -- import vim options

-- import plugins: lazy.nvim only auto-discovers files directly under lua/plugins/,
-- not nested subdirectories, so each subfolder needs its own explicit import
require("lazy").setup({
	spec = {
		{ import = "plugins.git" },
		{ import = "plugins.lsp" },
		{ import = "plugins.editor" },
		{ import = "plugins.ui" },
		{ import = "plugins.nav" },
		{ import = "plugins.lang" },
		{ import = "plugins.data" },
	},
})

require("config.floating-terminal") -- import terminal

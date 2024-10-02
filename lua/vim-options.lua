-- VIM OPTIONS

-- basic configurations
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true

-- miscellaneous mappings
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>") -- delete search w/ space-h
vim.keymap.set("n", "<leader>in", "gg=G") -- indent
vim.keymap.set("n", "<leader>sa", "ggVG") -- select all
vim.keymap.set("i", "kj", "<Esc>") -- exit normal mode

-- remove some mappings
vim.keymap.set("n", "<leader>i", "")
vim.keymap.set("n", "<leader>a", "")
vim.keymap.set("n", "<leader>u", "")
vim.keymap.set("n", "<leader>y", "")
vim.keymap.set("n", "<leader>d", "")

-- folding
vim.keymap.set("n", "<leader>fa", "zM") -- fold all
vim.keymap.set("n", "<leader>ua", "zR") -- unfold all

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

-- toggle linting errors
local virtual_text_enabled = true -- Track the state of virtual text

function ToggleVirtualText()
	virtual_text_enabled = not virtual_text_enabled -- Toggle the state
	vim.diagnostic.config({
		virtual_text = virtual_text_enabled, -- Set the new state
	})
end

vim.keymap.set(
	"n",
	"<leader>tl",
	":lua ToggleVirtualText()<CR>",
	{ noremap = true, silent = true, desc = "Toggle linting text" }
)

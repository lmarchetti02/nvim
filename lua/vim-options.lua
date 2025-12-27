-- VIM OPTIONS

-- basic configurations
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true

-- miscellaneous mappings
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Delete Search" })
vim.keymap.set("n", "<leader>in", "gg=G", { desc = "Indent All" })
vim.keymap.set("n", "<leader>sa", "ggVG", { desc = "Select All" })
vim.keymap.set("i", "kj", "<Esc>") -- exit normal mode

-- remove some mappings
vim.keymap.set("n", "<leader>i", "")
vim.keymap.set("n", "<leader>a", "")
vim.keymap.set("n", "<leader>u", "")
vim.keymap.set("n", "<leader>d", "")

-- spelling
vim.opt.spelllang = { "en_us", "it" }
vim.opt.spell = true
vim.keymap.set("n", "<leader>sk", "]s", { desc = "Previous Misspelled Word" })
vim.keymap.set("n", "<leader>sj", "[s", { desc = "Next Misspelled Word" })
vim.keymap.set("n", "<leader>sg", "zg", { desc = "Add word to dictionary" })

-- copying/pasting to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"*y', { desc = "Copy selection to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"*p', { desc = "Paste from system clipboard" })

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
	"<leader>vt",
	":lua ToggleVirtualText()<CR>",
	{ noremap = true, silent = true, desc = "Toggle linting text" }
)

-- Navigate panes
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move focus to the right window" })

return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false

		vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", {})
		vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", {})
		vim.keymap.set("n", "<leader>x", "<Cmd>BufferClose<CR>", {})
		vim.keymap.set("n", "<leader>p", "<Cmd>BufferPin<CR>", {})
	end,
	opts = {
		animation = true,
		sidebar_filetypes = {
			["neo-tree"] = { event = "BufWipeout" },
			["telescope"] = { event = "BufWipeout" },
		},
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}

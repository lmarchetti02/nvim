return {
	"romgrk/barbar.nvim",
	lazy = false,
	dependencies = {
		-- gitsigns.nvim is an OPTIONAL integration (git status in buffer tabs), and is
		-- intentionally not listed here: it's already installed via git.lua, and lazy.nvim
		-- force-loads a `lazy=false` plugin's `dependencies` eagerly regardless of their
		-- own lazy triggers, which would defeat gitsigns' own BufReadPre/BufNewFile gate.
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false

		vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", { desc = "Next Buffer" })
		vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { desc = "Previous Buffer" })
		vim.keymap.set("n", "<leader>x", "<Cmd>BufferClose<CR>", { desc = "Close Buffer" })
		vim.keymap.set("n", "<leader>p", "<Cmd>BufferPin<CR>", { desc = "Pin Buffer" })
	end,
	opts = {
		animation = true,
		sidebar_filetypes = {
			["neo-tree"] = { event = "BufWipeout" },
			["telescope"] = { event = "BufWipeout" },
			["neogit"] = { event = "BufWipeout" },
		},
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}

-- NEO-TREE

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>fs", ":Neotree reveal filesystem left<CR>")
		vim.keymap.set("n", "<leader>cfs", ":Neotree close<CR>")
		vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>")

		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = false, -- when true, they will just be displayed differently than normal items
					hide_dotfiles = false,
					hide_gitignored = false,
					never_show = { ".git" },
				},
			},
		})
	end,
}

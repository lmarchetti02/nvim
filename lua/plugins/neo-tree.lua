-- NEO-TREE

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>fs", ":Neotree reveal filesystem left<CR>", desc = "Reveal Filesystem (Neo-tree)" },
		{ "<leader>cfs", ":Neotree close<CR>", desc = "Close Neo-tree" },
		{ "<leader>t", ":Neotree focus<CR>", desc = "Focus Neo-tree" },
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = false, -- when true, they will just be displayed differently than normal items
					hide_dotfiles = false,
					hide_gitignored = false,
					never_show = { ".git" },
				},
			},
			window = {
				mappings = {
					["<leader><cr>"] = function(state)
						local node = state.tree:get_node()
						if node.type == "directory" then
							-- Change the current working directory to the selected directory
							vim.cmd("cd " .. node.path)
							-- Optionally, you can also set Neo-tree's root to the new directory
							require("neo-tree.command").execute({ toggle = true, dir = node.path })
						else
							-- Open the file if it's not a directory
							require("neo-tree.ui.renderer").focus_node(state, node.id)
						end
					end,
				},
			},
		})
	end,
}

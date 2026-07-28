-- TELESCOPE

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
	keys = {
		{ "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
		{ "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
		{ "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Active Buffers" },
		{ "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help" },
		{ "<leader>gs", function() require("telescope.builtin").git_status() end, desc = "Git Status" },
		{ "<leader>fr", function() require("telescope.builtin").registers() end, desc = "Find Registers" },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
		require("telescope").load_extension("ui-select")
	end,
}

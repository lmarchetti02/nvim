return {
	"vidocqh/data-viewer.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"kkharji/sqlite.lua", -- Optional, sqlite support
	},
	config = function()
		vim.api.nvim_set_hl(0, "DataViewerColumn0", { fg = "#ff0000" })
		vim.api.nvim_set_hl(0, "DataViewerColumn1", { fg = "#00bfff" })
		vim.api.nvim_set_hl(0, "DataViewerColumn2", { fg = "#00ff00" })

		require("data-viewer").setup({
			autoDisplayWhenOpenFile = false,
			maxLineEachTable = 1000000,
			columnColorEnable = true,
			columnColorRoulette = { -- Highlight groups
				"DataViewerColumn0",
				"DataViewerColumn1",
				"DataViewerColumn2",
			},
			view = {
				float = true, -- False will open in current window
				width = 0.8, -- Less than 1 means ratio to screen width, valid when float = true
				height = 0.8, -- Less than 1 means ratio to screen height, valid when float = true
				zindex = 50, -- Valid when float = true
			},
			keymap = {
				quit = "q",
				next_table = "<leader>nt",
				prev_table = "<leader>pt",
			},
		})
	end,
}

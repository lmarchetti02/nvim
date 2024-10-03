return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = true,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			-- yadm = {
			-- 	enable = false,
			-- },
		})

		vim.keymap.set("n", "gk", ":Gitsigns prev_hunk<CR>", { desc = "Previous Hunk" })
		vim.keymap.set("n", "gj", ":Gitsigns next_hunk<CR>", { desc = "Next Hunk" })
		vim.keymap.set("n", "gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Line Blame" })
		vim.keymap.set("n", "gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
		vim.keymap.set("n", "gR", ":Gitsigns reset_buffer<CR>", { desc = "Reset Buffer" })
		vim.keymap.set("n", "gS", ":Gitsigns stage_buffer<CR>", { desc = "Stage Buffer" })
		vim.keymap.set("n", "gd", ":Gitsigns diffthis<CR>", { desc = "Previous Hunk" })
		vim.keymap.set({ "n", "v" }, "gh", ":Gitsigns select_hunk<CR>", { desc = "Diff File" })
	end,
}

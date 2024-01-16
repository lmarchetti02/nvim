return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,

	config = function()
		local which_key = require("which-key")

		local opts = {
			mode = "n", -- NORMAL mode
			prefix = "<leader>",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		}

		local mappings = {
			["d"] = { "<cmd>vim.lsp.buf.declaration<cr>", "Go To Declaration" },
			["D"] = { "<cmd>vim.lsp.buf.definition<cr>", "Go to Definition" },

			g = {
				name = "Git",
				j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
				k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
				b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
				r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
				R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
				h = { "<cmd>lua require 'gitsigns'.diffthis()<cr>", "Diff This" },
				d = {
					"<cmd>Gitsigns diffthis HEAD<cr>",
					"Diff",
				},
			},
		}

		which_key.register(mappings, opts)
	end,
}

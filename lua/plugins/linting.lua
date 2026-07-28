return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "ruff" },
			cpp = { "clangtidy" },
			tex = { "vale" },
			swift = { "swiftlint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		-- clang-tidy (unlike clangd) can't infer compile flags for a header from whichever
		-- .cpp includes it, so it fails on standalone headers even when clangd handles them
		-- fine; skip linting on headers and leave those diagnostics to clangd.
		local header_extensions = { h = true, hh = true, hpp = true, hxx = true }

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				if header_extensions[vim.fn.expand("%:e")] then
					return
				end
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting in current file" })
	end,
}

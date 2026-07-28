return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "skim" -- Tell VimTeX to use Skim

		-- Don't open QuickFix for compilation warnings, only errors
		vim.g.vimtex_quickfix_open_on_warning = 0
	end,
	config = function()
		-- Automatically format multiple empty lines in LaTeX on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.tex",
			callback = function()
				-- Save the current cursor position so it doesn't jump around
				local save_cursor = vim.fn.getpos(".")

				-- Silently search and replace 3 or more newlines with exactly 2
				-- The 'e' flag prevents error messages if no extra lines are found
				vim.cmd([[%s/\n\{3,}/\r\r/ge]])

				-- Restore cursor position
				vim.fn.setpos(".", save_cursor)
			end,
		})

		-- LaTeX shortcuts
		vim.keymap.set("n", "<leader>dl", "<leader>wj:q<CR>", { remap = true, desc = "Close LaTeX compilation error" })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "tex",
			callback = function()
				-- <M-M> represents Alt/Option + Shift + M
				-- It inserts $ $, then moves the cursor left one space to put you inside
				vim.keymap.set("i", "<M-M>", "$  $<Left><Left>", { buffer = true, desc = "Insert inline math" })
			end,
		})
	end,
}

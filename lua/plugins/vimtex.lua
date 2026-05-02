return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "skim" -- Tell VimTeX to use Skim

		-- Don't open QuickFix for compilation warnings, only errors
		vim.g.vimtex_quickfix_open_on_warning = 0
	end,
}

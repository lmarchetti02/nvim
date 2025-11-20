return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- Required for parsing
	},
	ft = { "markdown", "telescope-markdown" }, -- Only load for markdown filetypes
	config = function()
		-- The minimal config is just calling setup()
		-- This enables rendering by default for markdown files
		require("render-markdown").setup({
			completions = { lsp = { enabled = true } },
		})
	end,
}

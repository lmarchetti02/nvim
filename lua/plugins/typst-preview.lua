return {
	"chomosuke/typst-preview.nvim",
	ft = "typst", -- Only load for typst files
	version = "1.*",
	build = function()
		require("typst-preview").update()
	end, -- Install the preview binary
	config = function()
		require("typst-preview").setup({
			-- Setting this true will enable debug logging
			debug = false,
			-- Custom format string to open the output link provided with %s
			-- Example: open_cmd = 'firefox %s -P typst-preview --class typst-preview'
			open_cmd = nil,
			-- Invert colors for dark mode support (can be 'always', 'never', or 'auto')
			invert_colors = "auto",
			-- Whether the preview will follow the cursor in the source file
			follow_cursor = true,
		})
	end,
}

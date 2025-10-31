-- TREESITTER

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			ensure_installed = { "c", "cpp", "lua", "cmake", "python", "latex", "csv" },
			highlight = { enable = true },
			indent = { enable = true },
		})

		require("ufo").setup({
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})
	end,
}

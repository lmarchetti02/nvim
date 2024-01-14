-- TREESITTER

return {
	"nvim-treesitter/nvim-treesitter", 
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "c", "cpp", "lua", "cmake", "python", "latex", "csv" },
			higlight = { enable = true },
			indent = { enable = true }
		})
	end
}

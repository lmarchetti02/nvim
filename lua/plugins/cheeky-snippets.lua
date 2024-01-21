return {
	"madskjeldgaard/cheeky-snippets.nvim",
	dependencies = { "L3MON4D3/LuaSnip" },

	config = function()
		local cheeky = require("cheeky")
		cheeky.setup({
			langs = {
				all = true,
				lua = true,
				cpp = false,
				asm = true,
				cmake = true,
				markdown = true,
				supercollider = false,
			},
		})
	end,
}

return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")

		npairs.setup({
			check_ts = true, -- Check treesitter to avoid pairs in comments/strings
		})

		npairs.add_rules({
			Rule('"""', '"""', "python"),
		})
	end,
}

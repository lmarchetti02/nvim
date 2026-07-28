-- TREESITTER

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		-- Some grammars (swift, latex, ...) have no pre-built parser.c and must be
		-- regenerated from grammar.js at install time via `tree-sitter generate`. That
		-- CLI dropped --no-bindings in 0.25, which this plugin still passes unconditionally,
		-- while our Neovim's runtime ABI (15) is newer than what CLI versions still
		-- supporting --no-bindings can generate (13-14). Pin ABI 14, which Neovim's
		-- runtime loads fine, to make those installs work with an older CLI.
		require("nvim-treesitter.install").ts_generate_args = { "generate", "--no-bindings", "--abi", "14" }

		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"cmake",
				"python",
				"csv",
				"latex",
				"markdown",
				"markdown_inline",
				"typst",
				"toml",
				"dot",
				"sql",
				"swift",
			},
			highlight = { enable = true, disable = { "latex" } },
			indent = { enable = true },
		})
	end,
}

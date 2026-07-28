-- TREESITTER

local parsers_to_install = {
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
	"vim",
}

-- latex highlighting stays disabled (as before); markdown_inline is injection-only,
-- never a real buffer filetype, so it's excluded from the FileType pattern too.
local filetypes_to_highlight = {
	"c",
	"cpp",
	"lua",
	"cmake",
	"python",
	"csv",
	"markdown",
	"typst",
	"toml",
	"dot",
	"sql",
	"swift",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install(parsers_to_install)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes_to_highlight,
			callback = function()
				vim.treesitter.start()
				vim.wo[0][0].foldmethod = "expr"
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				-- NOTE: treesitter indent is documented as experimental on nvim-treesitter's
				-- main branch; drop this line and rely on filetype indent if it misbehaves.
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}

-- LSP

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- Lua
					"clangd", -- C, C++
					"cmake", -- CMake
					"julials", -- Julia
					"marksman", -- Markdown
					"pyre", -- Python
					"jsonls", -- Json
				},
			})
		end,
	},
}

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
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.cmake.setup({})
			lspconfig.julials.setup({})
			lspconfig.marksman.setup({})
			lspconfig.pyre.setup({})

			vim.keymap.set("n", "D", vim.lsp.buf.hover, {}) -- get documentation
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {}) -- go to definition
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {}) -- go to declaration
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- open code action
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
		end,
	},
}

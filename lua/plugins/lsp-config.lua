return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({})
		lspconfig.clangd.setup({})
		lspconfig.cmake.setup({})
		lspconfig.julials.setup({})
		lspconfig.marksman.setup({})
		lspconfig.pyre.setup({})

		vim.keymap.set("n", "H", vim.lsp.buf.hover, {}) -- get documentation
		vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {}) -- go to definition
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.declaration, {}) -- go to declaration
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- open code action
		vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
	end,
}

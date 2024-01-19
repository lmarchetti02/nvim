return {
	"neovim/nvim-lspconfig",
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.clangd.setup({
			capabilities = capabilities,
		})
		lspconfig.cmake.setup({
			capabilities = capabilities,
		})
		lspconfig.julials.setup({
			capabilities = capabilities,
		})
		lspconfig.marksman.setup({
			capabilities = capabilities,
		})
		lspconfig.pyre.setup({
			capabilities = capabilities,
		})

		vim.keymap.set("n", "H", vim.lsp.buf.hover, {}) -- get documentation
		vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {}) -- go to definition
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.declaration, {}) -- go to declaration
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- open code action
		vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
	end,
}

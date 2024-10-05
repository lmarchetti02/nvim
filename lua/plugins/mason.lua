-- LSP

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls", -- Lua
				"clangd", -- C, C++
				"cmake", -- CMake
				"julials", -- Julia
				"marksman", -- Markdown
				"pyright", -- Python
				"jsonls", -- Json
				"texlab", -- LaTeX
			},

			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"debugpy",
				"flake8",
				"mypy",
				"clang-format", -- c++ formatter
			},
		})
	end,
}

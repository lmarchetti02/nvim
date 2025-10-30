return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Define server configurations
		local servers = {
			lua_ls = {},
			clangd = {
				cmd_env = {
					compilationDatabasePath = "./build",
				},
			},
			cmake = {},
			marksman = {},
			pyright = {
				filetypes = { "python" },
			},
			texlab = {},
			bashls = {
				filetypes = { "bash", "sh", "zsh" },
			},
			vimls = {},
		}

		-- Configure and enable each server
		for server, config in pairs(servers) do
			config.capabilities = capabilities
			vim.lsp.config[server] = config
			vim.lsp.enable(server)
		end

		-- Set up keybindings when LSP attaches
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local opts = { buffer = args.buf }
				vim.keymap.set("n", "H", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.declaration, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			end,
		})
	end,
}

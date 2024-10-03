return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},

			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),

				vim.keymap.set({ "i", "s" }, "<C-l>", function()
					if luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { desc = "Snippet next argument", silent = true }),

				vim.keymap.set({ "i", "s" }, "<C-h>", function()
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { desc = "Snippet previous argument", silent = true }),
			}),

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer", max_item_count = 5 },
				},
			}),

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path", max_item_count = 5 },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp", max_item_count = 6 },
				{ name = "luasnip", max_item_count = 6 },
				{ name = "buffer", max_item_count = 6 },
				{ name = "path", max_item_count = 6 },
			}),

			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsischar = "...",
				}),
			},
		})
	end,
}

return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	event = "BufReadPost",

	config = function()
		local ufo = require("ufo")

		vim.o.foldcolumn = "0"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		vim.keymap.set("n", "+", "zo", { desc = "Open fold under cursor" })
		vim.keymap.set("n", "-", "zc", { desc = "Close fold under cursor" })
		vim.keymap.set("n", "<leader>ua", ufo.openAllFolds, { desc = "Open All Folds" })
		vim.keymap.set("n", "<leader>fa", ufo.closeAllFolds, { desc = "Close All Folds" })
		vim.keymap.set("n", "zk", function()
			local winid = ufo.peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end, { desc = "Peek Fold / LSP Hover" })

		-- The visual handler (keeps your cool fold text)
		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = (" 󰁂 %d "):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end

		ufo.setup({
			fold_virt_text_handler = handler,
			provider_selector = function(bufnr, filetype, buftype)
				local buftype_exclude = { nofile = true, terminal = true, prompt = true }
				local filetype_exclude = { ["neo-tree"] = true }
				if buftype_exclude[buftype] or filetype_exclude[filetype] then
					return ""
				end
				return { "treesitter", "indent" }
			end,
		})
	end,
}

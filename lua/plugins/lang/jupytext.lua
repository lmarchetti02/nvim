-- Jupyter notebooks (.ipynb) as plain text: converts to/from a paired
-- Python file (percent-cell format) on read/write via the `jupytext` CLI,
-- so notebooks get normal pyright/ruff/treesitter support. No execution or
-- output rendering — just text editing.
return {
	"GCBallesteros/jupytext.nvim",
	lazy = false, -- must load before any .ipynb buffer opens, or it shows raw JSON
	opts = {
		style = "hydrogen", -- "# %%" cell markers, paired as a .py file
	},
}

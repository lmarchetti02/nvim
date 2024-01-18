return {
	"cdelledonne/vim-cmake",
	config = function()
		vim.keymap.set("n", "mg", ":CMakeGenerate<CR>")
		vim.keymap.set("n", "mb", ":CMakeBuild<CR>")
		vim.keymap.set("n", "mr", ":CMakeRun ")
	end,
}

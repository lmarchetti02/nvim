return {
	"cdelledonne/vim-cmake",
	config = function()
		vim.keymap.set("n", "mg", ":CMakeGenerate<CR>", { desc = "CMake Generate" })
		vim.keymap.set("n", "mb", ":CMakeBuild<CR>", { desc = "CMake Build" })
		vim.keymap.set("n", "mr", ":CMakeRun ", { desc = "CMake Run" })
	end,
}

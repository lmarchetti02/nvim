return {
	"tpope/vim-dadbod",
	dependencies = {
		"kristijanhusak/vim-dadbod-ui",
		"kristijanhusak/vim-dadbod-completion",
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		-- Enable nerd fonts for the DB UI
		vim.g.db_ui_use_nerd_fonts = 1
		-- Save connection history in your standard Neovim data folder
		vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/dadbod_ui"
	end,
}

return {
	"rbong/vim-flog",
	lazy = true,
	cmd = { "Flog", "Flogsplit", "Floggit" },
	dependencies = {
		{
			"tpope/vim-fugitive",
			cmd = { "G", "Gdiffsplit" },
			keys = {
				{
					"<leader>G",
					"<cmd>G<cr>",
					mode = { "n" },
					desc = "Open git fugitive",
				},
			},
		},
	},
}

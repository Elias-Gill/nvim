return {
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
		dependencies = { "rbong/vim-flog" },
	},
}

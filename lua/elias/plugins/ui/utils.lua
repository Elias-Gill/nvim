return {
	{
		"NvChad/nvim-colorizer.lua",
		event = "VeryLazy",
	},

	--ayudas de indentacion
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "VeryLazy",
		opts = {
			indent = { char = "┆" },
			scope = {
				show_start = false,
				show_end = false,
			},
			exclude = { filetypes = { "dashboard", "vim", "markdown", "txt" } },
		},
	},
}

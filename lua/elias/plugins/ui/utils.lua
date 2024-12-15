return {
	{
		"chrisbra/colorizer",
        cmd = "ColorToggle",
	},

	--ayudas de indentacion
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "VeryLazy",
		---@module "ibl"
		---@type ibl.config
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

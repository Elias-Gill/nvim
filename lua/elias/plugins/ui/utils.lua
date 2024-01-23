return {
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufEnter", "BufAdd" },
		config = function()
			require("colorizer").setup()
		end,
	},

    --ayudas de indentacion
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "BufAdd",
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

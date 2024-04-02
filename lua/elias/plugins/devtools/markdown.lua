return {
	{
		"MeanderingProgrammer/markdown.nvim",
		ft = { "markdown" },
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"ixru/nvim-markdown",
			-- "elias-gill/vim-markdown-concealed",
		},
		config = function()
			require("render-markdown").setup({
				bullets = { "•", "‣", "◆", "◇" },
				conceal = {
					default = 2,
					rendered = 2,
				},
				highlights = {
					code = "",

					heading = {
						backgrounds = { "" },
					},
				},
			})
		end,
	},
}

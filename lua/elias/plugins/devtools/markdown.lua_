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
				bullet = {
					enabled = true,
					icons = { "•", "‣", "◆", "◇" },
					highlight = "Normal",
				},
				win_options = {
					conceallevel = {
						default = vim.api.nvim_get_option_value("conceallevel", {}),
						rendered = 2,
					},
					concealcursor = {
						default = "",
						rendered = "",
					},
				},
				code = {
					enabled = true,
					--  none: disables all rendering
					--  normal: adds highlight group to code blocks & inline code
					--  language: adds language icon to sign column and icon + name above code blocks
					--  full: normal + language
					style = "full",
					-- Highlight for code blocks & inline code
					highlight = "ColorColumn",
				},
				heading = {
					sign = true,
					backgrounds = {
						"@markup.link.url",
						"ErrorMsg",
						"WarningMsg",
						"String",
						"@markup.heading.5.markdown",
						"@markup.heading.6.markdown",
					},
				},
			})
		end,
	},
}

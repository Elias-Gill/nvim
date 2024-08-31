return {
	"OXY2DEV/markview.nvim",
	ft = "markdown",
	dependencies = {
		-- You will not need this if you installed the
		-- parsers manually
		-- Or if the parsers are in your $RUNTIMEPATH
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter",
		"ixru/nvim-markdown",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("markview").setup({
			modes = { "n", "no", "c" }, -- Change these modes
			-- to what you need

			-- hybrid_modes = { "n" }, -- Uses this feature on
			-- normal mode
			checkboxes = {
				enable = false,
			},

			horizontal_rules = {
				parts = {
					{
						type = "repeating",
						text = "─",
						direction = "left",
						hl = { "special" },
						repeat_amount = function()
							-- local w = vim.api.nvim_win_get_width(0)
							-- local l = vim.api.nvim_buf_line_count(0)
							-- l = vim.fn.strchars(tostring(l)) + 4
							-- return math.floor((w - (l + 3)) / 2)
                            return 46
						end,
					},
					{
						type = "text",
						text = "  ",
					},
					{
						type = "repeating",
						text = "─",
						direction = "right",
						hl = { "special" },
						repeat_amount = function()
							-- local w = vim.api.nvim_win_get_width(0)
							-- local l = vim.api.nvim_buf_line_count(0)
							-- l = vim.fn.strchars(tostring(l)) + 4
							-- return math.ceil((w - (l + 3)) / 2)
                            return 46
						end,
					},
				},
			},

			list_items = {
				enable = true,
				shift_width = 1,
				indent_size = 1,
				marker_minus = {
					text = "•",
				},
				marker_plus = {
					text = "‣",
				},
				marker_star = {
					text = "◆",
				},
				marker_dot = {
					text = "◇",
				},
			},

			headings = {
				enable = true,
				heading_1 = {
					style = "label",
					corner_right = " ",
				},
				heading_2 = {
					style = "label",
					corner_right = " ",
				},
				heading_3 = {
					style = "label",
					corner_right = " ",
				},
				heading_4 = {
					style = "label",
					corner_right = " ",
				},
				heading_5 = {
					style = "label",
					corner_right = " ",
				},
				heading_6 = {
					style = "label",
					corner_right = " ",
				},
			},

			-- This is nice to have
			callbacks = {
				on_enable = function(_, win)
					vim.wo[win].conceallevel = 2
					vim.wo[win].conecalcursor = "c"
				end,
			},
		})
	end,
}

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.o.background = "dark"
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				dim_inactive = {
					enabled = false,
				},
				transparent_background = true,
				custom_highlights = function(_)
					return {
						["NvimTreeCursorLine"] = { bg = "#323232", style = { "italic" } },
						["WinBarNC"] = { bg = "NONE" },
						["CursorLine"] = { bg = "#343434" },
						["EndOfBuffer"] = { fg = "#464646" },
                        ["TelescopeBorder"] = { fg = "#999999" },
						["@ibl.scope.char.1"] = { fg = "#eeeeee" },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	-- Fonts and icons
	"nvim-tree/nvim-web-devicons",
}

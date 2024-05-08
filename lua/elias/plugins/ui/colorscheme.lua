return {
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.o.background = "dark"
	-- 		require("catppuccin").setup({
	-- 			flavour = "mocha", -- latte, frappe, macchiato, mocha
	-- 			dim_inactive = {
	-- 				enabled = false,
	-- 			},
	-- 			transparent_background = true,
	-- 			custom_highlights = function(_)
	-- 				return {
	-- 					["NvimTreeCursorLine"] = { bg = "#323232", style = { "italic" } },
	-- 					["WinBarNC"] = { bg = "NONE" },
	-- 					["CursorLine"] = { bg = "#343434" },
	-- 					["EndOfBuffer"] = { fg = "#464646" },
	-- 					["TelescopeBorder"] = { fg = "#999999" },
	-- 					["@ibl.scope.char.1"] = { fg = "#eeeeee" },
	-- 					["@ibl.indent.char.1"] = { fg = "#545454" },
	-- 				}
	-- 			end,
	-- 		})
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },

	{
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("oldworld")
			vim.cmd("hi NormalNC guibg=none")
			vim.cmd("hi WinBarNC guibg=none guifg=none")
			vim.cmd("hi WinBar guibg=none guifg=none")
            vim.cmd("hi NvimTreeCursorLine guibg=#282828")
            vim.cmd("hi @ibl.scope.char.1 guifg=#dddddd")
		end,
	},

	-- Fonts and icons
	"nvim-tree/nvim-web-devicons",
}

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
	--

	"p00f/alabaster.nvim",

	{
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("oldworld").setup({
				integrations = {
					telescope = false,
				},
			})

			vim.cmd.colorscheme("oldworld")
			vim.cmd("hi NormalNC guibg=none")
			vim.cmd("hi colorcolumn guibg=#333333")
			vim.cmd("hi colorcolumn guibg=#202020")
			vim.cmd("hi WinBarNC guibg=none guifg=none")
			vim.cmd("hi WinBar guibg=none guifg=none")
			vim.cmd("hi NvimTreeCursorLine guibg=#282828")
			vim.cmd("hi DiffChange guifg=none guibg=#0d3138")
			vim.cmd("hi DiffDelete guifg=none guibg=#3c1f1e")
			vim.cmd("hi DiffAdd guifg=none guibg=#32361a")
		end,
	},

	-- Fonts and icons
	"nvim-tree/nvim-web-devicons",
}

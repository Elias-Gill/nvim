return {
    -- "p00f/alabaster.nvim",
	--[[ {
		"ronisbr/nano-theme.nvim",
		init = function()
			vim.o.background = "light" -- or "dark".
            vim.cmd.colorscheme("nano-theme")
            vim.cmd("hi NormalNC guibg=none")
            vim.cmd("hi colorcolumn guibg=#333333")
            vim.cmd("hi colorcolumn guibg=#202020")
            vim.cmd("hi WinBarNC guibg=none guifg=none")
            vim.cmd("hi WinBar guibg=none guifg=none")
            vim.cmd("hi NvimTreeCursorLine guibg=#2a2a2a")
            vim.cmd("hi TablineFill guibg=none")
		end,
	}, ]]

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

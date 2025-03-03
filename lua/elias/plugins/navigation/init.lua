return {
	-- { "DreamMaoMao/yazi.nvim", cmd = "Yazi" },
	-- {
	-- 	"elias-gill/fex.nvim",
	-- 	keys = {
	--            { "-", "<cmd>Fex<cr>", desc = "Open Dired" },
	--            { "_", "<cmd>split | Fex<cr>", desc = "Open Dired in split" }
	--        },
	-- },
	"christoomey/vim-tmux-navigator",
	"Mohammed-Taher/AdvancedNewFile.nvim",
	{
		"tpope/vim-vinegar",
		config = function()
			vim.cmd([[
                " netrw options
                let g:netrw_keepdir = 1

                "let g:netrw_liststyle = 3
                let g:netrw_hide = 1
                let g:netrw_list_hide = '^\.'
                let g:netrw_browse_split = 0
                let g:netrw_winsize = 20
                let g:netrw_banner = 0
            ]])
		end,
	},
}

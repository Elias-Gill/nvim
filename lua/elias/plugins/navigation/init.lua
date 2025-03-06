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
        event = "VeryLazy",
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

                augroup netrw_mappings
                    autocmd!
                    autocmd filetype netrw noremap <silent><buffer> <C-r> <C-l>
                    autocmd filetype netrw noremap <silent><buffer> <C-l> :wincmd l<cr>
                    autocmd filetype netrw noremap <silent><buffer> <esc> :q<cr>
                augroup END
            ]])
		end,
	},
}

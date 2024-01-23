return {
	"junegunn/fzf.vim",
	cmd = { "Files", "References", "Implementations", "History", "RG", "Helptags" },
	dependencies = {
		{
			"junegunn/fzf",
			build = "./install --all",
		},
		"gfanto/fzf-lsp.nvim",
	},
	vim.cmd([[
        nnoremap <silent><C-p> :Telescope find_files<CR>
        nnoremap <silent><C-s-p> :Telescope<CR>
        nnoremap <silent><leader>of :Telescope oldfiles<cr>
        nnoremap <silent><leader>f :Telescope live_grep<CR>
        ]]),
}

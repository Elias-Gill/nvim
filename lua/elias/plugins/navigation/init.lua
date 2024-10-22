return {
	-- { "DreamMaoMao/yazi.nvim", cmd = "Yazi" },
	{
		"elias-gill/fex.nvim",
		keys = { 
            { "-", "<cmd>Fex<cr>", desc = "Open Dired" },
            { "_", "<cmd>split | Fex<cr>", desc = "Open Dired in split" }
        },
	},
	"christoomey/vim-tmux-navigator",
}

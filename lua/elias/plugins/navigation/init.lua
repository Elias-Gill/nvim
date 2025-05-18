return {
	-- { "DreamMaoMao/yazi.nvim", cmd = "Yazi" },
	{
		"elias-gill/fex.nvim",
		keys = {
			{ "-", "<cmd>Fex<cr>", desc = "Open Dired" },
			{ "<leader>nt", "<cmd>leftabove vnew | vertical resize 50 | Fex | normal zL<cr>", desc = "Open Dired in split" },
		},
	},
    -- {
        -- 	"tpope/vim-vinegar",
        -- 	event = "VeryLazy",
        -- 	config = function() end,
    -- },
	"christoomey/vim-tmux-navigator",
	"Mohammed-Taher/AdvancedNewFile.nvim",
}

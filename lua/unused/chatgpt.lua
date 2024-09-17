return {
	"jackMort/ChatGPT.nvim",
	config = function()
		require("chatgpt").setup()
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>cg", "<cmd>ChatGPT<cr>", desc = "Open ChatGPT" },
	},
}

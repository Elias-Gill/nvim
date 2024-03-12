return {
	-- Running makefile targets
	{
		"elias-gill/makeman",
		cmd = "Makeman",
		config = function()
			vim.cmd([[command! Makeman lua require('makeman').run()]])
            vim.cmd([[nnoremap <leader>mm :Makeman<cr>]])
		end,
	},

	{ "tpope/vim-repeat", event = "InsertEnter" },
	{ "tpope/vim-surround", event = { "InsertEnter", "BufEnter" } }, -- surround
	{ "szw/vim-maximizer", cmd = "MaximizerToggle" }, -- maximizer
	{ "josa42/nvim-gx", keys = { { "gx", "<cmd>lua require('gx').gx()" } } }, -- open urls

	-- better quickfixList
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		config = function()
			require("bqf").setup({
				preview = {
					winblend = 0,
				},
			})
		end,
	},

	-- cleaning buffers
	{
		"kazhala/close-buffers.nvim",
		cmd = "BWipeout",
		config = function()
			require("close_buffers").setup()
		end,
	},

	-- undotree
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		config = function()
			vim.g.undotree_WindowLayout = 3
		end,
	},

	-- auto closing pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				enable_check_bracket_line = false,
			})
		end,
	},

	--comentarios
	{
		"numToStr/Comment.nvim",
		event = "BufEnter",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
				---@diagnostic disable-next-line: missing-fields
				mappings = {
					extra = false,
				},
			})
		end,
	},

	--emmet (hyper html)
	{
		"mattn/emmet-vim",
		ft = {
			"html",
			"css",
			"svelte",
			"javascript",
			"javascriptreact",
			"vue",
			"typescript",
			"typescriptreact",
			"astro",
		},
		config = function()
			vim.cmd(
				[[
                execute 'EmmetInstall'
                autocmd FileType svelte,html,css,javascript,javascriptreact,vue,typescript,typescriptreact,astro EmmetInstall]]
			)
		end,
	},
}

return {
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "tpope/vim-surround", event = { "VeryLazy" } }, -- surround
	{ "szw/vim-maximizer", cmd = "MaximizerToggle" }, -- maximizer
	{ "josa42/nvim-gx", keys = { { "gx", "<cmd>lua require('gx').gx()" } } }, -- open urls

	-- better quickfixList
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		config = function()
			require("bqf").setup({
				---@diagnostic disable-next-line: missing-fields
				preview = {
					auto_preview = false,
					winblend = 0,
					should_preview_cb = function(bufnr, _)
						local ret = true
						local bufname = vim.api.nvim_buf_get_name(bufnr)
						local fsize = vim.fn.getfsize(bufname)
						if fsize > 100 * 1024 then
							ret = false
						elseif bufname:match("^fugitive://") then
							ret = false
						elseif bufname:match("^.*%.md$") then
							ret = false
						end
						return ret
					end,
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
		event = "VeryLazy",
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
			"htmldjango",
			"xml",
			"css",
			"svelte",
			"javascriptreact",
			"typescriptreact",
			"vue",
			"php",
			"javascript",
			"typescript",
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

-- ------------- BOOTSTRAP-----------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- ------------- PLUGINS ------------
require("lazy").setup({
	-- editor config like other editors
	"gpanders/editorconfig.nvim",

	-- Custom libraries for neovim
	"nvim-lua/plenary.nvim",
	"ThePrimeagen/harpoon",
	{ "Asheq/close-buffers.vim", cmd = "Bwipeout" },
	"romainl/vim-cool",
	"christoomey/vim-tmux-navigator",
	-- use 'ThePrimeagen/refactoring.nvim'

	--  Start page
	{ "dstein64/vim-startuptime", cmd = "StartupTime" },
	"mhinz/vim-startify",

	-- " Git inegration
	"tpope/vim-fugitive",
	"sindrets/diffview.nvim",
	{ "almo7aya/openingh.nvim", tag = "v1.0.1" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signcolumn = false,
			})
		end,
	},

	-- Functions tree
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		-- keys = "<leader>vf",
		config = function()
			require("elias.utils.symbols_tree")
		end,
	},

	-- "Super-completado html
	{
		"mattn/emmet-vim",
		ft = { "html", "css", "svelte", "javascript", "javascriptreact", "vue", "typescript", "typescriptreact" },
		config = function()
			vim.api.nvim_command(
				[[autocmd FileType svelte,html,css,javascript,javascriptreact,vue,typescript,typescriptreact EmmetInstall]]
			)
		end,
	},

	-- Neovim Cmp (completition engine) and snippets
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			-- {'tzachar/cmp-tabnine', build = './install.sh'}
		},
		config = function()
			require("elias/lsp/nvim_cmp")
		end,
	},

	-- Tree sitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-textobjects",
	"JoosepAlviste/nvim-ts-context-commentstring",
	{
		"nvim-treesitter/playground",
		cmd = "TSPlaygroundToggle",
		config = function()
			require("nvim-treesitter.configs").setup({})
		end,
	},

	-- Lsp configs
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"glepnir/lspsaga.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	-- use 'folke/trouble.nvim'

	-- Tabline and status bar
	"windwp/windline.nvim",
	"alvarosevilla95/luatab.nvim",

	-- File search and tree
	"ibhagwan/fzf-lua",
	"kyazdani42/nvim-tree.lua",
	{ "kevinhwang91/rnvimr", cmd = "RnvimrToggle" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	-- Fonts and icons
	"ryanoasis/vim-devicons",
	"nvim-tree/nvim-web-devicons",

	-- Themes, GUI and customization
	"stevearc/dressing.nvim", -- better custom gui

	-- Pareado (){}""'', comentarios y ayudas de indentacion
	"windwp/nvim-autopairs",
	"tpope/vim-surround",
	"lukas-reineke/indent-blankline.nvim",
	{
		"b3nj5m1n/kommentary",
		config = function()
			require("kommentary.config").configure_language("vue", {
				single_line_comment_string = "auto",
				multi_line_comment_strings = "auto",
				hook_function = function()
					require("ts_context_commentstring.internal").update_commentstring()
				end,
			})
		end,
	},

	-- Utilities
	"kevinhwang91/nvim-bqf", -- quickfixList
	"folke/todo-comments.nvim",
	"jessarcher/vim-heritage", -- make parent directories
	"mbbill/undotree",
	"szw/vim-maximizer",
	-- wiki
	{
		"jakewvincent/mkdnflow.nvim",
		lazy = true,
		ft = "markdown",
		dependencies = { "ellisonleao/glow.nvim", branch = "main" },
		config = function()
			require("glow").setup({})
			require("elias/utils/wiki")
		end,
	},

	-- colorpicker and colorizer
	"uga-rosa/ccc.nvim",

	-- debuggers
	"rcarriga/nvim-dap-ui",
	"mfussenegger/nvim-dap",
	{
		"leoluz/nvim-dap-go",
		lazy = true,
		ft = "go",
		config = function()
			require("dap-go").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		lazy = true,
		ft = "python",
		config = function()
			require("dap-python").setup("/home/elias/.virtualenvs/debugpy/bin/python")
		end,
	},
})

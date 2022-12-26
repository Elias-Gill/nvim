-- ------------- BOOTSTRAP-----------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- ------------- PLUGINS ------------
require("lazy").setup(
	{
		"wbthomason/packer.nvim",
		-- super load speed
		"lewis6991/impatient.nvim",
		-- editor config like other editors
		"gpanders/editorconfig.nvim",

		-- Custom libraries for neovim
		"nvim-lua/plenary.nvim",
		"ThePrimeagen/harpoon",
		"Asheq/close-buffers.vim",
		"romainl/vim-cool",
		"christoomey/vim-tmux-navigator",
		-- use 'ThePrimeagen/refactoring.nvim'

		--  Start page
		"dstein64/vim-startuptime",
		"mhinz/vim-startify",

		-- " Git inegration
		"tpope/vim-fugitive",
		"sindrets/diffview.nvim",
		{ "almo7aya/openingh.nvim", tag = "v1.0.1" },
		{
			"lewis6991/gitsigns.nvim",
			require("gitsigns").setup({
				signcolumn = false,
				yadm = { enable = true },
			}),
		},

		-- Functions tree
		"liuchengxu/vista.vim",

		-- "Super-completado html
		{
			"mattn/emmet-vim",
			lazy = true,
			ft = { "html", "javascript", "xml", "typescript", "svelte", "vue", "react" },
		},

		-- Neovim Cmp (completition engine)
		{
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			dependencies = {
				"hrsh7th/nvim-cmp",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"onsails/lspkind.nvim",
				"saadparwaiz1/cmp_luasnip",
				-- {'tzachar/cmp-tabnine', run = './install.sh'}
			},
			config = function()
				require("elias/lsp/nvim_cmp")
			end,
		},

		-- Tree sitter
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		"nvim-treesitter/nvim-treesitter-textobjects",

		-- Lsp and snippets
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "glepnir/lspsaga.nvim", branch = "main" },
		"L3MON4D3/LuaSnip",
		"jose-elias-alvarez/null-ls.nvim",
		-- use 'folke/trouble.nvim'

		-- Tabline and status bar
		"windwp/windline.nvim",
		"alvarosevilla95/luatab.nvim",
		"ibhagwan/fzf-lua",
		"kyazdani42/nvim-tree.lua",
		"kevinhwang91/rnvimr",
		{ "nvim-telescope/telescope.nvim", tag = "0.1.0" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},

		-- Fonts and icons
		"ryanoasis/vim-devicons",
		"nvim-tree/nvim-web-devicons",

		-- Themes, GUI and customization
		"stevearc/dressing.nvim", -- better custom gui

		-- Pareado (){}""'' y ayudas de indentacion
		"windwp/nvim-autopairs",
		"b3nj5m1n/kommentary",
		"tpope/vim-surround",
		"lukas-reineke/indent-blankline.nvim",

		-- Utilities
		{
			"jakewvincent/mkdnflow.nvim",
			lazy = true,
			ft = "markdown",
			config = function()
				require("elias/utils/wiki")
			end,
		}, -- wiki

		{ "uga-rosa/ccc.nvim", branch = "0.7.2" }, -- colorpicker and colorizer
		"folke/todo-comments.nvim",
		"szw/vim-maximizer",

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

		-- use 'rest-nvim/rest.nvim'
		-- use 'michaelb/sniprun', {'do': 'bash install.sh'}
		-- use 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
		-- use 'beauwilliams/focus.nvim'
		-- use {'ellisonleao/glow.nvim', opt = true, ft = 'markdown', branch = 'main'}
		-- use 'mbbill/undotree'
		-- use 'tamton-aquib/duck.nvim'
		-- use 'folke/zen-mode.nvim'
		-- use 'EdenEast/nightfox.nvim'

		-- LaTex support
		-- use {'lervag/vimtex', opt = true, ft = "tex", config = vim.cmd('source ~/.config/nvim/config/latex.vim')}
	})

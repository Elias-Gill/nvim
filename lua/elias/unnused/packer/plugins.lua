-- ------------- PLUGINS ------------
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- super load speed
	use("lewis6991/impatient.nvim")
	-- editor config like other editors
	use("gpanders/editorconfig.nvim")

	-- Custom libraries for neovim
	use("nvim-lua/plenary.nvim")
	use("ThePrimeagen/harpoon")
	use("Asheq/close-buffers.vim")
	use("romainl/vim-cool")
	use("christoomey/vim-tmux-navigator")
	-- use 'ThePrimeagen/refactoring.nvim'

	--  Start page
	use("dstein64/vim-startuptime")
	use("mhinz/vim-startify")

	-- " Git inegration
	use("tpope/vim-fugitive")
	use("sindrets/diffview.nvim")
	use({ "almo7aya/openingh.nvim", tag = "v1.0.1" })
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signcolumn = false,
			})
		end,
	})

	-- Functions tree
	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	})
	-- use("liuchengxu/vista.vim")

	-- "Super-completado html
	use({
		"mattn/emmet-vim",
		ft = { "html", "css", "svelte", "javascript", "javascriptreact", "vue", "typescript", "typescriptreact" },
		config = function()
			vim.api.nvim_command(
				[[autocmd FileType svelte,html,css,javascript,javascriptreact,vue,typescript,typescriptreact EmmetInstall]]
			)
		end,
	})

	-- Neovim Cmp (completition engine) and snippets
	use("L3MON4D3/LuaSnip")
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		requires = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			-- {'tzachar/cmp-tabnine', run = './install.sh'}
		},
		config = function()
			require("elias/lsp/nvim_cmp")
		end,
	})

	-- Tree sitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"nvim-treesitter/playground",
		config = function()
			require("nvim-treesitter.configs").setup({})
		end,
	})

	-- Lsp configs
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("glepnir/lspsaga.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	-- use 'folke/trouble.nvim'

	-- Tabline and status bar
	use("windwp/windline.nvim")
	use("alvarosevilla95/luatab.nvim")

	-- File search and tree
	use("ibhagwan/fzf-lua")
	use("kyazdani42/nvim-tree.lua")
	use("kevinhwang91/rnvimr")
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	-- Fonts and icons
	use("ryanoasis/vim-devicons")
	use("nvim-tree/nvim-web-devicons")

	-- Themes, GUI and customization
	use("stevearc/dressing.nvim") -- better custom gui

	-- Pareado (){}""'', comentarios y ayudas de indentacion
	use("windwp/nvim-autopairs")
	use("tpope/vim-surround")
	use("lukas-reineke/indent-blankline.nvim")
	use({
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
	})

	-- Utilities
	use("kevinhwang91/nvim-bqf")
	use("folke/todo-comments.nvim")
	use("jessarcher/vim-heritage")
	use("mbbill/undotree")
	use("szw/vim-maximizer")
	-- wiki
	use({
		"jakewvincent/mkdnflow.nvim",
		opt = true,
		ft = "markdown",
		requires = { "ellisonleao/glow.nvim", branch = "main" },
		config = function()
			require("glow").setup({})
			require("elias/utils/wiki")
		end,
	})

	-- colorpicker and colorizer
	use({ "uga-rosa/ccc.nvim", branch = "0.7.2" })

	-- debuggers
	use("rcarriga/nvim-dap-ui")
	use("mfussenegger/nvim-dap")
	use({
		"leoluz/nvim-dap-go",
		opt = true,
		ft = "go",
		config = function()
			require("dap-go").setup()
		end,
	})
	use({
		"mfussenegger/nvim-dap-python",
		opt = true,
		ft = "python",
		config = function()
			require("dap-python").setup("/home/elias/.virtualenvs/debugpy/bin/python")
		end,
	})
end)

-- use 'rest-nvim/rest.nvim'
-- use 'michaelb/sniprun', {'do': 'bash install.sh'}
-- use 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
-- use 'beauwilliams/focus.nvim'
-- use 'tamton-aquib/duck.nvim'
-- use 'folke/zen-mode.nvim'
-- use 'EdenEast/nightfox.nvim'
-- LaTex support
-- use {'lervag/vimtex', opt = true, ft = "tex", config = vim.cmd('source ~/.config/nvim/config/latex.vim')}
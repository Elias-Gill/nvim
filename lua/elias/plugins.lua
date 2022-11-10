-- ------------- PLUGINS ------------
return require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'
    -- super load speed
    use 'lewis6991/impatient.nvim'
    use 'gpanders/editorconfig.nvim' -- editor config like other editors

    use 'nvim-lua/plenary.nvim' -- Custom libraries for neovim
    use 'ThePrimeagen/harpoon'
    use 'Asheq/close-buffers.vim'
    use 'romainl/vim-cool'
    use 'christoomey/vim-tmux-navigator'
    -- use 'ThePrimeagen/refactoring.nvim'

    --  Start page
    use 'dstein64/vim-startuptime'
    use 'mhinz/vim-startify'
    -- use 'echasnovski/mini.starter'

    -- " Git inegration
    use 'tpope/vim-fugitive'
    use 'sindrets/diffview.nvim'
    use { 'almo7aya/openingh.nvim', tag = 'v1.0.1' }
    use { 'lewis6991/gitsigns.nvim', require('gitsigns').setup {
        signcolumn = false,
        yadm = { enable = true },
    } }

    -- Functions tree
    use 'liuchengxu/vista.vim'

    -- "Super-completado html
    use 'mattn/emmet-vim'

    -- Neovim Cmp (completition engine)
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'onsails/lspkind.nvim'
    -- use({ 'tzachar/cmp-tabnine', run = './install.sh' }) -- tabline

    -- Tree sitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    -- use 'nvim-treesitter/nvim-treesitter-context'

    -- Lsp and snippets
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use({ "glepnir/lspsaga.nvim", branch = "main" })
    use 'L3MON4D3/LuaSnip'
    -- use 'rafamadriz/friendly-snippets'
    -- use 'jose-elias-alvarez/null-ls.nvim'
    -- use 'folke/trouble.nvim'

    -- Tabline and status bar
    use 'windwp/windline.nvim'
    use 'alvarosevilla95/luatab.nvim'
    -- use 'nvim-lualine/lualine.nvim'

    -- File search and tree
    use 'ibhagwan/fzf-lua'
    use 'kyazdani42/nvim-tree.lua'
    use 'kevinhwang91/rnvimr'
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
    use { 'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    -- Fonts and icons
    use 'ryanoasis/vim-devicons'
    use 'fugalh/desert.vim'
    use 'nvim-tree/nvim-web-devicons'

    -- Themes, GUI and customization
    use 'stevearc/dressing.nvim' -- better custom gui
    use 'folke/zen-mode.nvim'
    use 'jacoborus/tender.vim'
    use 'luisiacc/gruvbox-baby'
    -- use 'EdenEast/nightfox.nvim'
    -- use 'dstein64/nvim-scrollview', { 'branch': 'main' }

    -- Pareado (){}""'' y ayudas de indentacion
    use 'windwp/nvim-autopairs'
    use 'b3nj5m1n/kommentary'
    use 'tpope/vim-surround'
    use 'lukas-reineke/indent-blankline.nvim'

    -- Utilities
    use 'jakewvincent/mkdnflow.nvim' -- wiki
    use({ "uga-rosa/ccc.nvim", branch = "0.7.2" }) -- colorpicker and colorizer
    use 'folke/todo-comments.nvim'
    use 'szw/vim-maximizer'
    use 'beauwilliams/focus.nvim'
    -- use 'ellisonleao/glow.nvim', {'branch': 'main'}
    -- use 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
    -- use 'mbbill/undotree'

    -- debuggers
    use 'rcarriga/nvim-dap-ui'
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'mfussenegger/nvim-dap-python'
    -- use 'michaelb/sniprun', {'do': 'bash install.sh'}

    -- LaTex support
    -- use 'lervag/vimtex'
end)

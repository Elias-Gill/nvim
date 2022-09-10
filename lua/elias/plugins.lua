-- ------------- PLUGINS ------------
require("mason").setup()
return require'packer'.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim' -- super load speed

    use 'nvim-lua/plenary.nvim' -- Custom libraries for neovim
    use 'ThePrimeagen/harpoon'
    use 'Asheq/close-buffers.vim'
    use 'romainl/vim-cool'
    -- use 'ThePrimeagen/refactoring.nvim'

    --  Start page
    use 'mhinz/vim-startify'
    use 'dstein64/vim-startuptime'

    -- " Git inegration
    use 'tpope/vim-fugitive'
    -- use 'lewis6991/gitsigns.nvim'
    -- use 'APZelos/blamer.nvim'

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
    use({ 'tzachar/cmp-tabnine', run = './install.sh' }) -- tabline

    -- Tree sitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-context'

    -- Lsp and snippets
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'folke/trouble.nvim'
    use({ "glepnir/lspsaga.nvim", branch = "main" })
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- Tabline and status bar
    use 'windwp/windline.nvim'

    -- File search and tree
    use 'ibhagwan/fzf-lua'
    use 'kyazdani42/nvim-tree.lua'
    use 'kevinhwang91/rnvimr'
    -- use 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    -- use 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    -- Fonts and icons
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'

    -- Themes, GUI and customization
    -- use 'EdenEast/nightfox.nvim'
    -- use 'dstein64/nvim-scrollview', { 'branch': 'main' }

    -- Pareado (){}""'' y ayudas de indentacion
    use 'windwp/nvim-autopairs'
    use 'b3nj5m1n/kommentary'
    use 'tpope/vim-surround'
    use 'lukas-reineke/indent-blankline.nvim'

    -- Utilities
    use 'jakewvincent/mkdnflow.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'folke/todo-comments.nvim'
    -- use 'ellisonleao/glow.nvim', {'branch': 'main'}

    use 'szw/vim-maximizer'
    use 'beauwilliams/focus.nvim'

    -- use 'michaelb/sniprun', {'do': 'bash install.sh'}
    -- use 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
    -- use 'mbbill/undotree'

    -- debuggers
    use 'rcarriga/nvim-dap-ui'
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'mfussenegger/nvim-dap-python'
end)

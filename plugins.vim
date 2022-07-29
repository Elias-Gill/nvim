call plug#begin('~/.config/nvim/plugged') 
"-----------------------PLUGINS---------------------------------
" Navigation with a lot of coconut oil
Plug 'nvim-lua/plenary.nvim' "Custom libraries for neovim 
Plug 'ThePrimeagen/harpoon'
Plug 'Asheq/close-buffers.vim'
Plug 'romainl/vim-cool'
" Plug 'ThePrimeagen/refactoring.nvim'

" Start page
Plug 'mhinz/vim-startify'
Plug 'dstein64/vim-startuptime'

" Git inegration
Plug 'tpope/vim-fugitive'
" Plug 'lewis6991/gitsigns.nvim'
" Plug 'APZelos/blamer.nvim'

" Functions tree
Plug 'liuchengxu/vista.vim'

"Super-completado html
Plug 'mattn/emmet-vim'

" Neovim Cmp (completition engine)
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
Plug 'onsails/lspkind.nvim'
"Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' } "tabnine AI autocomplete
"Plug 'SirVer/ultisnips'
"Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Tree sitter 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

"Lsp and snippets
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'folke/trouble.nvim'
Plug 'tami5/lspsaga.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

"Tabline and status bar
Plug 'windwp/windline.nvim'

"File search and tree
Plug 'ibhagwan/fzf-lua'
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'kevinhwang91/rnvimr'

" Fonts and icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Themes, colororschemes and customization
Plug 'elias-gill/newshell.nvim'
Plug 'NLKNguyen/papercolor-theme'

" Pareado (){}""'' y ayudas de indentacion
Plug 'windwp/nvim-autopairs'
Plug 'b3nj5m1n/kommentary' 
Plug 'lukas-reineke/indent-blankline.nvim'

" Utilities
Plug 'vimwiki/vimwiki'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'folke/todo-comments.nvim'
Plug 'tpope/vim-surround'
Plug 'szw/vim-maximizer'
Plug 'ellisonleao/glow.nvim', {'branch': 'main'}

" Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
" Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
" Plug 'puremourning/vimspector'

" debuggers
Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'mfussenegger/nvim-dap-python'

call plug#end()
"-------------------------------------------------------


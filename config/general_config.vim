" --- opciones visuales ---
set fillchars+=diff:╱
set termguicolors
set laststatus=3
set winbar=%=%f%m
"set cmdheight=0

" --- lsp ---
set diffopt+=vertical
let g:python3_host_prog = '/bin/python3.10'
set completeopt=menuone,noselect

" --- folding ---
set nofoldenable
set foldexpr=nvim_treesitter#foldexpr()
set foldmethod=expr

" --- indentation ---
set nolist
set smartindent
set autoindent

" --- no molestar ---
set confirm
set hidden

" --- mouse y numeros ---
set mouse=a
set mousemodel=extend
set numberwidth=4 
set nu
set clipboard=unnamedplus
set cursorline
set shortmess+=c
set lazyredraw

" --- wraping ---
set wm=15
set wrap linebreak
set colorcolumn=125
set tw=125
set splitbelow splitright

" --- Visuales ---
set scrolloff=3
set showmode
set showcmd

" --- Tabs to spaces ---
set tabstop=4
set softtabstop=4
set expandtab
set sw=4

" --- For plug-ins to load correctly. ---
filetype plugin indent on
set backspace=indent,eol,start
set encoding=utf-8

" --- search settings ---
set matchpairs+=<:>
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" colorscheme
let g:newshell_background="None"
colorscheme newshell

" cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" emmet html
let g:user_emmet_mode='i'
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue,svelte EmmetInstall
let g:user_emmet_leader_key=','

" python
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0

" indent blank line
let g:indent_blankline_filetype = ["java", "lua", "vue", "python", "html", "c", "svelte" ]
let g:indent_blankline_char_list = ['┆']
let g:indent_blankline_context_char = '┆' 

" Pseudo lector de pdf 
augroup readPdf
    autocmd BufReadPre *.pdf set ro nowrap
    autocmd BufReadPost *.pdf silent %!pdftotext "%" -nopgbrk -layout -q -eol unix -
    autocmd BufWritePost *.pdf silent !rm -rf ~/PDF/%
    autocmd BufWritePost *.pdf silent !lp -s -d pdffg "%"
    autocmd BufWritePost *.pdf silent !until [ -e ~/PDF/% ]; do sleep 1; done
    autocmd BufWritePost *.pdf silent !mv ~/PDF/% %:p:h
augroup END

" Parser para archivos Json desordenados
command JsonParse :%!python3.9 -m json.tool
" Borrar buffers sin usar
command Bw :wa | Bwipeout hidden
command W :w

" Bracey
" let g:bracey_browser_command="firefox"
" let g:CoolTotalMatches = 0


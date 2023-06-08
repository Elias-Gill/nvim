" --- folding ---
set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldtext=CustomFoldText()
function! CustomFoldText()
  let indentation = indent(v:foldstart - 1)
  let linetext = substitute(getline(v:foldstart),"^ *","",0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("+--", v:foldlevel)
  let expansionString = repeat(" ", indentation)
  return expansionString . foldLevelStr . linetext . foldSizeStr
endfunction

" --- indentation ---
set diffopt+=vertical
set nolist
set smartindent
set autoindent
let g:indent_blankline_filetype_exclude = ["dashboard", "startify", "vim", "markdown", "txt"]
let g:indent_blankline_char_list = ['┆']
let g:indent_blankline_context_char = '┆' 
let g:indent_blankline_use_treesitter = v:true

" --- specials & do not disturb ---
set confirm
set hidden
set shortmess+=c
set undofile
set clipboard=unnamedplus
set cmdheight=1

" --- mouse y numeros ---
set nu rnu
set mouse=a
set mousemodel=extend
set numberwidth=4 
set cursorline
" set nu

" --- wraping ---
set tw=125
set wrap linebreak
set colorcolumn=125
set splitbelow splitright
set splitkeep=screen

" --- Visuales ---
set showcmd
set showmode
set scrolloff=4
set laststatus=3
set winbar=%=%f%m
set termguicolors
set signcolumn=yes
set fillchars=fold:\ 
set fillchars+=diff:╱
set completeopt=menuone,noselect
set fillchars+=foldopen:▾,foldsep:│,foldclose:▸
au TermOpen * setlocal nonumber norelativenumber
au TextYankPost * silent! lua vim.highlight.on_yank()

" cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" --- Tabs to spaces ---
set tabstop=4 softtabstop=4
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
" colorscheme newshell

" emmet html
let g:user_emmet_mode='i'
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','

" undotree
let g:undotree_WindowLayout = 3

" python
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0
let g:python3_host_prog = '/bin/python3.10'

" open binary files with the default application
augroup binFiles
    autocmd BufReadCmd *.pdf call XdgOpen()
    autocmd BufReadCmd *.jpg call XdgOpen()
    autocmd BufReadCmd *.png call XdgOpen()
    autocmd BufReadCmd *.mp3 call XdgOpen()
    autocmd BufReadCmd *.mp4 call XdgOpen()
    autocmd BufReadCmd *.xls call XdgOpen()
    autocmd BufReadCmd *.xlsx call XdgOpen()
augroup END
function XdgOpen()
    let fn = expand("%:p")
    let bnumber = bufnr(fn)
    execute ":execute 'normal \<c-o>'"
    call jobstart("xdg-open " .'"'. fn .'"')
    execute ":Bw"
endfunction

" Borrar buffers sin usar
command Bw :wa | Bwipeout hidden
command W :w
command Q :q

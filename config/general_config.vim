" -- neovim 0.8 specific
if has('nvim')
    set laststatus=3
    set winbar=%=%f%m
    au TextYankPost * silent! lua vim.highlight.on_yank()
else 
    set laststatus=2
endif

" --- lsp ---
set diffopt+=vertical
let g:python3_host_prog = '/bin/python3.10'
set completeopt=menuone,noselect

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
set nolist
set smartindent
set autoindent
let g:indent_blankline_filetype_exclude = ["startify", "vim", "markdown", "txt"]
let g:indent_blankline_char_list = ['┆']
let g:indent_blankline_context_char = '┆' 
" let g:indent_blankline_filetype = ["java", "lua", "vue", "python", "html", "c", "svelte" ]

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
set wm=15
set wrap linebreak
set colorcolumn=125
set tw=125
set splitbelow splitright

" --- Visuales ---
set scrolloff=4
set showmode
set showcmd
set termguicolors
set signcolumn=yes
set fillchars+=diff:╱
set fillchars+=foldopen:▾,foldsep:│,foldclose:▸
set fillchars=fold:\ 
au TermOpen * setlocal nonumber norelativenumber

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
" help tags on a new tab
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'

" colorscheme
let g:newshell_background="None"
" colorscheme newshell

" cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" emmet html
let g:user_emmet_mode='i'
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','

" python
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0

" undotree
let g:undotree_WindowLayout = 3

" open non plain files with the default application
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

" Parser para archivos Json desordenados
command JsonParse :%!python3.9 -m json.tool
" Borrar buffers sin usar
command Bw :wa | Bwipeout hidden
command W :w
command Q :q

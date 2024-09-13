-- cosas que no me animo a cambiar
vim.cmd([[
" emmet configuration
let g:user_emmet_mode='i'
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','

" good looking yank
au TextYankPost * silent! lua vim.highlight.on_yank()

" some quickfix things
au TermOpen * setlocal nonumber norelativenumber
au QuickFixCmdPost *grep* cwindow

" grep alias
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'

colorscheme oldworld

set fillchars+=foldopen:▾,foldsep:│,foldclose:▸
set diffopt+=vertical
set shortmess+=c
set clipboard=unnamedplus

set fillchars=fold:\ 
set fillchars+=diff:╱
set completeopt=menuone,noselect

" Borrar buffers sin usar
command Bw :wa | BWipeout hidden
command W :w
command Q :q

"-- cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
]])

--- grep command ---
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.o.grepformat = "%f:%l:%c:%m,%f|%l col %c|%m"

--- indentation ---
vim.opt.list = false
vim.opt.smartindent = true
vim.opt.autoindent = true

--- specials & do not disturb ---
vim.opt.confirm = true
vim.opt.hidden = true
vim.opt.undofile = true
vim.opt.jumpoptions = "stack"
vim.opt.cmdheight = 1

--- mouse ands line numbers ---
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.opt.mousemodel = "extend"
vim.opt.numberwidth = 4
vim.o.cursorline = true

--- wraping ---
vim.o.tw = 110
vim.o.wrap = true
vim.o.linebreak = true
vim.o.colorcolumn = "80"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.splitkeep = "screen"

--- folding ---
vim.o.foldenable = false
vim.o.foldlevelstart = 99
vim.o.foldmethod = "indent"
-- vim.o.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

--- Visuals ---
vim.o.showcmd = true
vim.o.showmode = true
vim.o.scrolloff = 4
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.laststatus = 3
vim.o.showbreak = "| "
vim.o.background = "dark"
-- vim.o.winbar = "%=%f%m"

--- Tabs to spaces ---
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.sw = 4

--- search settings ---
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = "split"

-- python
vim.g.python_highlight_all = 1
vim.g.python_highlight_space_errors = 0

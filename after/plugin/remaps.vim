let g:terminal_path = getcwd()

inoremap <C-\> <C-w>
nnoremap U <C-r> 

"saving files and exit vim
nnoremap <leader>wf :w!<CR> 
nnoremap <leader>wa :wa<cr>
nnoremap <leader>qa :qa<cr>
nnoremap <leader>qf :q!<CR>
"save all buffers, format and quit
nnoremap <leader>tt :Bw<cr> :qa<cr> 

" grep functions (they may override when lsp is on)
nnoremap <leader>g :silent grep! 
nnoremap gr :silent grep! <c-r><c-w> **<cr>
vnoremap gr y:silent grep! <c-r>" **<cr>

"file managers
nnoremap <silent> - :Explore<CR>
nnoremap <silent><leader>nt :Lexplore \| vertical resize 40<CR>
nnoremap <silent><c-p> :lua FindFiles()<cr>

"cicling buffers
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

"renombrar buffer usar arg y argdo para refactor completo
nnoremap <leader>rn :%s/
vnoremap <leader>rn :s/

"rename utils
nnoremap <leader>rw yiw:%s/<c-r>"//g<left><left>
vnoremap <leader>rw y:%s/<c-r>"//g<left><left>

"todo comments
nnoremap <silent><leader>tg :TodoQuickFix<CR>

"quickfix utils
nnoremap ]q :cnext<cr>
nnoremap [q :cprev<cr>
nnoremap <expr><silent><leader>co empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>:lclose<CR>'
nnoremap <expr><silent><leader>lo empty(filter(getwininfo(), 'v:val.quickfix')) ? ':lopen<CR>' : ':lclose<CR>:cclose<CR>'

"cambiar pestanas
nnoremap <leader>tn :tabnew<cr>

"centrar en saltos
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-t> <C-t>zz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" scroll
nnoremap <C-y> <C-e>
nnoremap <C-b> <C-y>

"primeagen cool remap to move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

"epic delete/paste utility
vnoremap <leader>p "_dP
nnoremap <leader>p "_dP
vnoremap <leader>d "_dD
nnoremap x "_x
"copy and paste with center and indent
vnoremap y ygv<esc>
nnoremap p p=`]

"increments a decrements
" nnoremap + <C-a>
" nnoremap - <C-x>

"teclas arriba y abajo en insert mode
inoremap <C-j> <down>
inoremap <C-k> <up>

"Moverse entre splits
nnoremap <silent><C-j> <c-w>j
nnoremap <silent><C-k> <c-w>k
nnoremap <silent><C-h> <c-w>h
nnoremap <silent><C-l> <c-w>l

"Crear splits unificado con Tmux
nnoremap <silent><C-w>\ :vsplit<cr>
nnoremap <silent><C-w>- :split<cr>

"block the arrow keys
nnoremap <up> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
nnoremap <down> <nop>

"resize splits with arrow keys
nnoremap <silent><up> :resize +5<CR>
nnoremap <silent><down> :resize -5<CR>
nnoremap <silent><left> :vertical resize -5<CR>
nnoremap <silent><right> :vertical resize +5<CR>

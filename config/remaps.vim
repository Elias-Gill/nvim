let mapleader = " "

nnoremap ;; A;<esc>
tnoremap <esc> <c-\><c-N>
inoremap <C-\> <C-w>
nnoremap U <C-r> 

" harpoon
nnoremap <silent><leader>' :lua require("harpoon.ui").nav_next()<cr>
nnoremap <silent><leader>; :lua require("harpoon.ui").nav_prev()<cr>
nnoremap <silent><leader>hh :lua require("harpoon.mark").add_file()<cr>
nnoremap <silent><leader>hu :lua require("harpoon.ui").toggle_quick_menu()<cr>

"saving files and exit vim
nnoremap <leader>w :w<CR>
nnoremap <leader>wf :w!<CR>
nnoremap <leader>tt :wqa <cr>
nnoremap <leader>wa :wa<cr>
nnoremap <leader>qa :qa<cr>
nnoremap <leader>qf :q!<CR>

" busqueda de archivos
nnoremap <C-p> :FzfLua files<CR>
nnoremap <C-s> :FzfLua files cwd=~/<CR>
nnoremap <leader>nt :NvimTreeFindFileToggle<CR>
nnoremap <leader>rt :RnvimrToggle<CR>

" cicling buffers
nnoremap <leader>[ :bprevious<CR>
nnoremap <leader>] :bnext<CR>

"teclas de movimiento
nnoremap b w
nnoremap w b
vnoremap b w
vnoremap w b

nnoremap <s-l> 5j
nnoremap <s-h> 5k 
vnoremap <s-l> 5j
vnoremap <s-h> 5k 

"renombrar buffer usar arg y argdo para refactor completo
nnoremap <leader>lp :%s/
vnoremap <leader>lp :s/

"Live Server 
nnoremap <leader>sb :Bracey<CR>

" Buscar funciones y definiciones 
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr :FzfLua lsp_references<CR>
nnoremap <silent>=f :lua vim.lsp.buf.format ({ async = true })<CR>
nnoremap <silent> gi :FzfLua lsp_implementations<CR>

" Trouble and todos comments
nnoremap <silent><leader>to :TroubleToggle<CR>
nnoremap <silent><leader>tg :TodoTrouble<CR>

" diagnostics navigation
nnoremap <silent>[e :Lspsaga diagnostic_jump_prev<cr>
nnoremap <silent>]e :Lspsaga diagnostic_jump_next<cr>
nnoremap <silent>]t :Lspsaga show_line_diagnostics<cr>
nnoremap <silent><leader>rr :lua vim.lsp.buf.rename()<CR>
nnoremap <silent>co :Lspsaga code_action<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
inoremap <silent><c-p> <c-o>:Lspsaga signature_help<CR>
nnoremap <silent>gh :Lspsaga lsp_finder<CR>

"cambiar pestanas
nnoremap <leader>tn :tabnew<cr>
nnoremap <S-tab> gT
nnoremap <TAB> gt

"utilidades
nnoremap n nzzzv
nnoremap N Nzzzv
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv
nnoremap <cr> o<esc>k
nnoremap <C-cr> O<esc>

" teclas arriba y abajo en insert mode
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" Moverse entre splits
" nnoremap <silent><leader>mb :call WindowSwap#EasyWindowSwap()<CR>
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l
nnoremap <C-h> <c-w>h

"Archivos de configuracion
nnoremap <leader>cd :cd %:h <CR>
nnoremap <silent><leader>so :so $MYVIMRC<CR>
nnoremap <silent><leader>SO :tabnew $MYVIMRC<CR>
nnoremap <silent><leader>sm :e ~/.config/nvim/config/remaps.vim<CR>
nnoremap <silent><leader>sp :e ~/.config/nvim/plugins.vim<CR>

" function tree
nnoremap <leader>vf :Vista nvim_lsp <CR>
nnoremap <leader>vt :Vista finder nvim_lsp <CR>

" git
nnoremap <leader>gs :G<CR>
nnoremap <leader>1 :Gdiffsplit!<CR>
nnoremap <leader>2 :diffget //2<CR>
nnoremap <leader>3 :diffget //3<CR>

" block the arrow keys
nnoremap <up> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
nnoremap <down> <nop>
" resize splits with arrow keys
nnoremap <silent><up> :resize +5<CR>
nnoremap <silent><down> :resize -5<CR>
nnoremap <silent><left> :vertical resize -5<CR>
nnoremap <silent><right> :vertical resize +5<CR>
" maximizer
nnoremap <leader>mt :MaximizerToggle<cr>

" Debug
nnoremap <silent><F7> :lua require'dap'.step_into()<cr>
nnoremap <silent><F6> :lua require'dap'.step_over()<cr>
nnoremap <silent><leader>db :lua require'dap'.continue()<Cr>
nnoremap <silent><leader>du :lua require'dap'.toggle_breakpoint()<Cr>
nnoremap <silent><leader>ds :lua require'dap'.terminate()<Cr>
nnoremap <silent><leader>df :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>
nnoremap <silent><leader>dc :lua require'dap'.run_to_cursor()<Cr>

" Luasnips snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
" For changing choices in choiceNodes
" imap <silent><expr> <C-e> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
" smap <silent><expr> <C-e> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

nnoremap <leader><leader>s :so ~/.config/nvim/lua/elias/lsp/luasnips.lua <CR>
autocmd FileType markdown nnoremap <buffer><leader>gg :Glow <CR>

" bug 
nnoremap <C-i> <C-i>zz

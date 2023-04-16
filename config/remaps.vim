let mapleader = " "
let g:terminal_path = getcwd()

" nnoremap ;; A;<esc>
inoremap <C-\> <C-w>
nnoremap U <C-r> 
tnoremap <esc> <c-\><c-N>

"harpoon
nnoremap <silent><leader>' :lua require("harpoon.ui").nav_next()<cr>
nnoremap <silent><leader>; :lua require("harpoon.ui").nav_prev()<cr>
nnoremap <silent><leader>hh :lua require("harpoon.mark").add_file()<cr>
nnoremap <silent><leader>hu :lua require("harpoon.ui").toggle_quick_menu()<cr>

"git worktree
" nnoremap <silent><leader>gd :lua require('telescope').extensions.git_worktree.git_worktrees()<cr>
" nnoremap <silent><leader>gn :lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>

"saving files and exit vim
nnoremap <leader>wf :w!<CR> 
nnoremap <leader>wa :wa<cr>
nnoremap <leader>qa :qa<cr>
nnoremap <leader>qf :q!<CR>
nnoremap <leader>qq :q<CR>
"save all buffers, format and quit
nnoremap <leader>tt :Bw<cr> :qa<cr> 
" nnoremap <leader>tt :autocmd BufWritePre * lua vim.lsp.buf.format()<cr> :Bw<cr> :qa<cr> 

"file fuzzy searching
nnoremap <silent><C-p> :FzfLua files<CR>
nnoremap <silent><C-f> :exe ":FzfLua files cwd=".g:terminal_path<CR>
nnoremap <silent><C-s> :FzfLua<CR>
nnoremap <silent><C-S-s> :FzfLua files cwd=~/<CR>

"file managers
nnoremap <silent><leader>nt :NvimTreeFindFileToggle<CR>
nnoremap <silent><leader>rt :RnvimrToggle<CR>

"cicling buffers
nnoremap <leader>[ :bprevious<CR>
nnoremap <leader>] :bnext<CR>

"new terminal
noremap <C-w>t :botright vnew <Bar> :terminal<cr>
" noremap <leader>th :botright new <Bar> :terminal<cr>

"renombrar buffer usar arg y argdo para refactor completo
nnoremap <leader>lp :%s/
vnoremap <leader>lp :s/

"Buscar funciones y definiciones 
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>zz
nnoremap <silent> gy :lua vim.lsp.buf.type_definition()<CR>zz
nnoremap <silent> gr :Telescope lsp_references<CR>
nnoremap <silent> gi :FzfLua lsp_implementations<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent>co :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><leader>rr :lua vim.lsp.buf.rename()<CR>
"more lsp actions
nnoremap <silent>gh :Lspsaga lsp_finder<CR>
nnoremap <silent> =f :lua vim.lsp.buf.format ({ async = true })<CR>

"Diagnostics
nnoremap <silent><leader>to :lua vim.diagnostic.setqflist()<CR>
nnoremap <silent>[e :Lspsaga diagnostic_jump_prev<cr>
nnoremap <silent>]e :Lspsaga diagnostic_jump_next<cr>
nnoremap <silent>]t :Lspsaga show_line_diagnostics<cr>
"todo comments
nnoremap <silent><leader>tg :TodoQuickFix<CR>

"cambiar pestanas
nnoremap <leader>tn :tabnew<cr>
nnoremap <S-tab> :tabprevious<cr>
nnoremap <tab> :tabnext<cr>
nnoremap <leader>zm :ZenMode<cr>

"centrar en saltos
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> zz<C-d>zz
nnoremap <C-u> zz<C-u>zz
nnoremap <C-t> <C-t>zz
nnoremap <C-o> <C-o>zz

"primeagen cool remap to move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

"add spaces with 'enter' on normal mode
nnoremap <cr> o<esc>k
nnoremap <C-cr> O<esc>

"epic delete/paste utility
vnoremap <leader>p "_dP
nnoremap <leader>p "_dP
vnoremap <leader>d "_dD
nnoremap x "_x

"increments a decrements
nnoremap + <C-a>
nnoremap - <C-x>

"teclas arriba y abajo en insert mode
inoremap <C-j> <down>
inoremap <C-k> <up>

"Moverse entre splits
nnoremap <silent><C-j> :TmuxNavigateDown<cr>
nnoremap <silent><C-k> :TmuxNavigateUp<cr>
nnoremap <silent><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent><C-l> :TmuxNavigateRight<cr>

"Crear splits unificado con Tmux
nnoremap <silent><C-w>\ :vsplit<cr>
nnoremap <silent><C-w>- :split<cr>

"Archivos de configuracion
nnoremap <leader>cd :cd %:h <CR>
nnoremap <silent><leader>SO :e ~/.config/nvim/lua/elias/indice.lua<CR>
nnoremap <silent><leader>sm :e ~/.config/nvim/config/remaps.vim<CR>
nnoremap <silent><leader>sp :e ~/.config/nvim/lua/elias/plugins/init.lua<CR>
nnoremap <silent><leader>sO :e $MYVIMRC<CR>
nnoremap <silent><leader>so :so $MYVIMRC<CR>

"abrir wiki
nnoremap <silent><leader>ww :call OpenWiki()<cr>

"function tree
nnoremap <silent><leader>vf :SymbolsOutline<CR>
nnoremap <leader>ut :UndotreeToggle<cr>

"git
nnoremap <leader>gs :G<CR>
nnoremap <leader>do :DiffviewOpen<CR>
nnoremap <leader>dp :DiffviewClose<CR>

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
"maximizer and focus
nnoremap <leader>mt :MaximizerToggle<cr>
nnoremap <leader>ft :FocusToggle<cr>

"Debug
nnoremap <silent><leader>db :DapContinue<Cr>
nnoremap <silent><F7> :lua require'dapstep_into()<cr>
nnoremap <silent><F6> :lua require'dap'.step_over()<cr>
nnoremap <silent><leader>du :lua require'dap'.toggle_breakpoint()<Cr>
nnoremap <silent><leader>ds :lua require'dap'.terminate()<Cr>
nnoremap <silent><leader>df :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>
nnoremap <silent><leader>dc :lua require'dap'.run_to_cursor()<Cr>

"Luasnips snippets
inoremap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
"inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

" --- For changing choices in choiceNodes --- 
imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

"bug with alacritty when using C-i (does not work with tmux)
nnoremap <C-i> <C-i>zz

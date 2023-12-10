let mapleader = " "
let g:terminal_path = getcwd()

inoremap <C-\> <C-w>
nnoremap U <C-r> 

"harpoon
" nnoremap <silent><leader>' :lua require("harpoon-core.ui").nav_next()<cr>
" nnoremap <silent><leader>; :lua require("harpoon-core.ui").nav_prev()<cr>
" nnoremap <silent><leader>hh :lua require("harpoon-core.mark").add_file()<cr>
" nnoremap <silent><leader>hu :lua require("harpoon-core.ui").toggle_quick_menu()<cr>

nnoremap <silent><leader>hh :lua require("harpoon"):list():append()<cr>
nnoremap <silent><leader>hu :lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<cr>
nnoremap <silent><leader>' :lua require("harpoon"):list():next()<cr>
nnoremap <silent><leader>; :lua require("harpoon"):list():prev()<cr>

"saving files and exit vim
nnoremap <leader>wf :w!<CR> 
nnoremap <leader>wa :wa<cr>
nnoremap <leader>qa :qa<cr>
nnoremap <leader>qf :q!<CR>
nnoremap <leader>qq :q<CR>
"save all buffers, format and quit
nnoremap <leader>tt :Bw<cr> :qa<cr> 

"file fuzzy searching
" nnoremap <silent><C-p> :FzfLua files<CR>
" nnoremap <silent><leader>f :FzfLua live_grep<CR>
" nnoremap <silent><C-f> :exe ":FzfLua files cwd=".g:terminal_path<CR>
" nnoremap <silent><C-s> :FzfLua<CR>

"file fuzzy searching
nnoremap <silent><C-p> :Files<CR>
nnoremap <silent><leader>f :RG<CR>
vnoremap <silent><leader>f y:RG <c-r>"<CR>
nnoremap <silent><C-f> :exe ":Files ".g:terminal_path<CR>
nnoremap <silent><leader>of :History<cr>

"file managers
nnoremap <silent><leader>rt :Yazi<CR>
nnoremap <silent><leader>nt :NvimTreeFindFileToggle<CR>

"cicling buffers
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

"renombrar buffer usar arg y argdo para refactor completo
nnoremap <leader>lp :%s/
vnoremap <leader>lp :s/

"todo comments
nnoremap <silent><leader>tg :TodoQuickFix<CR>
nnoremap <silent><leader>co :copen<CR>
nnoremap <silent><leader>lo :lopen<CR>

"cambiar pestanas
nnoremap <leader>tn :tabnew<cr>
nnoremap t[ :tabprevious<cr>
nnoremap t] :tabnext<cr>

"centrar en saltos
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-t> <C-t>zz
nnoremap <C-o> <C-o>zz
"bug with alacritty when using C-i (does not work with tmux)
nnoremap <C-i> <C-i>zz

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
nnoremap <silent><leader>sm :e $XGD_CONFIG_HOME/nvim/after/plugin/remaps.vim<CR>
nnoremap <silent><leader>sp :e $XGD_CONFIG_HOME/nvim/lua/elias/plugins/init.lua<CR>
nnoremap <silent><leader>SO :e $MYVIMRC<CR>
nnoremap <silent><leader>so :so $MYVIMRC<CR>

"abrir wiki
nnoremap <silent><leader>ww :call OpenWiki()<cr>
nnoremap <silent><leader>wo :e ~/Documentos/wiki/index.md<cr>

"function tree
nnoremap <silent><leader>vf :SymbolsOutline<CR>
nnoremap <leader>ut :UndotreeToggle<cr>

"git
nnoremap <leader>gs :G<CR>
nnoremap <leader>do :DiffviewOpen<CR>
nnoremap <leader>dO :DiffviewClose<CR>

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
"maximizer
nnoremap <leader>mt :MaximizerToggle<cr>

"Debug
nnoremap <silent><leader>db :DapContinue<Cr>
nnoremap <silent><F7> :lua require'dap'.step_into()<cr>
nnoremap <silent><F6> :lua require'dap'.step_over()<cr>
nnoremap <silent><leader>du :lua require'dap'.toggle_breakpoint()<Cr>
nnoremap <silent><leader>ds :lua require'dap'.terminate()<Cr>
nnoremap <silent><leader>df :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>
nnoremap <silent><leader>dc :lua require'dap'.run_to_cursor()<Cr>

"Luasnips snippets
inoremap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 

" --- For changing choices in choiceNodes --- 
inoremap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
snoremap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

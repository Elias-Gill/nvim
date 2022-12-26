source ~/.config/nvim/plugins.vim
lua require('impatient')

if exists('g:neovide')
    source ~/.config/nvim/config/neovide.vim
end

"color themes
set termguicolors
let g:newshell_background="None"
colorscheme newshell

" ----- archivos vimL -----
source ~/.config/nvim/config/general_config.vim
source ~/.config/nvim/config/remaps.vim
source ~/.config/nvim/config/startify.vim

" ----- archivos lua ------
" buitin lsp
lua require('elias/lsp/nvim_cmp') 
lua require('elias/lsp/trouble') 
lua require('elias/lsp/luasnips') 
lua require('elias/lsp/lsp_general') 
lua require('elias/lsp/debug') 

" utils
lua require('elias/utils/windline') 
lua require('elias/utils/disable_builtins') 
lua require('elias/utils/various-utils') 
" lua require('elias/utils/gitsigns') 
" lua require('elias/utils/sniprun') 

" navigation
lua require('elias/navigation/treesitter') 
lua require('elias/navigation/todo') 
lua require('elias/navigation/fzf') 
lua require('elias/navigation/nvimtree')
" ----------------------------

"emmet html
let g:user_emmet_mode='i'
autocmd FileType html,css,vue EmmetInstall
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','

let g:bracey_browser_command="firefox"
let g:CoolTotalMatches = 0

"python
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0

let g:vimwiki_list = [{'path': '~/.local/share/vimwiki/',
            \ 'syntax': 'markdown', 'ext': '.md'}]

let g:indent_blankline_filetype = ["Java", "lua", "vue", "python", "html", "c", "svelte" ]
let g:indent_blankline_char_list = ['┆']
let g:indent_blankline_context_char = '┆' 
hi IndentBlanklineContextChar guifg=#ab9457

" Pseudo lector de pdf 
" augroup readPdf
"     autocmd BufReadPre *.pdf set ro nowrap
"     autocmd BufReadPost *.pdf silent %!pdftotext "%" -nopgbrk -layout -q -eol unix -
"     autocmd BufWritePost *.pdf silent !rm -rf ~/PDF/%
"     autocmd BufWritePost *.pdf silent !lp -s -d pdffg "%"
"     autocmd BufWritePost *.pdf silent !until [ -e ~/PDF/% ]; do sleep 1; done
"     autocmd BufWritePost *.pdf silent !mv ~/PDF/% %:p:h
" augroup END

" hi Scrollview guifg=None guibg=#464646

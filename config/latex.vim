let g:vimtex_view_method = 'zathura'
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_compiler_method = 'latexrun'

augroup texCompile filetype tex
    autocmd BufWritePost *.tex :VimtexCompile
    autocmd BufEnter *.tex setlocal nowrap
augroup END

" let maplocalleader

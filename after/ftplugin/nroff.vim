function Compile()
    execute 'w! ~/.cache/inter.nroff'
    call jobstart("groff -me -t -T ps -dpaper=a4 ~/.cache/inter.nroff > ~/.cache/inter.ps && ps2pdf ~/.cache/inter.ps entrega.pdf")
endfunction

autocmd BufWritePost <buffer> call Compile()

function Contents()
    execute 'vimgrep "\.\\\"" %'
endfunction

nnoremap <buffer><leader>co :call Contents()<cr>

setlocal linebreak
setlocal textwidth=95
setlocal colorcolumn=95
setlocal wrap
setlocal foldmethod=manual
colorscheme retrobox
" setlocal spell spelllang=es

nnoremap <buffer>k gk
nnoremap <buffer>j gj
nnoremap <buffer>gk k
nnoremap <buffer>gj j
nnoremap <buffer>C cg$

vnoremap <buffer>k gk
vnoremap <buffer>j gj
vnoremap <buffer>gk k
vnoremap <buffer>gj j

nnoremap <buffer>^ g^
nnoremap <buffer>$ g$

vnoremap <buffer>^ g^
vnoremap <buffer>$ g$

nnoremap <buffer>p p

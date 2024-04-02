setlocal linebreak
setlocal textwidth=95
setlocal wrap
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

vnoremap <cr> <Plug>Markdown_CreateLink
nnoremap <buffer><A-space> <Plug>Markdown_Checkbox

function MdOpen()
    let fn = expand("%:p")
    let bnumber = bufnr(fn)
    call jobstart("md-reader " .'"'. fn .'"')
endfunction

command -buffer MdView call MdOpen()
nnoremap <buffer><leader>op :MdView<cr>

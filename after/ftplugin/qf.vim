"remaps for the QuickFix list
nnoremap <buffer> <Cr> <Cr>
nnoremap <buffer> q :q<cr>

nnoremap <buffer> v <C-w><Enter><C-w>L

" Add buffer mappings for Filter results
let is_ll = get(getwininfo(win_getid())[0], 'loclist', 0)
if is_ll
    nnoremap <buffer> f :Lfilter<Space>
    nnoremap <buffer> F :Lfilter!<Space>
    nnoremap <buffer> [q :lolder<cr>
    nnoremap <buffer> ]q :lnewer<cr>
else
    nnoremap <buffer> f :Cfilter<Space>
    nnoremap <buffer> F :Cfilter!<Space>
    nnoremap <buffer> [q :colder<cr>
    nnoremap <buffer> ]q :cnewer<cr>
endif

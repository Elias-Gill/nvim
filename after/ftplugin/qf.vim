"remaps for the QuickFix list
nnoremap <buffer> <Cr> <Cr>
nnoremap <buffer> q :q<cr>
nnoremap <buffer> [q :colder<cr>
nnoremap <buffer> ]q :cnewer<cr>

nnoremap <buffer> v <C-w><Enter><C-w>L

" Add buffer mappings for Filter results
let wininfo = getwininfo(win_getid())[0]
let is_ll = get(wininfo, 'loclist', 0)

if is_ll
    nnoremap <buffer> f :Lfilter<Space>
    nnoremap <buffer> F :Lfilter!<Space>
else
    nnoremap <buffer> f :Cfilter<Space>
    nnoremap <buffer> F :Cfilter!<Space>
endif

" Recursive mappings (remap = true in Lua)
nmap <silent><buffer> v mf
nmap <silent><buffer> a Ccd%:w<CR>

" Non-recursive mappings (noremap = true in Lua)
nnoremap <silent><buffer> <C-r> <C-l>
nnoremap <silent><buffer> <C-l> :wincmd l<CR>
nnoremap <silent><buffer> <Esc> :q<CR>

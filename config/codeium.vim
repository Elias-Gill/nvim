let g:codeium_disable_bindings = 1
" mappings
imap <script><silent><nowait><expr> <C-l> codeium#Accept()
imap <C-x>   <Cmd>call codeium#Clear()<CR>

function! XdgOpen()
    " Get the current buffer number before opening the file
    let l:prev_buf = bufnr('%')
    
    " Get the full path of the current file
    let l:fn = expand('%:p')
    
    " Open the file using xdg-open
    call jobstart("xdg-open " . '"' . l:fn . '"')
    
    " Echo a message
    echom("Opening file: " . l:fn)

    " Switch back to the previous buffer
    if buflisted(l:prev_buf)
        execute 'buffer ' . l:prev_buf
    endif
    
    " Optionally close the current buffer if you want
    bwipeout!
endfunction

" Open binary files with the default application
augroup binFiles
    autocmd!
    autocmd BufReadCmd *.pdf call XdgOpen()
    autocmd BufReadCmd *.jpg call XdgOpen()
    autocmd BufReadCmd *.jpeg call XdgOpen()
    autocmd BufReadCmd *.webp call XdgOpen()
    autocmd BufReadCmd *.png call XdgOpen()
    autocmd BufReadCmd *.mp3 call XdgOpen()
    autocmd BufReadCmd *.mp4 call XdgOpen()
    autocmd BufReadCmd *.xls call XdgOpen()
    autocmd BufReadCmd *.xlsx call XdgOpen()
    autocmd BufReadCmd *.xopp call XdgOpen()
    autocmd BufReadCmd *.gif call XdgOpen()
    autocmd BufReadCmd *.doc call XdgOpen()
    autocmd BufReadCmd *.docx call XdgOpen()
augroup END

" open binary files with the default application
augroup binFiles
    autocmd BufReadCmd * call XdgOpen()
augroup END

fun! IsBinary2()
    return system('file -ib ' . shellescape(expand('%:p'))) !~# '^text/'
endfun

function XdgOpen()
    if IsBinary2()
        let fn = expand("%:p")
        let bnumber = bufnr(fn)
        execute ":execute 'normal \<c-o>'"
        call jobstart("xdg-open " .'"'. fn .'"')
        execute ":Bw"
    endif
endfunction

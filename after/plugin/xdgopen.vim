" open binary files with the default application
augroup binFiles
    autocmd BufReadCmd *.pdf call XdgOpen()
    autocmd BufReadCmd *.jpg call XdgOpen()
    autocmd BufReadCmd *.png call XdgOpen()
    autocmd BufReadCmd *.mp3 call XdgOpen()
    autocmd BufReadCmd *.mp4 call XdgOpen()
    autocmd BufReadCmd *.xls call XdgOpen()
    autocmd BufReadCmd *.xlsx call XdgOpen()
augroup END
function XdgOpen()
    let fn = expand("%:p")
    let bnumber = bufnr(fn)
    execute ":execute 'normal \<c-o>'"
    call jobstart("xdg-open " .'"'. fn .'"')
    execute ":Bw"
endfunction


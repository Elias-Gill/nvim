function SmoothScroll(up)
    if a:up
        let scrollaction="\<C-b>k"
    else
        let scrollaction="\<C-y>j"
    endif
    exec "normal " . scrollaction
    redraw
    " repeat for smoot action
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 1m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction

nnoremap <silent><C-U> :call SmoothScroll(1)<cr>
nnoremap <silent><C-D> :call SmoothScroll(0)<cr>

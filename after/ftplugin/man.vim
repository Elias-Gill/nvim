function Compile()
    let fn = expand("%:p")
    let bnumber = bufnr(fn)
    call jobstart("groff -ms -rPS=12 -T pdf -f ARI -dpaper=a4 " .'"'.fn.'"'. " > entrega.pdf")
endfunction

nnoremap <buffer>=f :call Compile()<cr>

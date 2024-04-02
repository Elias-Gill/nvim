function! WikiWindow() abort
    " Define the size of the floating window
    let width = float2nr(winwidth(0)/1.4)
    let height = float2nr(winheight(0)/1.4)

    " Create the scratch buffer displayed in the floating window
    let buf = nvim_create_buf(v:false, v:true)

    " Get the current UI
    let ui = nvim_list_uis()[0]

    " Create the floating window
    let opts = {'relative': 'editor',
                \ 'width': width,
                \ 'height': height,
                \ 'col': (ui.width/2) - (width/2),
                \ 'row': (ui.height/2) - (height/2),
                \ 'anchor': 'NW',
                \ 'style': 'minimal',
                \ 'border': 'single',
                \ }
    let win = nvim_open_win(buf, 1, opts)
endfunction

function! OpenWiki() abort
    call WikiWindow()
    execute(":e ~/Documentos/wiki/index.md")
    execute(":lcd %:h")
endfunction

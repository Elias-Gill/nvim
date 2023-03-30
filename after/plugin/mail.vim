function! BreakHabitsWindow() abort
    " Define the size of the floating window
    let width = 160
    let height = 35

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
                \ }
    let win = nvim_open_win(buf, 1, opts)
endfunction

function! OpenMail() abort
    call BreakHabitsWindow()
    execute(":term neomutt")
    execute(":normal i")
endfunction

nnoremap <leader>9 :call OpenMail()<cr>

let g:is_vim = 1

function! TakePic() range
    let s:output = input('Output Name: ')
    " ejecutar
    let s:extension = expand('%:e')
    let s:aux = "/tmp/shot." .s:extension
    execute ":'<,'>w!" .s:aux
    execute ":!silicon ".s:aux." --output ~/Imágenes/".s:output.".jpg"
endfunction

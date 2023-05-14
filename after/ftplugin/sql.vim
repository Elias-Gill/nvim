let s:db = ""
let g:is_vim = 1
function! RunSql(file)
    if s:db == ""
        " buscar y listar bases de datos
        let s:shell = systemlist("psql -lt | awk '{print $1}' | grep -v '|' | head -n -1 | sed 's/\r$//'")

        " armar la lista de opciones
        let s:output = ""
        let s:count = 1
        for line in s:shell
            let s:output = s:output ."\n". s:count. " " . line
            let s:count = s:count + 1
        endfor
        " anadir un salto de linea 
        let s:output = s:output . "\n"
    
        " determinar seleccion
        let s:seleccion = input(s:output.' Database Name: ')
        let s:db = s:shell[str2nr(s:seleccion)-1]
    endif
    " ejecutar
    execute ":'<,'>w! /tmp/sql"
    execute ":!psql -U admin -d " .s:db. " -a -f " .a:file
endfunction

command -buffer -range=% RunSqlSel call RunSql("/tmp/sql")
command -buffer RunSqlFile call RunSql("%")

nnoremap <buffer><leader>ri :RunSqlFile<cr>
vnoremap <buffer><leader>ri :RunSqlSel<cr>

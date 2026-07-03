function! FindFiles(pattern) abort
    if executable('fd')
        let l:cmd = 'fd -i --type f ' . shellescape(a:pattern)
    else
        let l:cmd = 'find . -type f -iname ' . shellescape(a:pattern)
    endif

    cexpr! system(l:cmd . ' | sed "s#$#:1:1:#"')
    copen
endfunction

function! FindPaths(pattern) abort
    if executable('fd')
        let l:cmd = 'fd -i --type d ' . shellescape(a:pattern)
    else
        let l:cmd = 'find . -type d -iname ' . shellescape(a:pattern)
    endif

    cexpr! system(l:cmd . ' | sed "s#$#:1:1:#"')
    copen
endfunction

command! -nargs=1 FindFiles call FindFiles(<q-args>)
command! -nargs=1 FindPaths call FindPaths(<q-args>)

"'finder' without fzf (for some reason)
function! Find() " find files
    if executable('fd')
        set errorformat=%f
        cexpr! system('fd --type f "' . input('Pattern: ') . '" .')
    else
        cexpr! system('find . -type f -iname "' . input('Pattern: ') . '" -printf "%p:1:1:%f\n"')
    endif
endfunction

function! FinD() " find directories
    cexpr! system('find . -iname "' . input('Pattern: ') . '" -printf "%p:1:1:%f\n"')
endfunction

command Find call Find()
command FinD call FinD()

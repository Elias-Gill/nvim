"'finder' without fzf (for some reason)
function! Find() " find files
    cexpr! system('find . -type f -iname "' . input('Pattern: ') . '" -printf "%p:1:1:%f\n"')
endfunction

function! FinD() " find directories
    cexpr! system('find . -type d -iname "' . input('Pattern: ') . '" -printf "%p:1:1:%f\n"')
endfunction

command Find call Find()
command FinD call FinD()

"'finder' without fzf (for some reason)
function! Find()
    cexpr! system('find . -name "' . input('Pattern: ') . '" -printf "%p:1:1:%f\n"')
endfunction

command Find call Find()

"'finder' without fzf (for some reason)
function! Fuzzy()
    cexpr! system('find . -name "' . input('Pattern: ') . '" -printf "%p:1:1:%f\n"')
endfunction

command Fuzzy call Fuzzy()

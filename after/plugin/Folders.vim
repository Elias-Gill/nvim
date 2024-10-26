"'finder' without fzf (for some reason)
function! Folders()
    cexpr! system('find . -name "' . input('Pattern: ') . '" -printf "%p:1:1:%f\n"')
endfunction

command Folders call Folders()

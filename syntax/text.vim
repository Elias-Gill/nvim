if exists("b:current_syntax")
    finish
endif

" 1. Resaltar líneas divisorias (muchos =)
syntax match DivisionLine /^=\{10,}\s*$/
highlight def link DivisionLine Title

" 2. Palabras completamente en mayúsculas (mínimo 2 letras)
syntax match AllCaps /\<[A-Z]\{2,}\>/
highlight def link AllCaps WarningMsg

" 3. Resaltar texto entre __ (doble subrayado)
syntax match Underscore /_[^_]\+_\(\s\|$\)/
highlight def link Underscore DivisionLine 

" 4. Resaltar texto entre ** (doble asterisco)
syntax match DoubleAsterisk /\*[^*]\+\*/
highlight def link DoubleAsterisk Constant

let b:current_syntax = "divisiontxt"

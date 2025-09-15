if exists("b:current_syntax")
  finish
endif

" 1. Resaltar líneas divisorias (muchos =)
syntax match DivisionLine /^=\{10,}\s*$/
highlight def link DivisionLine Title

" 2. Palabras completamente en mayúsculas (mínimo 2 letras)
syntax match AllCaps /\<[A-Z]\{2,}\>/
highlight def link AllCaps WarningMsg

let b:current_syntax = "divisiontxt"

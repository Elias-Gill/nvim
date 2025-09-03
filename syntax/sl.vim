" Vim syntax file
" Language: SL (Simple Language)
" Author: ChatGPT
" Installation: Put in ~/.vim/syntax/sl.vim and in ~/.vim/filetype.vim add: au BufRead,BufNewFile *.sl set filetype=sl

if exists("b:current_syntax")
    finish
endif

" ---------------------------
" Palabras clave
" ---------------------------
syn keyword slKeyword inicio fin var si sino mientras desde hasta retorna sub not set_stdin set_stdout leer imprimir cls and or

" ---------------------------
" Tipos de datos
" ---------------------------
syn keyword slType numerico cadena vector matriz

" ---------------------------
" Comentarios
" ---------------------------
syn match slComment "//.*$"

" ---------------------------
" Strings
" ---------------------------
syn region slString start=+"+ end=+"+
syn region slString start=+'+ end=+'+

" ---------------------------
" Números
" ---------------------------
syn match slNumber "\<\d\+\>"

" ---------------------------
" Highlight groups
" ---------------------------
hi def link slKeyword Keyword
hi def link slType Type
hi def link slComment Comment
hi def link slString String
hi def link slNumber Number

let b:current_syntax = "sl"

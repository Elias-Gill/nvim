" File: newshell.vim
" Description: Fork of the Molokai theme by Tomasr
" Author: elias-gill <eliasgill42@gmail.com>
" Source: https://github.com/elias-gill/newshell
" NOTE: this theme has only minor twiks from the original 
" Molokai.vim theme
" -----------------------------------------------------------------------------
if exists("g:newshell_background")
    let s:newshell_background = g:newshell_background
else 
    let s:newshell_background = "hard"
endif

if exists("g:custom_tabline")
    let s:custom_tabline = g:custom_tabline
else 
    let s:custom_tabline = 0
endif

let g:colors_name = "newshell"
hi clear
set background=dark

hi Boolean            guifg=#AE81FF
hi Character          guifg=#E6DB74
hi Number             guifg=#AE81FF
hi String             guifg=#E6DB74
hi Conditional        guifg=#F92672 gui=bold
hi Constant           guifg=#AE81FF gui=bold
hi Cursor             guifg=#000000 guibg=#F8F8F0
hi iCursor            guifg=#000000 guibg=#F8F8F0
hi Debug              guifg=#BCA3A3 gui=bold
hi Define             guifg=#66D9EF
hi Delimiter          guifg=#8F8F8F
hi DiffAdd            guibg=#13354A
hi DiffChange         guifg=#aaaaaa guibg=#333444
hi DiffDelete         guifg=#960050 guibg=#270d1a
hi DiffText           guifg=#FFCA29 guibg=#4C4745 gui=italic,bold

hi Directory          guifg=#A6E22E gui=bold
hi Error              guifg=#E6DB74 guibg=#1E0010
hi ErrorMsg           guifg=#F92672 guibg=#232526 gui=bold
hi Exception          guifg=#A6E22E gui=bold
hi Float              guifg=#AE81FF
hi FoldColumn         guifg=#FF5EAE guibg=none
hi Folded             guifg=#5E7EFF guibg=#222222
hi Function           guifg=#A6E22E
hi Identifier         guifg=#FD971F
hi Ignore             guifg=#808080 guibg=bg
hi IncSearch          guifg=#C4BE89 guibg=#000000

hi Keyword            guifg=#F92672 gui=bold
hi Label              guifg=#E6DB74 gui=none
hi Macro              guifg=#C4BE89 gui=italic
hi SpecialKey         guifg=#66D9EF gui=italic

hi MatchParen         guibg=#666666 guifg=#E5C31F gui=bold
hi ModeMsg            guifg=#E6DB74
hi MoreMsg            guifg=#E6DB74
hi Operator           guifg=#F92672

" Completation menu
hi Pmenu              guifg=#eeeeee guibg=#303030
hi PmenuSel           guibg=#1A4A68
hi PmenuSbar          guibg=#080808 guifg=#777777
hi PmenuThumb         guifg=#66D9EF
"hi CmpItemAbbrMatch   guifg=#66D9EF
hi CmpItemAbbrMatch   guifg=#F8A02D
hi CmpItemMenuDefault            guifg=#999999

" Vim actions
hi PreCondit          guifg=#A6E22E gui=bold
hi PreProc            guifg=#A6E22E
hi Question           guifg=#66D9EF
hi Repeat             guifg=#F92672 gui=bold
hi Search             guifg=#000000 guibg=#FFE792

" Marks
hi SpecialChar        guifg=#F92672 gui=bold
hi SpecialComment     guifg=#7E8E91 gui=bold
hi Special            guifg=#66D9EF guibg=bg      gui=italic
hi LineNr             guifg=#777777 guibg=None  gui=None
hi SignColumn         guifg=#A6E22E guibg=None
" hi LineNr             guifg=#465457 guibg=#232526
" hi SignColumn         guifg=#A6E22E guibg=#232526

hi Statement          guifg=#F92672 gui=bold
hi StatusLine         guifg=#455354 guibg=fg
hi StatusLineNC       guifg=#808080 guibg=#080808
hi StorageClass       guifg=#FD971F gui=italic
hi Structure          guifg=#66D9EF
hi Tag                guifg=#F92672 gui=italic
hi Title              guifg=#ef5939
hi Todo               guibg=#2BFF75 guifg=#232323 gui=bold

hi Typedef            guifg=#66D9EF
hi Type               guifg=#66D9EF gui=none
hi Underlined         guifg=#808080 gui=underline

hi VisualNOS          guibg=#403D3D
hi Visual             guibg=#403D3D
hi WarningMsg         guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu           guifg=#66D9EF guibg=#000000

hi TabLine            guibg=#1B1D1E guifg=#808080 gui=none
hi Tab                guibg=#111111
hi TabLineSel         guibg=#242424 guifg=#ffffff

hi ColorColumn guibg=#555555
hi VertSplit guifg=#707070 guibg=None gui=bold
hi Conceal guibg=none

if s:custom_tabline == 1
    hi TabLineFill guifg=#888888 guibg=#1B1D1E 
else
    hi TabLineFill  guifg=#1B1D1E guibg=#1B1D1E 
endif

"cursor y comentarios
hi Comment            guifg=#7E8E91
hi CursorLine         guibg=#293739 cterm=NONE gui=NONE
hi CursorLineNr       guifg=#FD971F gui=NONE cterm=NONE
hi CursorColumn       guibg=#293739
hi CursorLineFold     guifg=#5E7EFF
hi ColorColumn        guibg=#232526
hi NonText            guifg=#465457
hi SpecialKey         guifg=#465457
hi pythonSpaceError   guibg=NONE

" Native lsp colors (nvim)
hi DiagnosticUnderlineHint guifg=#999999
hi DiagnosticHint guifg=#00EC89
hi DiagnosticError guifg=#F02020
hi DiagnosticWarn guifg=#FFD500
hi DiagnosticSignHint guifg=#00EC89
hi LspFloatWinNormal guibg=#222222
hi TreesitterContext guibg=#333443
hi @variable guifg=#eeeeee

let g:python_highlight_space_errors=0
if s:newshell_background == "None"
    hi Normal guibg=NONE
elseif s:newshell_background == "dark"
    hi Normal guibg=#1f1f1f
elseif s:newshell_background == "medium"
    hi Normal guibg=#2f2f2f
endif

" plugins
hi mkdLineBreak guibg=none
hi BqfPreviewBorder guifg=#666666
hi NormalFloat guibg=#222222
hi IndentBlanklineContextChar guifg=#ab9457
hi SagaBorder guifg=#666666 guibg=#222222
" hi NvimTreeNormal guibg=#232323

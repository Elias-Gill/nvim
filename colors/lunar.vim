" Colors directly applied to highlights
highlight ColorColumn guibg=#303030
highlight FoldColumn guifg=#636363
highlight Cursor guifg=#ebfcfb guibg=#031120
highlight TermCursor guibg=NONE guifg=NONE gui=NONE guisp=NONE
highlight CursorColumn guibg=#15222F
highlight CursorLine guibg=#252525 term=NONE cterm=NONE
highlight CursorLineNr guifg=#C492b1 term=NONE cterm=NONE
highlight lCursor guifg=#C492b1 guibg=#031120
highlight EndOfBuffer guifg=#585858 guibg=NONE
highlight MatchParen guibg=#585858
highlight Substitute guifg=#031120 guibg=#C492b1
highlight IncSearch guibg=NONE guifg=NONE gui=reverse
highlight CurSearch guifg=#ebfcfb guibg=#4a4a4a
highlight Search guibg=#252525 guifg=#e6b99d

highlight Normal guifg=#ebfcfb guibg=#1b1b1b
highlight NormalNc guifg=#ebfcfb guibg=#1b1b1b
highlight NormalFloat guifg=#ebfcfb guibg=#191919
highlight Visual guibg=#3b3b3e
highlight VisualNOS guifg=#031120 guibg=#4F345a

highlight ErrorMsg guifg=#d64040 guibg=NONE
highlight MsgArea guifg=#dbcfb0
highlight ModeMsg guifg=#4B8CCD
highlight MoreMsg guifg=#698F3F
highlight WarningMsg guifg=#C79F4B

highlight Conceal guifg=#7d7d7d
highlight Directory guifg=#7FB7BE
highlight Folded guibg=#15222F
highlight LineNr guifg=#636363
highlight NonText guifg=#636363
highlight Whitespace guifg=#303030

highlight Pmenu guibg=#323232
highlight PmenuExtra guifg=#7d7d7d guibg=#15222F
highlight PmenuExtraSel guifg=#7d7d7d guibg=#181818
highlight PmenuKind guifg=#BC2c1A
highlight PmenuKindSel guifg=#BC2c1A
highlight PmenuSbar guibg=NONE guifg=NONE
highlight PmenuSel guifg=#97D7BD guibg=#1f1f1f
highlight PmenuThumb guibg=#979797

highlight Question guifg=#ebfcfb
highlight QuickFixLine guibg=#2E2E40
highlight SignColumn guifg=NONE guibg=NONE
highlight SpecialKey guifg=#636363
highlight SpellBad guifg=NONE guibg=NONE
highlight SpellCap guifg=NONE guibg=NONE
highlight SpellLocal guifg=NONE guibg=NONE
highlight SpellRare guifg=NONE guibg=NONE
highlight ToolbarButton guifg=#031120 guibg=#ebfcfb
highlight WildMenu guifg=#031120 guibg=#323232

highlight debugBreakpoint guifg=#4F345a
highlight debugPC guifg=#4B8CCD

highlight diffSubname guifg=#C492b1
highlight dirGroup guifg=#7d7d7d
highlight dirOwner guifg=#7d7d7d
highlight dirPermissionGroup guifg=#dbcfb0
highlight dirPermissionOther guifg=#4F345a
highlight dirPermissionUser guifg=#698F3F
highlight dirSize guifg=#dbcfb0
highlight dirSizeMod guifg=#C492b1
highlight dirTime guifg=#7d7d7d
highlight dirType guifg=#C492b1

highlight StatusLine guifg=#ebfcfb guibg=#0C1A28
highlight StatusLineNC guifg=#7d7d7d guibg=#031120
highlight TabLine guifg=#dddddd guibg=#1b1b1b cterm=NONE gui=NONE
highlight TabLineSel guifg=#e6b99d guibg=#2f2f2f
highlight TabLineFill guibg=NONE gui=NONE term=NONE cterm=NONE
highlight WinBar guifg=#ebfcfb
highlight WinBarNC guifg=#7d7d7d
highlight WinSeparator guifg=#636363 guibg=NONE
highlight VertSplit guifg=#585858

highlight Title guifg=#C492b1

" Syntax
highlight Comment guifg=#9a9290

highlight Constant guifg=#C492b1
highlight String guifg=#C492b1
highlight Character guifg=#C492b1
highlight Number guifg=#ebfcfb
highlight Boolean guifg=#ebfcfb
highlight Float guifg=#ebfcfb

highlight Identifier guifg=#b1b1b1
highlight Function guifg=#dbcfb0

highlight Statement guifg=#97D7BD
highlight Conditional guifg=#7FB7BE
highlight Repeat guifg=#7FB7BE
highlight Label guifg=#b1b1b1
highlight Operator guifg=#979797
highlight Keyword guifg=#7FB7BE
highlight Exception guifg=#7FB7BE

highlight PreProc guifg=#97D7BD
highlight Include guifg=#7FB7BE
highlight Define guifg=#BC2c1A
highlight Macro guifg=#97D7BD
highlight PreCondit guifg=#97D7BD

highlight Type guifg=#97D7BD
highlight StorageClass guifg=#97D7BD
highlight Structure guifg=#97D7BD
highlight Typedef guifg=#97D7BD

highlight Special guifg=#7FB7BE gui=italic
highlight SpecialChar guifg=#7FB7BE
highlight Tag guifg=#7FB7BE
highlight Delimiter guifg=#7FB7BE
highlight SpecialComment guifg=#7FB7BE
highlight Debug guifg=#7FB7BE

highlight Underlined gui=underline
highlight Ignore guifg=NONE guibg=NONE
highlight Error guifg=#BC2c1A
highlight Todo guifg=#4B8CCD guibg=#031120

" python
highlight pythonSpaceError guibg=NONE
highlight pythonDecorator guifg=#ebfcfb

" Diagnostics
highlight DiagnosticError guifg=#BC2c1A
highlight DiagnosticHint guifg=#636363
highlight DiagnosticInfo guifg=#979797
highlight DiagnosticOk guifg=#698F3F
highlight DiagnosticVirtualTextError guifg=#BC2c1A guibg=#18141F gui=italic
highlight DiagnosticVirtualTextHint guifg=#636363 gui=italic
highlight DiagnosticVirtualTextInfo guifg=#979797 guibg=#14202D gui=italic
highlight DiagnosticVirtualTextOk guifg=#698F3F guibg=#15222F gui=italic
highlight DiagnosticVirtualTextWarn guifg=#C79F4B guibg=#1F2526 gui=italic
highlight DiagnosticWarn guifg=#C79F4B

" Git signs
highlight Added guifg=#698F3F
highlight DiffAdded guifg=#698F3F
highlight Removed guifg=#BC2c1A
highlight DiffRemoved guifg=#BC2c1A
highlight Changed guifg=#C492b1
highlight DiffChanged guifg=#C492b1

" Diff hl groups
highlight DiffAdd guibg=#1A2D27
highlight DiffChange guibg=#2E2E40
highlight DiffDelete guibg=#2c0c0c
highlight DiffText guibg=#4F345a

" Plugins
highlight GitSignsAddInline guifg=#4F345a guibg=NONE
highlight GitSignsChangeInline guifg=#4F345a guibg=NONE
highlight GitSignsDeleteInline guifg=#4F345a guibg=NONE

" Fugitive
highlight fugitiveStagedHeading guifg=#97D7BD
highlight fugitiveStagedModifier guifg=#97D7BD
highlight fugitiveUnstagedHeading guifg=#C492b1
highlight fugitiveUnstagedModifier guifg=#BC2c1A
highlight fugitiveUntrackedHeading guifg=#C492b1
highlight fugitiveUntrackedModifier guifg=#BC2c1A
highlight gitHashAbbrev guifg=#C79F4B

" CMP
highlight CmpItemKind guifg=#979797
highlight CmpItemKindClass guifg=#97D7BD
highlight CmpItemKindConstant guifg=#C492b1
highlight CmpItemKindFunction guifg=#dbcfb0
highlight CmpItemKindKeyword guifg=#7FB7BE
highlight CmpItemKindModule guifg=#7FB7BE
highlight CmpItemKindSnippet guifg=#BC2c1A
highlight CmpItemKindText guifg=#636363
highlight CmpItemKindVariable guifg=#b1b1b1

" Copilot
highlight CopilotSuggestion guifg=#4a4a4a gui=italic

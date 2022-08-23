" Ligthline configs
let g:lightline = {
  \   'colorscheme': 'ayu_dark',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
    \     'modified': '%#ModifiedColor#%{LightlineModified()}',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}
let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }


function! LightlineModified()
    let map = { 'V': 'n', "\<C-v>": 'n', 's': 'n', 'v': 'n', "\<C-s>": 'n', 'c': 'n', 'R': 'n'}
    let mode = get(map, mode()[0], mode()[0])
    let bgcolor = {'n': [240, '#272727'], 'i': [31, '#272727']}
    let color = get(bgcolor, mode, bgcolor.n)
    exe printf('hi ModifiedColor ctermfg=240 ctermbg=%d guifg=#FF00A6 guibg=%s term=bold cterm=bold',
                \ color[0], color[1])
    return &modified ? '➜ ✹' : &modifiable ? '' : ''
endfunction

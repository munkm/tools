" Seth R. Johnson
" https://github.com/sethrj/SRJ-Vim-Resources

" Fix python indentation
let g:pyindent_open_paren = '&sw * 2'
let g:pyindent_continue = '&sw * 2'
let g:pyindent_nested_paren = '&sw'

"setlocal comments=:#
"setlocal commentstring=#%s
setlocal formatoptions+=ro
if v:version ># 703 || v:version ==# 703 && has('patch541')
  "comments continue at new lines
  setlocal formatoptions+=j
endif
setlocal autoindent
setlocal nosmartindent

" Use spaces instead of tabs
setlocal sw=4 ts=4 sts=4
setlocal expandtab
setlocal smarttab

" Do text wrapping
setlocal textwidth=79

" Folding
setlocal foldmethod=indent
setlocal foldlevel=3
setlocal foldminlines=5

" Insert a separator with option-S
inoremap <M-s> ##---------------------------------------------------------------------------## <CR>


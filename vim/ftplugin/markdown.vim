" Seth R. Johnson
" https://github.com/sethrj/SRJ-Vim-Resources

" Shift width, tab stop, soft tab stop
setlocal sw=4 ts=4 sts=4
" Wrap at 80 characters
" setlocal formatoptions=rowan "comments continue at new lines
setlocal formatoptions+=ro
setlocal textwidth=79
setlocal expandtab
setlocal smarttab
setlocal autoindent

" turn spell checking on
if has("spell")
	setlocal spell
endif

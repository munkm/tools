" Seth R. Johnson
" https://github.com/sethrj/SRJ-Vim-Resources

" Shift width, tab stop, soft tab stop
setlocal sw=4 ts=4 sts=4
" Wrap at 80 characters
setlocal formatoptions+=ro
if v:version ># 703 || v:version ==# 703 && has('patch541')
  "comments continue at new lines
  setlocal formatoptions+=j
endif
setlocal textwidth=79
setlocal expandtab
"c indent does stuff like unindent preprocessor directives, and more
setlocal smarttab
setlocal cindent

set cinoptions=>s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,g0.5s,h0.5s,ps,ts,i-s,+s,c3,C0,/0,(0,us,U0,w1,W2s,m0,j0,J0,NN-s,

call IMAP('FUI', 'for (std::size_t i = 0; i < <++>; ++i){<++>}', 'cpp')
call IMAP('FIT', 'for (<++>::const_iterator it = <++>.begin(),    end_it = <++>.end();it != end_it;++it){<++>}', 'cpp')

" Folding is REALLY SLOW sometimes
"if line('$') < 1000
  "setlocal foldmethod=syntax
  "setlocal foldlevel=3
  "setlocal foldminlines=5
"endif

" Insert a separator with option-S
inoremap <M-s> <C-o>d0//---------------------------------------------------------------------------//<CR><C-o>d0

" Insert a doxygen block with option-X
inoremap <M-x> <C-o>d0//---------------------------------------------------------------------------//<CR><C-o>^<C-o>D/*!<CR>\brief 


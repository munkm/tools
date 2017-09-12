" Vim syntax file 
" Language: Omnibus input file
" Version: 1.00
" Last Change: 2012 July 20
" Maintainer: Seth R Johnson
" Based on conf.vim by Bram Moolenaar <Bram@vim.org>
" Number regex from python.vim by Zvezdan Petkovic <zpetkovic@acm.org> et al
"
" To use, put this file in your ~/.vim/syntax folder and add the following
" line to your vimrc:
"
"  autocmd BufRead,BufNewFile *.omni set filetype=omnibus
"

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn keyword omniTodo contained TODO FIXME XXX
syn keyword omniBoolean True False true false t f
syn match omniCommand "^\s\{0,3\}\w\+\%(\s*:\s*\w\+\)*"
syn match omniInclude "^\s\{0,3\}#include"
syn match omniComment "!.*" contains=omniTodo
syn region omniString start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syn region omniString start=+'+ skip=+\\\\\|\\"+ end=+'+ oneline
" Blocks 
syn match omniBlock "^\%(\[\w\+\s*\%(=\s*\w\+\)\?\s*\%(\w\+\)\?\]\)\+"

" Numbers 
syn match omniFloat "\<\%([1-9]\d*\|0\)\>"
syn match omniFloat "\<\d\+[eE][+-]\?\d\+\>"
syn match omniFloat "\<\d\+\.\%([eE][+-]\?\d\+\)\?\%(\W\|$\)\@="
syn match omniFloat "\%(^\|\W\)\@<=\d*\.\d\+\%([eE][+-]\?\d\+\)\?\>"
" Interpolante
syn match omniOperator "\c\<\%(\d\+\.\?\d*\)\?\%(i\|ilog\|m\|r\)\>"

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
if version >= 508 || !exists("did_omnibus_syntax_inits") 
  if version < 508 
    let did_omnibus_syntax_inits = 1 
    command -nargs=+ HiLink hi link <args> 
  else 
    command -nargs=+ HiLink hi def link <args> 
  endif 
  HiLink omniComment Comment
  HiLink omniOperator Operator
  HiLink omniTodo Todo
  HiLink omniBlock Type
  HiLink omniString String
  HiLink omniCommand Keyword
  HiLink omniInclude Identifier
  HiLink omniFloat Float 
  HiLink omniBoolean Boolean
  delcommand HiLink 
endif 

let b:current_syntax = "omnibus"

" vim: ts=8 sw=2

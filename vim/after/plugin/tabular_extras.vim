if !exists(':Tabularize')
  finish " Give up here; the Tabular plugin musn't have been loaded
endif

let s:save_cpo = &cpo
set cpo&vim

AddTabularPattern!  typedefs /^\s*typedef.* \zs[a-zA-Z0-9_;]\+/l1l0
AddTabularPattern!  enums    /\v(\=|[},;].*)/l1l1l0
AddTabularPattern!  numbers  /[0-9\-]\+\./r0
AddTabularPattern!  pydict   /:.*,/l0
AddTabularPattern!  pyimport   /import/l1
AddTabularPattern!  declarations /\<\S\+[\>;]/l1l0
AddTabularPattern!  arguments /\v[&* ]?\w+(,|\)(\s+const)?;?$)/l1l0
AddTabularPattern!  spaces /\s\+\zs/l1l0

"
" Auto-tabularize function
"
com! -range AutoTabularize <line1>,<line2>call AutoTabularize()

function! AutoTabularize() range
  let s:thisline = getline(".")
  let range = a:firstline . ',' . a:lastline

  " ***** C++ files *****
  if &filetype == 'cpp' || &filetype == 'cuda'
    if s:thisline =~ 'typedef'
      let s:name = "typedefs"
    elseif s:thisline =~ 'enum'
      let s:name = "enums"
    elseif s:thisline =~ ' = '
      let s:name = "assignment"
    elseif s:thisline =~ '[0-9]\.'
      let s:name = "numbers"
    elseif s:thisline =~ '^[a-zA-Z0-9_ ]\+;$'
      let s:name = "declarations"
    elseif s:thisline =~ '^[^=,]\+[,)]$'
      let s:name = "arguments"
    else
      " default message
      redraw | echomsg "Couldn't tabularize C++ file."
      return
    endif

  " ***** Python files *****
  elseif &filetype == 'python'
    " python dictionaries
    if s:thisline =~ ':.*,$'
      let s:name = "pydict"
    elseif s:thisline =~ 'import'
      let s:name = "pyimport"
    elseif s:thisline =~ ' = '
      let s:name = "assignment"
    else
      " default message
      redraw | echomsg "Couldn't tabularize Python file."
      return
    endif

  " ***** unknown files *****
  else
    " silently ignore
    return
  endif

  " Call the actual function
  exe range . 'call Tabularize(s:name)'
  redraw | echomsg "Tabularized " . s:name
  return
endfunction

" Map option-R to reformat as columns
map <C-T> :AutoTabularize<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

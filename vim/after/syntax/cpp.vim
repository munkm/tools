"let g:doxygen_enhanced_color = 1
if line('$') < 2000
  " Only use doxyegn for relatively small files
  runtime syntax/doxygen.vim
endif

" Suppress curly brace "errors" that can appear in lambda functions
let c_no_curly_error=1

" DBC
syn keyword dbcKeyword Check Require Ensure Remember Validate Insist
hi def link dbcKeyword Function 

" C++11
" alignas and alignof are addressed in the standard c.vim file.
syn keyword cppNumber       nullptr
syn keyword cppOperator     decltype
syn keyword cppStorageClass constexpr
syn keyword cppExceptions   noexcept
syn keyword cppAccess		    override final

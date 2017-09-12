" Vim syntax file 
" Language: MCNP input file 
" Version: 1.02 
" Last Change: 2014
" Maintainer: Giacomo L.A. Grasso,
" Nuclear Engineering Laboratory - LIN - of Montecuccolino 
" Dept. of Energy and Nuclear Engineering and of Environmental 
" Control (DIENCA) - University of Bologna 
" Contact: <giacomo.grasso@mail.ing.unibo.it> 
" Additional Maintainer: Seth R Johnson
" Usage: Do :help mcnp-syntax from Vim 
" Credits: 
" Version 0.1 was based on the MCNP5 input file scheme as reported in the 
" Los Alamos User Manual. For instructions on use, do :help mcnp from vim 
"
" For version 5.x: Clear all syntax items 
" For version 6.x: Quit if a syntax file is already loaded 
if version < 600 
	syntax clear 
elseif exists("b:current_syntax") 
	finish 
endif 
syn case ignore 
" ------------- Generals ------------------------------------------------------- 
" --- Unprocessed 
" Header 
syn match mcnpUnitHeader display "\%1l.\+$" 
" Comments 
syn match mcnpComment display "\%1cc$" 
syn match mcnpComment display "\%1cc\s.*$" 
syn match mcnpComment display "\$.*$" 
" --- Commons 
" Characterizig 
syn keyword mcnpKeyword n 
" --- Numbers of various sorts 
" Integers 
syn match mcnpLabelNumber display "[-+*#]\=\d\+r\=" 
" floating points 
syn match mcnpFloat display "[-+]\=\d\{2,}\.\d*" 
syn match mcnpFloat display "[-+]\=\d\=\.\d*\(e[-+]\=\d\+\)\=" 
" ------------- Cell cards ----------------------------------------------------- 
" descriptives 
syn keyword mcnpKeyword like but imp ext mat rho vol tmp area trcl u fill lat 
" ------------- Surface cards -------------------------------------------------- 
" Surfaces 
syn keyword mcnpType px py pz p cx cy cz so s sx sy sz kx ky kz sq gq tx ty tz x y z 
syn match mcnpType "\<[ck]/[xyz]\>" 
" Macrobodies 
syn keyword mcnpType box rpp sph rcc rhp hex rec trc ell wed arb 

" ------------- Tally cards ---------------------------------------------------- 
" --- Materials cards 
" mat number 
syn match mcnpTodo "m[t]\=\d\+" 
" ENDF library 
syn match mcnpType display "\<\d\{2,6}\.\d\d[cdytpuemg]\>" 
" --- Tallies cards 
" Tally 
syn match mcnpTodo "f\(\(mesh\)\|[cqmsut]\)\=\d*" 
syn match mcnpTodo "e[m]\=\d*" 
syn match mcnpTodo "t[mf]\=\d\+" 
syn match mcnpTodo "c[mf]\=\d\+" 
syn match mcnpTodo "d[efd\(xt\)]\=\d\+" 
syn match mcnpTodo "s[fd]\=\d\+" 
syn keyword mcnpKeyword geom origin imesh iints jmesh jints kmesh kints emesh eints out factor 
" Comments 
syn region mcnpComment matchgroup=mcnpTodo start="[sf]c\d\+" end="$" contains=mcnpComment 
" syn match mcnpComment 
" --- Source cards 
" Generic 
syn keyword mcnpKeyword ksrc sdef nps
" Definition 
syn keyword mcnpKeyword ssw ssr ipt icl jsu cel sur par tr pos rad axs dir vec nrm ccc ara eff erg tme wgt 
" Distribution 
"syn match mcnpTodo "d\d\+" 
"syn match mcnpTodo "s[ipbc]\d\+" 
"syn match mcnpTodo "ds\d\+" 
"syn match mcnpTodo "tr\d\+" 
" --- Mode cards 
" Simulation 
syn keyword mcnpKeyword mode kcode 
" Output 
syn keyword mcnpKeyword print 
syn keyword mcnpType col cf ij ik jk 
"Catch errors caused by too many right parentheses 
syn region mcnpParen transparent start="(" end=")" contains=ALLBUT,mcnpParenError,@mcnpCommentGroup, cIncluded,@spell 
syn match mcnpParenError ")" 
syn region mcnpParen transparent start="\[" end="\]" contains=ALLBUT,mcnpParenError,@mcnpCommentGroup, cIncluded,@spell 
syn match mcnpParenError "\]" 
syn match mcnpOperator "=" 
syn match mcnpOperator ":" 
syn match mcnpOperator "<" 
" Define the default highlighting. 
" For version 5.7 and earlier: only when not done already 
" For version 5.8 and later: only when an item doesn’t have highlighting yet 
if version >= 508 || !exists("did_mcnp_syn_inits") 
	if version < 508 
		let did_mcnp_syn_inits = 1 
		command -nargs=+ HiLink hi link <args> 
	else 
		command -nargs=+ HiLink hi def link <args> 
	endif 
	HiLink mcnpKeyword Keyword 
	HiLink mcnpConstructName Identifier 
	HiLink mcnpConditional Conditional 
	HiLink mcnpRepeat Repeat 
	HiLink mcnpTodo Todo 
	HiLink mcnpContinueMark Todo 
	HiLink mcnpString String 
	HiLink mcnpNumber Number 
	HiLink mcnpOperator Operator 
	HiLink mcnpBoolean Boolean 
	HiLink mcnpLabelError Error 
	HiLink mcnpObsolete Todo 
	HiLink mcnpType Type 
	HiLink mcnpStructure Type 
	HiLink mcnpStorageClass StorageClass 
	HiLink mcnpUnitHeader Identifier 
	HiLink mcnpReadWrite Keyword 
	HiLink mcnpIO Keyword 
	HiLink mcnp90Intrinsic Function 
	HiLink mcnpInclude Include 
	HiLink mcnpLabelNumber Special 
	HiLink mcnpTarget Special 
	HiLink mcnpFormatSpec Identifier 
	HiLink mcnpFloat Float 
	HiLink mcnpPreCondit PreCondit 
	HiLink mcnpInclude Include 
	HiLink cIncluded mcnpString 
	HiLink cInclude Include 
	HiLink cPreProc PreProc 
	HiLink cPreCondit PreCondit 
	HiLink mcnpParenError Error 
	HiLink mcnpComment Comment 
	HiLink mcnpSerialNumber Todo 
	delcommand HiLink 
endif 
let b:current_syntax = "mcnp" 

setlocal sw=5 ts=5
setlocal expandtab
setlocal smarttab
"setlocal list "invisible characters cause trouble with mcnp

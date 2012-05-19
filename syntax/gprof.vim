" Vim syntax file
" Language: Syntax for Gprof Output
" Maintainer: Dominique Pelle <dominique.pelle@gmail.com>
" Last Change: 2012 May 18

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
	finish
endif
let s:keepcpo= &cpo
set cpo&vim

syn case match
syn sync minlines=50

syn match gprofFlatProfileTitle "^Flat profile:$"
syn region gprofFlatProfileHeader 
  \ start="^Each sample counts as.*"
  \ end="^ time.*name\s*$"
syn match gprofFlatProfile "^\s\+[0-9.]\+\s\+[0-9.]\+\s\+[0-9.]\+\s\+\(\d\+\s\+[0-9.]\+\s\+[0-9.]\+\s\+\)\=" 
syn region gprofFlatProfileTrailer
  \ start="^\s*%\s\+the percentage of the total running time.*"
  \ end="^\s*the gprof listing if it were to be printed\."

syn match gprofCallGraphTitle "^\s\+Call graph (explanation follows)"
syn region gprofCallGraphHeader
  \ start="^granularity: each sample hit covers.*"
  \ end="^\s*index % time\s\+self\s\+children\s\+called\s\+name$"
syn match gprofCallGraphFunction "\s\+[0-9.]\+[0-9\.]\+\s\+[^\[]*\ze\["
syn match gprofCallGraphCallerCallee "^\s\+[0-9.]\+\s\+[0-9.]\+\s\+[0-9/]\+\s\+"
syn match gprofCallGraphCallerCallee "^\s\+[0-9]\+\s\+"
syn match gprofCallGraphSeparator "^-----------------------------------------------"
syn region gprofCallGraphTrailer
  \ start="This table describes the call tree of the program"
  \ end="^\s*the cycle.$"

syn match gprofIndexFunctionTitle "^Index by function name$"
syn match gprofFunctionIndex "\[\d\+\]"
syn match gprofSpecial "<\(spontaneous\|cycle \d\+\)>"

hi def link gprofFlatProfileTitle      Title
hi def link gprofFlatProfileHeader     Comment
hi def link gprofFlatProfile           Number
hi def link gprofFlatProfileTrailer    Comment

hi def link gprofCallGraphTitle        Title
hi def link gprofCallGraphHeader       Comment
hi def link gprofCallGraphCallers      ProProc
hi def link gprofCallGraphFunction     Special
hi def link gprofCallGraphCallerCallee Number
hi def link gprofCallGraphTrailer      Comment
hi def link gprofCallGraphSeparator    Normal

hi def link gprofFunctionIndex         Label
hi def link gprofSpecial               SpecialKey

hi def link gprofIndexFunctionTitle Title

let b:current_syntax = "gprof"

let &cpo = s:keepcpo
unlet s:keepcpo

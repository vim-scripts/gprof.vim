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
syn sync fromstart

" Flat profile
syn region gprofFlatProfile
  \ start="^Flat profile:$"
  \ end="^$"
  \ contains=gprofFlatProfileTitle,gprofFlatProfileHeader,gprofFlatProfileTrailer
syn match gprofFlatProfileTitle
  \ "^Flat profile:$" 
  \ contained
syn region gprofFlatProfileHeader 
  \ start="^Each sample counts as.*"
  \ end="^ time.*name\s*$"
  \ contained
syn region gprofFlatProfileTrailer
  \ start="^\s*%\s\+the percentage of the total running time.*"
  \ end="^\s*the gprof listing if it were to be printed\."
  \ contained

" Call graph
syn region gprofCallGraph
  \ start="^\s*Call graph (explanation follows)$"
  \ end="^$"
  \ contains=gprofCallGraphTitle,gprofCallGraphHeader,gprofCallGraphFunction,gprofCallGraphSeparator,gprofCallGraphTrailer,gprofFunctionIndex
syn match gprofCallGraphTitle 
  \ "^\s\+Call graph (explanation follows)"
  \ contained
syn region gprofCallGraphHeader
  \ start="^granularity: each sample hit covers.*"
  \ end="^\s*index % time\s\+self\s\+children\s\+called\s\+name$"
  \ contained
syn match gprofCallGraphFunction "\s\+\([0-9.]\+\s\+\)\{3}\d\+\s\+.*" contained
syn match gprofCallGraphSeparator "^-\+$" contained
syn region gprofCallGraphTrailer
  \ start="This table describes the call tree of the program"
  \ end="^\s*the cycle.$"
  \ contained

" Index
syn region gprofIndex
  \ start="^Index by function name$"
  \ end="\%$"
  \ contains=gprofIndexFunctionTitle,gprofFunctionIndex

syn match gprofIndexFunctionTitle "^Index by function name$" contained
syn match gprofFunctionIndex "\[\d\+\]" contained
syn match gprofSpecial "<\(spontaneous\|cycle \d\+\)>" contained

hi def link gprofFlatProfileTitle      Title
hi def link gprofFlatProfileHeader     Comment
hi def link gprofFlatProfileTrailer    Comment

hi def link gprofCallGraphTitle        Title
hi def link gprofCallGraphHeader       Comment
hi def link gprofCallGraphFunction     Special
hi def link gprofCallGraphTrailer      Comment
hi def link gprofCallGraphSeparator    Label

hi def link gprofFunctionIndex         Label
hi def link gprofSpecial               SpecialKey

hi def link gprofIndexFunctionTitle Title

let b:current_syntax = "gprof"

let &cpo = s:keepcpo
unlet s:keepcpo

" Language:    gprof
" Maintainer:  Dominique Pelle <dominique.pelle@gmail.com>
" Last Change: 2012 May 19

" When cursor is on one line of the gprof call graph,
" calling this function jumps to this function in the call graph.
"
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin=1

function <SID>GprofJumpToFunctionIndex()
  let l:line = getline('.')
  if l:line =~ '[\d\+\]$'
    " We're in a line in the call graph.
    exe "norm $yT[G?^\\[\<C-R>\"\\]\<CR>"
  elseif l:line =~ '^\s\+[0-9\.]\+\s\+[0-9\.]\+\s\+[0-9\.]\+\s\+'
    " We're in line in the flat profile.
    exe "norm $vT yG?^\\[\\d\\+\\].*\<C-R>\" \\(<[^>]*> \\)*\\[\\d\\+\\]$\<CR>"
  endif
endfunction

" Pressing <C-]> on a line in the gprof flat profile or in
" the call graph, jumps to the corresponding function inside
" the flat profile.
map <silent> <C-]> :call <SID>GprofJumpToFunctionIndex()<CR>

" vim:sw=2 fdm=indent

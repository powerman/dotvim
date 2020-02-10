" Language:      Modified EP embedded with HTML
" Author:        Alex Efros <powerman-asdf@ya.ru>
" Last Change:   2013-04-12
scriptencoding utf-8

" HTML syntax should be already loaded now, let's add EPL syntax too
runtime! syntax/epl.vim

" Replace default "perl" syntax with same but named "htmlperl" to be able
" to define alternative colors for perl inside html than to usual perl.
syn include @HTMLPerl syntax/htmlperl.vim
syn cluster HTMLPerl remove=htmlperlFunctionName,htmlperlElseIfError

" Replace EPL's delimiters <%…%> with [%…%] to avoid conflict with js templates.
syn clear MojoStart
syn clear MojoEnd
syn clear PerlInside
syn match MojoStart /\[%=\{0,2}/ contained
syn match MojoEnd /=\{0,1}%\]/ contained
syn region PerlInside keepend oneline start=+\[%=\{0,2}+hs=s end=+=\{0,1}%\]+he=s-1,me=s-1 contains=MojoStart,@HTMLPerl nextgroup=MojoEnd
syn region PerlInside keepend oneline start=+^\s*%=\{0,2}+hs=s end=+$+ contains=MojoSingleStart,@HTMLPerl

" We're cool now!
let b:current_syntax = 'html.tmpl'

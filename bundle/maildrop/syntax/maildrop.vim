" Vim syntax file
" Language:     Courier Maildrop mailfilter
" Maintainer:   Sirtaj Singh Kang
" Created:      2015-11-04
" Reference:    http://www.courier-mta.org/maildropfilter.html


if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn match   mdComment /#.*/ contains=mdTodo oneline
syn keyword mdTodo contained TODO FIXME XXX HACK BUG TESTME PENDING

syn match  mdVar  /$[a-zA-Z_]\w*/
syn match  mdVar  /${[^}]*}/

syn region mdString start=/"/ skip=/\\"/ end=/"/ contains=mdVar
syn region mdString start=/'/ skip=/\\'/ end=/'/ contains=mdVar
syn region mdExtCommand start=/`/ skip=/\\`/ end=/`/ contains=mdVar
syn region mdRegexp contained start=:/: skip=:\\/:
                    \ end=:/\(\:[hbD]\+\)\?:
                    \ contains=mdVar


syn keyword mdCommand dotlock flock echo import log logfile xfilter
syn keyword mdCommand exit
syn keyword mdBlockCommand exception else

syn keyword mdDeliverCommand cc to

syn keyword mdConditional if elsif nextgroup=mdCondExp skipwhite skipnl skipempty
syn keyword mdRepeat foreach while nextgroup=mdCondExp skipwhite skipnl skipempty

syn region  mdCondExp start=/(/ end=/)/ contains=@mdCondElem
syn cluster mdCondElem add=mdComment,mdString,mdRegexp
syn cluster mdCondElem add=mdCondExp,mdFunction,mdVar

syn keyword mdFunction gdbmopen gdbmclose gdbmfetch gdbmstore
syn keyword mdFunction getaddr hasaddr length lookup substr time
syn keyword mdFunction tolower toupper escape

syn keyword mdInclude include

" TODO Work out a better way to do operator matching.
" syn cluster mdCondElem add=mdOperator
" syn match mdOperator :\|\||&&|<|<=|>|>=|==|!=|=\~|[-+*/|&!~]: contained
" syn keyword mdOperator lt le gt ge eq ne contained

" Display links.

hi def link mdComment       Comment
hi def link mdTodo          Todo

hi def link mdInclude       Include
hi def link mdConditional   Conditional
hi def link mdRepeat        Repeat
hi def link mdCommand       Statement
hi def link mdDeliverCommand  Statement
hi def link mdBlockCommand  Conditional

hi def link mdFunction      Function
hi def link mdRegexp        String
hi def link mdString        String
hi def link mdExtCommand    String
hi def link mdVar           Identifier

hi def link mdOperator      Operator

let b:current_syntax = "maildrop"

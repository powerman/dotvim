" Vim syntax file
" Language:	Limbo
" Maintainer:	Alex Efros <powerman-asdf@ya.ru>
" URL:		http://powerman.name/download/vim/syntax/limbo.vim
" Version:	1.0
" Last Change:	2012-12-11

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


" comment
syn match limboComment		"#.*" contains=limboTodo,limboLineFile,@Spell extend
syn match limboLineFile		contained /#\@<=line\s\+\d\+\s\+"[^"]\+"$/
syn keyword limboTodo		contained TODO TBD FIXME XXX NOTE BUG WARNING DEBUG OPTIMIZATION WORKAROUND

" constant
syn region limboStringSimple	keepend extend start=+`+ end=+`+ contains=@Spell
syn region limboStringQuoted	keepend extend start=+"+ skip=+\\[\\"]+ end=+"+ contains=limboEscapedChar,limboErrorEscaped,limboErrorMultiline,@Spell
syn region limboChar		keepend extend start=+'+ skip=+\\[\\']+ end=+'+ contains=limboEscapedChar,limboErrorEscaped,limboErrorMultiline,limboErrorChar
syn match limboEscapedChar	contained "\\\%(u\x\{4}\|[\\'"abtnvfr0]\)"
syn match limboErrorEscaped	contained "\\\%(u.\{0,3}\_X\|\_[^u\\'"abtnvfr0]\)"
syn match limboErrorMultiline	contained "\n\@<=.\+"
syn match limboErrorChar	contained "'\zs'"
syn match limboErrorChar	contained "'\zs\%(\%([^\\]\|\\u\x\{4}\|\\[\\'"abtnvfr0]\)'\)\@!.\+"
syn match limboNumber		"\w\@<!\d\+\(r[0-9A-Za-z]\+\)\?\w\@!"
syn match limboFloat		"\w\@<!\(\d\+[.eE]\@=\(\.\d*\)\?\|\.\d\+\)\([eE][+-]\?\d\+\)\?\w\@!"

" function
syn match limboFunction		"\w\@<!\h\w*\(\(\s*\[\s*\h\w*\(\s*,\s*\h\w*\)*\s*\]\)\?\s*(\)\@="

" delimiter (lower priority over operator)
syn match limboDelimiterDecl	":"

" operator
syn match limboOperator		"\([+*/%&|^-]\|\*\*\|<<\|>>\)=\@!"
syn match limboOperatorAssign	"\([+*/%&|^-]\|\*\*\|<<\|>>\)="
syn match limboOperatorAssign	"=\|:="
syn match limboOperator		"++\|--\|[!~]\|&&\|||"
syn match limboOperator		"[=!]=\|[<>]=\?"
syn match limboOperatorCons	"::"
syn match limboOperatorIO	"<-"

" delimiter
syn match limboDelimiter	"[;{}[\],]"
syn match limboDelimiterGroup	"[()]"
syn match limboDelimiterIdent	"\.\|->"
syn keyword limboDelimiterQual	or to
syn match limboDelimiterQual	"\*\(\_s*=>\)\@="
syn match limboDelimiterQual	"=>"

" label
syn match limboLabel		"^\s*\h\w*:\_s*\(\(for\|while\|do\|case\|alt\|pick\)\>\)\@="

" keyword
syn keyword limboConditional	if else case alt pick
syn keyword limboRepeat		do while break continue
syn match limboRepeat		"\<for\>"
syn keyword limboOperator	len hd tl tagof ref load return spawn exit
syn keyword limboKeyword	implement import con dynamic 
syn match limboKeywordPoly	"\<for\(\s*{\)\@="
syn keyword limboException	exception raise raises
syn keyword limboInclude	include
syn keyword limboType		byte big int real string fn chan array list of
syn match limboType		"\<fixed([^),]\+\(,[^),]\+\)\?)"
syn keyword limboStorageClass	cyclic self
syn keyword limboStructure	adt module
syn keyword limboTypedef	type
syn keyword limboSpecial	nil iota


syn sync fromstart
syn sync linebreaks=1


if version >= 508 || !exists("did_limbo_syn_inits")
  if version < 508
    let did_limbo_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif


  HiLink limboComment		Comment
  HiLink limboLineFile		SpecialComment
  HiLink limboTodo		Todo

  HiLink limboErrorEscaped	Error
  HiLink limboErrorMultiline	Error
  HiLink limboErrorChar		Error

  HiLink limboStringSimple	String
  HiLink limboStringQuoted	String
  HiLink limboChar		Character
  HiLink limboEscapedChar	SpecialChar
  HiLink limboNumber		Number
  HiLink limboFloat		Float

  HiLink limboFunction		Function

  HiLink limboDelimiter		Delimiter
  HiLink limboDelimiterQual	Delimiter
  HiLink limboDelimiterDecl	Delimiter
  HiLink limboDelimiterGroup	Delimiter

  HiLink limboConditional	Conditional
  HiLink limboRepeat		Repeat
  HiLink limboLabel		Label
  HiLink limboOperator		Operator
  HiLink limboOperatorAssign	Operator
  HiLink limboOperatorCons	Operator
  HiLink limboOperatorIO	Operator
  HiLink limboKeyword		Keyword
  HiLink limboKeywordPoly	Special
  HiLink limboException		Exception
  HiLink limboInclude		Include
  HiLink limboType		Type
  HiLink limboStorageClass	StorageClass
  HiLink limboStructure		Structure
  HiLink limboTypedef		Typedef
  HiLink limboSpecial		Special

  delcommand HiLink
endif

let b:current_syntax = "limbo"

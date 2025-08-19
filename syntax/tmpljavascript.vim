" Vim syntax file
" Language:	JavaScript
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" Updaters:	Scott Shattuck (ss) <ss@technicalpursuit.com>
" URL:		http://www.fleiner.com/vim/syntax/tmpljavascript.vim
" Changes:	(ss) added keywords, reserved words, and other identifiers
"		(ss) repaired several quoting and grouping glitches
"		(ss) fixed regex parsing issue with multiple qualifiers [gi]
"		(ss) additional factoring of keywords, globals, and members
" Last Change:	2022 Jun 09
" 		2013 Jun 12: adjusted tmpljavaScriptRegexpString (Kevin Locke)
" 		2018 Apr 14: adjusted tmpljavaScriptRegexpString (LongJohnCoder)
" 		2024 Aug 14: fix a few stylistic issues (#15480)

" tuning parameters:
" unlet tmpljavaScript_fold

if !exists("main_syntax")
  " quit when a syntax file was already loaded
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'tmpljavascript'
elseif exists("b:current_syntax") && b:current_syntax == "tmpljavascript"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


syn keyword tmpljavaScriptCommentTodo      TODO FIXME XXX TBD contained
syn match   tmpljavaScriptLineComment      "\/\/.*" contains=@Spell,tmpljavaScriptCommentTodo
syn match   tmpljavaScriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  tmpljavaScriptComment	       start="/\*"  end="\*/" contains=@Spell,tmpljavaScriptCommentTodo
syn match   tmpljavaScriptSpecial	       "\\\d\d\d\|\\."
syn region  tmpljavaScriptStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=tmpljavaScriptSpecial,@htmlPreproc
syn region  tmpljavaScriptStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=tmpljavaScriptSpecial,@htmlPreproc
syn region  tmpljavaScriptStringT	       start=+`+  skip=+\\\\\|\\`+  end=+`+	contains=tmpljavaScriptSpecial,tmpljavaScriptEmbed,@htmlPreproc

syn region  tmpljavaScriptEmbed	       start=+${+  end=+}+	contains=@tmpljavaScriptEmbededExpr

" number handling by Christopher Leonard chris.j.leonard@gmx.com
syn match   tmpljavaScriptSpecialCharacter "'\\.'"
syn match   tmpljavaScriptNumber           "\<0[bB][0-1]\+\(_[0-1]\+\)*\>"
syn match   tmpljavaScriptNumber           "\<0[oO][0-7]\+\(_[0-7]\+\)*\>"
syn match   tmpljavaScriptNumber           "\<0\([0-7]\+\(_[0-7]\+\)*\)\?\>"
syn match   tmpljavaScriptNumber           "\<0[xX][0-9a-fA-F]\+\(_[0-9a-fA-F]\+\)*\>"
syn match   tmpljavaScriptNumber           "\<\d\+\(_\d\+\)*[eE][+-]\?\d\+\>"
syn match   tmpljavaScriptNumber           "\<[1-9]\d*\(_\d\+\)*\(\.\(\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\)\?\)\?\>"
syn match   tmpljavaScriptNumber           "\<\(\d\+\(_\d\+\)*\)\?\.\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\>"
syn match   tmpljavaScriptNumber           "\<\d\+\(_\d\+\)*\.\(\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\)\?\>"
syn region  tmpljavaScriptRegexpString     start=+[,(=+]\s*/[^/*]+ms=e-1,me=e-1 skip=+\\\\\|\\/+ end=+/[gimuys]\{0,2\}\s*$+ end=+/[gimuys]\{0,2\}\s*[+;.,)\]}]+me=e-1 end=+/[gimuys]\{0,2\}\s\+\/+me=e-1 contains=@htmlPreproc,tmpljavaScriptComment oneline

syn keyword tmpljavaScriptConditional	if else switch
syn keyword tmpljavaScriptRepeat		while for do in of
syn keyword tmpljavaScriptBranch		break continue
syn keyword tmpljavaScriptOperator		new delete instanceof typeof
syn keyword tmpljavaScriptType		Array Boolean Date Function Number Object String RegExp
syn keyword tmpljavaScriptStatement		return with await yield
syn keyword tmpljavaScriptBoolean		true false
syn keyword tmpljavaScriptNull		null undefined
syn keyword tmpljavaScriptIdentifier	arguments this
syn keyword tmpljavaScriptLabel		case default
syn keyword tmpljavaScriptException		try catch finally throw
syn keyword tmpljavaScriptMessage		alert confirm prompt status
syn keyword tmpljavaScriptGlobal		self window top parent
syn keyword tmpljavaScriptMember		document event location 
syn keyword tmpljavaScriptDeprecated	escape unescape
syn keyword tmpljavaScriptReserved		abstract boolean byte char class const debugger double enum export extends final float from goto implements import int interface let long native package private protected public short super synchronized throws transient var volatile async
syn keyword tmpljavaScriptModifier  static

syn cluster  tmpljavaScriptEmbededExpr	contains=tmpljavaScriptBoolean,tmpljavaScriptNull,tmpljavaScriptIdentifier,tmpljavaScriptStringD,tmpljavaScriptStringS,tmpljavaScriptStringT

if exists("tmpljavaScript_fold")
    syn match	tmpljavaScriptFunction	"\<function\>"
    syn region	tmpljavaScriptFunctionFold	start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match tmpljavaScriptSync	grouphere tmpljavaScriptFunctionFold "\<function\>"
    syn sync match tmpljavaScriptSync	grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword tmpljavaScriptFunction	function
    syn match	tmpljavaScriptBraces	   "[{}\[\]]"
    syn match	tmpljavaScriptParens	   "[()]"
endif

if main_syntax == "tmpljavascript"
  syn sync fromstart
  syn sync maxlines=100

  syn sync ccomment tmpljavaScriptComment
endif

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
hi def link tmpljavaScriptComment		Comment
hi def link tmpljavaScriptLineComment		Comment
hi def link tmpljavaScriptCommentTodo		Todo
hi def link tmpljavaScriptSpecial		Special
hi def link tmpljavaScriptStringS		String
hi def link tmpljavaScriptStringD		String
hi def link tmpljavaScriptStringT		String
hi def link tmpljavaScriptCharacter		Character
hi def link tmpljavaScriptSpecialCharacter	tmpljavaScriptSpecial
hi def link tmpljavaScriptNumber		Number
hi def link tmpljavaScriptConditional		Conditional
hi def link tmpljavaScriptRepeat		Repeat
hi def link tmpljavaScriptBranch		Conditional
hi def link tmpljavaScriptOperator		Operator
hi def link tmpljavaScriptType			Type
hi def link tmpljavaScriptStatement		Statement
hi def link tmpljavaScriptFunction		Keyword
hi def link tmpljavaScriptBraces		Function
hi def link tmpljavaScriptError		Error
hi def link tmpljavaScrParenError		tmpljavaScriptError
hi def link tmpljavaScriptNull			Keyword
hi def link tmpljavaScriptBoolean		Boolean
hi def link tmpljavaScriptRegexpString		String

hi def link tmpljavaScriptIdentifier		Identifier
hi def link tmpljavaScriptLabel		Label
hi def link tmpljavaScriptException		Exception
hi def link tmpljavaScriptMessage		Keyword
hi def link tmpljavaScriptGlobal		Keyword
hi def link tmpljavaScriptMember		Keyword
hi def link tmpljavaScriptDeprecated		Exception 
hi def link tmpljavaScriptReserved		Keyword
hi def link tmpljavaScriptModifier		StorageClass
hi def link tmpljavaScriptDebug		Debug
hi def link tmpljavaScriptConstant		Label
hi def link tmpljavaScriptEmbed		Special



let b:current_syntax = "tmpljavascript"
if main_syntax == 'tmpljavascript'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8

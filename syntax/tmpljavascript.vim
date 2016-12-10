" Vim syntax file
" Language:	JavaScript
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" Updaters:	Scott Shattuck (ss) <ss@technicalpursuit.com>
" URL:		http://www.fleiner.com/vim/syntax/tmpljavascript.vim
" Changes:	(ss) added keywords, reserved words, and other identifiers
"		(ss) repaired several quoting and grouping glitches
"		(ss) fixed regex parsing issue with multiple qualifiers [gi]
"		(ss) additional factoring of keywords, globals, and members
" Last Change:	2012 Oct 05
" 		2013 Jun 12: adjusted tmpljavaScriptRegexpString (Kevin Locke)

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

syn match   tmpljavaScriptSpecialCharacter "'\\.'"
syn match   tmpljavaScriptNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  tmpljavaScriptRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gim]\{0,2\}\s*$+ end=+/[gim]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn keyword tmpljavaScriptConditional	if else switch
syn keyword tmpljavaScriptRepeat		while for do in
syn keyword tmpljavaScriptBranch		break continue
syn keyword tmpljavaScriptOperator		new delete instanceof typeof
syn keyword tmpljavaScriptType		Array Boolean Date Function Number Object String RegExp
syn keyword tmpljavaScriptStatement		return with
syn keyword tmpljavaScriptBoolean		true false
syn keyword tmpljavaScriptNull		null undefined
syn keyword tmpljavaScriptIdentifier	arguments this var let
syn keyword tmpljavaScriptLabel		case default
syn keyword tmpljavaScriptException		try catch finally throw
syn keyword tmpljavaScriptMessage		alert confirm prompt status
syn keyword tmpljavaScriptGlobal		self window top parent
syn keyword tmpljavaScriptMember		document event location 
syn keyword tmpljavaScriptDeprecated	escape unescape
syn keyword tmpljavaScriptReserved		abstract boolean byte char class const debugger double enum export extends final float goto implements import int interface long native package private protected public short static super synchronized throws transient volatile 

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

syn sync fromstart
syn sync maxlines=100

if main_syntax == "tmpljavascript"
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
hi def link tmpljavaScriptCharacter		Character
hi def link tmpljavaScriptSpecialCharacter	tmpljavaScriptSpecial
hi def link tmpljavaScriptNumber		tmpljavaScriptValue
hi def link tmpljavaScriptConditional		Conditional
hi def link tmpljavaScriptRepeat		Repeat
hi def link tmpljavaScriptBranch		Conditional
hi def link tmpljavaScriptOperator		Operator
hi def link tmpljavaScriptType			Type
hi def link tmpljavaScriptStatement		Statement
hi def link tmpljavaScriptFunction		Function
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
hi def link tmpljavaScriptDebug		Debug
hi def link tmpljavaScriptConstant		Label


let b:current_syntax = "tmpljavascript"
if main_syntax == 'tmpljavascript'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8

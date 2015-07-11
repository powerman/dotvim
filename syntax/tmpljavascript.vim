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

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
" tuning parameters:
" unlet tmpljavaScript_fold

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'tmpljavascript'
elseif exists("b:current_syntax") && b:current_syntax == "tmpljavascript"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("tmpljavaScript_fold")
  unlet tmpljavaScript_fold
endif


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
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink tmpljavaScriptComment		Comment
  HiLink tmpljavaScriptLineComment		Comment
  HiLink tmpljavaScriptCommentTodo		Todo
  HiLink tmpljavaScriptSpecial		Special
  HiLink tmpljavaScriptStringS		String
  HiLink tmpljavaScriptStringD		String
  HiLink tmpljavaScriptCharacter		Character
  HiLink tmpljavaScriptSpecialCharacter	tmpljavaScriptSpecial
  HiLink tmpljavaScriptNumber		tmpljavaScriptValue
  HiLink tmpljavaScriptConditional		Conditional
  HiLink tmpljavaScriptRepeat		Repeat
  HiLink tmpljavaScriptBranch		Conditional
  HiLink tmpljavaScriptOperator		Operator
  HiLink tmpljavaScriptType			Type
  HiLink tmpljavaScriptStatement		Statement
  HiLink tmpljavaScriptFunction		Function
  HiLink tmpljavaScriptBraces		Function
  HiLink tmpljavaScriptError		Error
  HiLink tmpljavaScrParenError		tmpljavaScriptError
  HiLink tmpljavaScriptNull			Keyword
  HiLink tmpljavaScriptBoolean		Boolean
  HiLink tmpljavaScriptRegexpString		String

  HiLink tmpljavaScriptIdentifier		Identifier
  HiLink tmpljavaScriptLabel		Label
  HiLink tmpljavaScriptException		Exception
  HiLink tmpljavaScriptMessage		Keyword
  HiLink tmpljavaScriptGlobal		Keyword
  HiLink tmpljavaScriptMember		Keyword
  HiLink tmpljavaScriptDeprecated		Exception 
  HiLink tmpljavaScriptReserved		Keyword
  HiLink tmpljavaScriptDebug		Debug
  HiLink tmpljavaScriptConstant		Label

  delcommand HiLink
endif

let b:current_syntax = "tmpljavascript"
if main_syntax == 'tmpljavascript'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8

" Vim syntax file
" Language:	OS Inferno sh
" Maintainer:	Alex Efros <powerman-asdf@ya.ru>
" URL:		http://powerman.name/download/vim/syntax/infsh.vim
" Version:	1.10
" Last Change:	2012-12-09

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


syn cluster infshTOP contains=infshError
" usual typo
syn match infshError		+"+

syn cluster infshTOP add=infshSubst,infshCmdOut,infshBlock
" substitution command
syn region infshSubst		matchgroup=infshSubstDelimiter keepend extend start="\$["#]\?{\w\@=" end="}" contains=@infshTOP,@NoSpell
syn match infshSubstName	contained "\(\$["#]\?{\)\@<=\w\+" containedin=infshSubst
" get command output
syn region infshCmdOut		matchgroup=infshCmdOutDelimiter keepend extend start="[`"]{" end="}" contains=@infshTOP,@NoSpell
" command block
syn region infshBlock		matchgroup=infshDelimiter keepend extend start="{" end="}" contains=@infshTOP,@NoSpell

syn cluster infshTOP add=infshDelimiter,infshRedir,infshConditional,infshOperator,infshPatternClass,infshPattern
" top-level delimiters
syn match infshDelimiter	"[;&()]"
syn match infshRedir		"[|<>]\(\[\d\+\(=\d\+\)\?\]\)\?"
syn match infshConditional	"&&\|||"
syn match infshOperator		"\(:=\|=\|\^\)"
syn region infshPatternClass	matchgroup=infshPattern keepend extend oneline start="\[^\?" end="\]" contains=infshPatternInClass
syn match infshPatternInClass	contained "\(\[^\?\)\@<!-\]\@!"
syn match infshPattern		"[*?]"

syn cluster infshTOP add=infshVar,infshSpecVar,infshError
" references to variables
syn match infshVar		"\$["#]\?[$(']\@="
syn match infshVar		"\$["#]\?\(`{\)\@="
syn match infshVar		"\$["#]\(\"{\)\@="
" variables with single-char names (spec chars & unicode)
syn match infshVar		"\$["#]\?[!%+,\-./:?@\[\\\]~]"
syn match infshVar		"\$["#]\?[^\x0-\x7f]"
" special variables
syn match infshSpecVar		"\$["#]\?[*]"
syn match infshSpecVar		"\$["#]\?[0]"
syn match infshSpecVar		"\$["#]\?[1-9][0-9]*"
" variables with usual names
syn match infshVar		"\$["#]\?[a-zA-Z_][*0-9a-zA-Z_]*"
syn match infshVar		"\$["#]\?[*0][*0-9a-zA-Z_]\+"
syn match infshVar		"\$["#]\?[1-9][0-9]*[*a-zA-Z_][*0-9a-zA-Z_]*"
" more special variables
syn match infshSpecVar		"\$["#]\?\(status\|apid\|ifs\|prompt\|autoload\)[*0-9a-zA-Z_]\@!"
" bad variables
syn match infshError		"\$["#]\?[ \t\n&);<=>^|}]\@="
syn match infshError		"\$["#]\?\((\s*)\)\@="
syn match infshError		"\$["#]\?\(''[^']\@=\)\@="
syn match infshError		"\$["#]\?\([`]{\@!\)\@="
syn match infshError		"\$["#]\(["]{\@!\)\@="
syn match infshError		"\$["#][#]\@="

syn cluster infshTOP add=infshStr,infshComment,infshShebang
" quoted string
syn region infshStr		matchgroup=infshStrQ keepend extend start="'" skip="''" end="'" contains=infshStrQQ
syn match infshStrQQ		contained "''"
" comment
syn match infshComment		"#.*" contains=infshTodo,@Spell extend
syn keyword infshTodo		contained TODO TBD FIXME XXX NOTE BUG WARNING DEBUG OPTIMIZATION WORKAROUND
" shebang
syn match infshShebang		"^#!/dis/sh\(\.dis\)\?\(\s\+-[nlvx]\+\)*\s*$" contains=infshOpts
syn match infshOpts		contained "-[nlvx]\+"

syn cluster infshTOP add=infshStatement,infshConditional,infshRepeat,infshOperator,infshKeyword,infshException,infshPctlType
" keywords
syn keyword infshStatement	fn subfn
syn keyword infshConditional	and or if
syn keyword infshRepeat		apply getlines for in while
syn keyword infshOperator	run builtin exit load unload
syn keyword infshOperator	no pctl status
syn match   infshOperator	"[@!~]"
syn keyword infshKeyword	flag loaded whatis
syn keyword infshException	raise rescue
syn keyword infshPctlType	newfd forkfd newns forkns newpgrp nodevs


if version >= 508 || !exists("did_infsh_syn_inits")
  if version < 508
    let did_infsh_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink infshSubstDelimiter	Identifier
  HiLink infshSubstName		Operator

  HiLink infshCmdOutDelimiter	Include

  HiLink infshDelimiter		Delimiter
  HiLink infshRedir		Type
  HiLink infshConditional	Conditional
  HiLink infshOperator		Operator
  HiLink infshPattern		SpecialChar
  HiLink infshPatternInClass	SpecialChar

  HiLink infshVar		Identifier
  HiLink infshSpecVar		Special

  HiLink infshError		Error

  HiLink infshStr		String
  HiLink infshStrQ		String
  HiLink infshStrQQ		SpecialChar

  HiLink infshComment		Comment
  HiLink infshTodo		Todo
  HiLink infshShebang		Comment
  HiLink infshOpts		PreProc

  HiLink infshStatement		Statement
  HiLink infshConditional	Conditional
  HiLink infshRepeat		Repeat
  HiLink infshOperator		Operator
  HiLink infshKeyword		Keyword
  HiLink infshException		Exception
  HiLink infshPctlType		Type

  delcommand HiLink
endif

let b:current_syntax = "infsh"

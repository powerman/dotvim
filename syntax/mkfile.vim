" Vim syntax file
" Language:	mkfile (used by OS Inferno mk(1))
" Maintainer:	Alex Efros <powerman-asdf@ya.ru>
" URL:		http://powerman.name/download/vim/syntax/mkfile.vim
" Version:	1.10
" Last Change:	2012-12-09

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


syn include @ShOs	syntax/sh.vim
unlet b:current_syntax
syn include @ShInferno	syntax/infsh.vim
unlet b:current_syntax


syn match mkfileComment		"\\\@<!#.\{-}\(\\\?\n\)\@=" contains=mkfileTodo,@Spell
syn keyword mkfileTodo		contained TODO TBD FIXME XXX NOTE BUG WARNING DEBUG OPTIMIZATION WORKAROUND
syn match mkfileEscaped		"\\."
syn match mkfileError		contained "^\s\+\S.*"

syn match mkfileDelimiter	contained "[=:%<|]"
syn match mkfileNextLine	contained "\\\n"
	\ containedin=mkfileAssignment,mkfileVarWithAttr,mkfileVar,mkfileTargetWithAttr,mkfileTargets

syn match mkfileVarValue	contained "\$\w\+"
syn match mkfileVarValue	contained "\${\w\+}"
syn match mkfileVarValue	contained "\${\w\+:[^}]*}" contains=mkfileVarSubst
syn match mkfileVarSubst	contained ":[^}]*" contains=mkfileDelimiter,mkfileVarValue
syn match mkfileVarDelimiter	contained "[${}]"
	\ containedin=mkfileVarValue

syn region mkfileExternal	excludenl keepend start="^<" end="$" contains=mkfileDelimiter,mkfileVarValue

syn region mkfileAssignment	excludenl keepend start="^\w\(\w\|\\\n\)*\(\s\|\\\n\)*=" skip="\\\n" end="$"
	\ contains=mkfileVarWithAttr,mkfileVarValue,mkfileComment,mkfileEscaped
	\ skipempty nextgroup=mkfileError
syn match mkfileVarWithAttr	contained "^\w\(\w\|\\\n\)*\(\s\|\\\n\)*=\(\(\\\n\)*\(=\|U\(\\\n\)*=\)\)\?"
	\ contains=mkfileVar,mkfileDelimiter,mkfileVarAttr
syn match mkfileVar		contained "^\(\w\|\\\n\)*\w"
syn match mkfileVarAttr		contained "\(=\(\\\n\)*\)\@<=U\(\(\\\n\)*=\)\@="

syn region mkfileRule		excludenl keepend start="^[^ \t#=:]\([^#=:]\|\\\n\)*:" skip="\\\n" end="$"
	\ contains=mkfileTargetWithAttr,mkfilePrereq,mkfileVarValue,mkfileComment,mkfileEscaped
	\ skipempty nextgroup=mkfileError,mkfileRecipe
syn region mkfileRule_os	excludenl keepend start="^[^ \t#=:]\([^ \t#=:]\|\\\n\)*-\(os\|sh\):" skip="\\\n" end="$"
	\ contains=mkfileTargetWithAttr,mkfilePrereq,mkfileVarValue,mkfileComment,mkfileEscaped
	\ skipempty nextgroup=mkfileError,mkfileRecipe_os
syn match mkfileTargetWithAttr	contained "^[^ \t#=:]\([^#=:]\|\\\n\)*:\(\(\\\n\)*\(:\|[<DENnPQRUV]\+\(\\\n\)*:\)\)\?"
	\ contains=mkfileTargets,mkfileDelimiter,mkfileTargetAttr
syn match mkfileTargets		contained "^\([^#=:]\|\\\n\)*[^ \t#=:]"
	\ contains=mkfileDelimiter,mkfileVarValue
syn match mkfileTargetAttr	contained "\(:\(\\\n\)*\)\@<=[<DENnPQRUV]\+\(\(\\\n\)*:\)\@="
syn match mkfilePrereq		contained "\(:\(\\\n\)*\)\@<=.*"
	\ contains=mkfileDelimiter,mkfileVarValue,mkfileComment,mkfileEscaped
syn region mkfileRecipe		contained excludenl keepend start="^\s.*" skip="\n\s" end="$"
	\ contains=@ShInferno
syn region mkfileRecipe_os	contained excludenl keepend start="^\s.*" skip="\n\s" end="$"
	\ contains=@ShOs
" without including @Sh…:
" 	\ contains=mkfileVarValue,mkfileComment,mkfileEscaped


if version >= 508 || !exists("did_mkfile_syn_inits")
  if version < 508
    let did_mkfile_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink mkfileError		Error
  HiLink mkfileComment		Comment
  HiLink mkfileTodo		Todo
  HiLink mkfileEscaped		Special

  HiLink mkfileDelimiter	Operator
  HiLink mkfileNextLine		Special

  HiLink mkfileVarValue		Identifier
  HiLink mkfileVarSubst		String
  HiLink mkfileVarDelimiter	Delimiter

  HiLink mkfileVar		Identifier
  HiLink mkfileVarAttr		Type

  HiLink mkfileTargets		Function
  HiLink mkfileTargetAttr	Type

  delcommand HiLink
endif

let b:current_syntax = "mkfile"

" logical not: !
syn match perlNOT	    "\([$@%]\@<!\)!\([~=]\@!\)"
" more important keywords
syn keyword perlTodo	    BUG WARNING DEBUG OPTIMIZATION WORKAROUND contained

syn cluster perlInterpSlash	contains=parserReVar,perlReOr,perlSpecialString,perlSpecialMatch,perlVarPlain,perlVarBlock
syn cluster perlInterpMatch	contains=parserReVar,perlReOr,@perlInterpSlash,perlVarSlash
syn match parserReVar		"\$info" contained
syn match perlReOr		"|" contained
hi link parserReVar Special
hi link perlReOr Special

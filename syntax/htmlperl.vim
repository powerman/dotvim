" Vim syntax file
" Language:     Perl 5
" Maintainer:   Andy Lester <andy@petdance.com>
" URL:          http://github.com/petdance/vim-htmlperl/tree/master
" Last Change:  2010-08-10
" Contributors: Andy Lester <andy@petdance.com>
"               Hinrik Örn Sigurðsson <hinrik.sig@gmail.com>
"               Lukas Mai <l.mai.web.de>
"               Nick Hibma <nick@van-laarhoven.org>
"               Sonia Heimann <niania@netsurf.org>
"               and many others.
"
" Please download most recent version first before mailing
" any comments.
"
" The following parameters are available for tuning the
" htmlperl syntax highlighting, with defaults given:
"
" unlet htmlperl_include_pod
" unlet htmlperl_no_scope_in_variables
" unlet htmlperl_no_extended_vars
" unlet htmlperl_string_as_statement
" unlet htmlperl_no_sync_on_sub
" unlet htmlperl_no_sync_on_global_var
" let htmlperl_sync_dist = 100
" unlet htmlperl_fold
" unlet htmlperl_fold_blocks
" let htmlperl_nofold_packages = 1
" let htmlperl_nofold_subs = 1

if exists("b:current_syntax")
  finish
endif


" POD starts with ^=<word> and ends with ^=cut

if exists("htmlperl_include_pod")
  " Include a while extra syntax file
  syn include @Pod syntax/pod.vim
  unlet b:current_syntax
  if exists("htmlperl_fold")
    syn region htmlperlPOD start="^=[a-z]" end="^=cut" contains=@Pod,@Spell,htmlperlTodo keepend fold
    syn region htmlperlPOD start="^=cut" end="^=cut" contains=htmlperlTodo keepend fold
  else
    syn region htmlperlPOD start="^=[a-z]" end="^=cut" contains=@Pod,@Spell,htmlperlTodo keepend
    syn region htmlperlPOD start="^=cut" end="^=cut" contains=htmlperlTodo keepend
  endif
else
  " Use only the bare minimum of rules
  if exists("htmlperl_fold")
    syn region htmlperlPOD start="^=[a-z]" end="^=cut" fold
  else
    syn region htmlperlPOD start="^=[a-z]" end="^=cut"
  endif
endif


syn cluster htmlperlTop		contains=TOP
syn region  htmlperlGenericBlock	matchgroup=htmlperlGenericBlock start="{" end="}" contained transparent


" All keywords
"
syn match htmlperlConditional		"\<\%(if\|elsif\|unless\|given\|when\|default\)\>"
syn match htmlperlConditional		"\<else\>" nextgroup=htmlperlElseIfError skipwhite skipnl skipempty
syn match htmlperlRepeat			"\<\%(while\|for\%(each\)\=\|do\|until\|continue\)\>"
syn match htmlperlOperator			"\<\%(defined\|undef\|eq\|ne\|[gl][et]\|cmp\|not\|and\|or\|xor\|not\|bless\|ref\|do\)\>"
syn match htmlperlControl			"\<\%(BEGIN\|CHECK\|INIT\|END\|UNITCHECK\)\>"

syn match htmlperlStatementStorage		"\<\%(my\|our\|local\|state\)\>"
syn match htmlperlStatementControl		"\<\%(return\|last\|next\|redo\|goto\|break\)\>"
syn match htmlperlStatementScalar		"\<\%(chom\=p\|chr\|crypt\|r\=index\|lc\%(first\)\=\|length\|ord\|pack\|sprintf\|substr\|uc\%(first\)\=\)\>"
syn match htmlperlStatementRegexp		"\<\%(pos\|quotemeta\|split\|study\)\>"
syn match htmlperlStatementNumeric		"\<\%(abs\|atan2\|cos\|exp\|hex\|int\|log\|oct\|rand\|sin\|sqrt\|srand\)\>"
syn match htmlperlStatementList		"\<\%(splice\|unshift\|shift\|push\|pop\|join\|reverse\|grep\|map\|sort\|unpack\)\>"
syn match htmlperlStatementHash		"\<\%(delete\|each\|exists\|keys\|values\)\>"
syn match htmlperlStatementIOfunc		"\<\%(syscall\|dbmopen\|dbmclose\)\>"
syn match htmlperlStatementFiledesc		"\<\%(binmode\|close\%(dir\)\=\|eof\|fileno\|getc\|lstat\|printf\=\|read\%(dir\|line\|pipe\)\|rewinddir\|say\|select\|stat\|tell\%(dir\)\=\|write\)\>" nextgroup=htmlperlFiledescStatementNocomma skipwhite
syn match htmlperlStatementFiledesc		"\<\%(fcntl\|flock\|ioctl\|open\%(dir\)\=\|read\|seek\%(dir\)\=\|sys\%(open\|read\|seek\|write\)\|truncate\)\>" nextgroup=htmlperlFiledescStatementComma skipwhite
syn match htmlperlStatementVector		"\<vec\>"
syn match htmlperlStatementFiles		"\<\%(ch\%(dir\|mod\|own\|root\)\|glob\|link\|mkdir\|readlink\|rename\|rmdir\|symlink\|umask\|unlink\|utime\)\>"
syn match htmlperlStatementFiles		"-[rwxoRWXOezsfdlpSbctugkTBMAC]\>"
syn match htmlperlStatementFlow		"\<\%(caller\|die\|dump\|eval\|exit\|wantarray\)\>"
syn match htmlperlStatementInclude		"\<require\>"
syn match htmlperlStatementInclude		"\<\%(use\|no\)\s\+\%(\%(attributes\|attrs\|autouse\|parent\|base\|big\%(int\|num\|rat\)\|blib\|bytes\|charnames\|constant\|diagnostics\|encoding\%(::warnings\)\=\|feature\|fields\|filetest\|if\|integer\|less\|lib\|locale\|mro\|open\|ops\|overload\|re\|sigtrap\|sort\|strict\|subs\|threads\%(::shared\)\=\|utf8\|vars\|version\|vmsish\|warnings\%(::register\)\=\)\>\)\="
syn match htmlperlStatementProc		"\<\%(alarm\|exec\|fork\|get\%(pgrp\|ppid\|priority\)\|kill\|pipe\|set\%(pgrp\|priority\)\|sleep\|system\|times\|wait\%(pid\)\=\)\>"
syn match htmlperlStatementSocket		"\<\%(acept\|bind\|connect\|get\%(peername\|sock\%(name\|opt\)\)\|listen\|recv\|send\|setsockopt\|shutdown\|socket\%(pair\)\=\)\>"
syn match htmlperlStatementIPC		"\<\%(msg\%(ctl\|get\|rcv\|snd\)\|sem\%(ctl\|get\|op\)\|shm\%(ctl\|get\|read\|write\)\)\>"
syn match htmlperlStatementNetwork		"\<\%(\%(end\|[gs]et\)\%(host\|net\|proto\|serv\)ent\|get\%(\%(host\|net\)by\%(addr\|name\)\|protoby\%(name\|number\)\|servby\%(name\|port\)\)\)\>"
syn match htmlperlStatementPword		"\<\%(get\%(pw\%(uid\|nam\)\|gr\%(gid\|nam\)\|login\)\)\|\%(end\|[gs]et\)\%(pw\|gr\)ent\>"
syn match htmlperlStatementTime		"\<\%(gmtime\|localtime\|time\)\>"

syn match htmlperlStatementMisc		"\<\%(warn\|formline\|reset\|scalar\|prototype\|lock\|tied\=\|untie\)\>"

syn keyword htmlperlTodo			TODO TBD FIXME XXX NOTE contained

syn region htmlperlStatementIndirObjWrap	matchgroup=htmlperlStatementIndirObj start="\<\%(map\|grep\|sort\|print\|system\|exec\)\>\s*{" end="}" contains=@htmlperlTop,htmlperlGenericBlock

syn match htmlperlLabel      "^\s*\h\w*\s*::\@!\%(\<v\d\+\s*:\)\@<!"

" Perl Identifiers.
"
" Should be cleaned up to better handle identifiers in particular situations
" (in hash keys for example)
"
" Plain identifiers: $foo, @foo, $#foo, %foo, &foo and dereferences $$foo, @$foo, etc.
" We do not process complex things such as @{${"foo"}}. Too complicated, and
" too slow. And what is after the -> is *not* considered as part of the
" variable - there again, too complicated and too slow.

" Special variables first ($^A, ...) and ($|, $', ...)
syn match  htmlperlVarPlain		 "$^[ACDEFHILMNOPRSTVWX]\="
syn match  htmlperlVarPlain		 "$[\\\"\[\]'&`+*.,;=%~!?@#$<>(-]"
syn match  htmlperlVarPlain		 "%+"
syn match  htmlperlVarPlain		 "$\%(0\|[1-9]\d*\)"
" Same as above, but avoids confusion in $::foo (equivalent to $main::foo)
syn match  htmlperlVarPlain		 "$::\@!"
" These variables are not recognized within matches.
syn match  htmlperlVarNotInMatches	 "$[|)]"
" This variable is not recognized within matches delimited by m//.
syn match  htmlperlVarSlash		 "$/"

" And plain identifiers
syn match  htmlperlPackageRef	 "[$@#%*&]\%(\%(::\|'\)\=\I\i*\%(\%(::\|'\)\I\i*\)*\)\=\%(::\|'\)\I"ms=s+1,me=e-1 contained

" To not highlight packages in variables as a scope reference - i.e. in
" $pack::var, pack:: is a scope, just set "htmlperl_no_scope_in_variables"
" If you don't want complex things like @{${"foo"}} to be processed,
" just set the variable "htmlperl_no_extended_vars"...

if !exists("htmlperl_no_scope_in_variables")
  syn match  htmlperlVarPlain       "\%([@$]\|\$#\)\$*\%(\I\i*\)\=\%(\%(::\|'\)\I\i*\)*\%(::\|\i\@<=\)" contains=htmlperlPackageRef nextgroup=htmlperlVarMember,htmlperlVarSimpleMember,htmlperlMethod
  syn match  htmlperlVarPlain2                   "%\$*\%(\I\i*\)\=\%(\%(::\|'\)\I\i*\)*\%(::\|\i\@<=\)" contains=htmlperlPackageRef

else
  syn match  htmlperlVarPlain       "\%([@$]\|\$#\)\$*\%(\I\i*\)\=\%(\%(::\|'\)\I\i*\)*\%(::\|\i\@<=\)" nextgroup=htmlperlVarMember,htmlperlVarSimpleMember,htmlperlMethod
  syn match  htmlperlVarPlain2                   "%\$*\%(\I\i*\)\=\%(\%(::\|'\)\I\i*\)*\%(::\|\i\@<=\)"

endif

if !exists("htmlperl_no_extended_vars")
  syn cluster htmlperlExpr		contains=htmlperlStatementIndirObjWrap,htmlperlStatementScalar,htmlperlStatementRegexp,htmlperlStatementNumeric,htmlperlStatementList,htmlperlStatementHash,htmlperlStatementFiles,htmlperlStatementTime,htmlperlStatementMisc,htmlperlVarPlain,htmlperlVarPlain2,htmlperlVarNotInMatches,htmlperlVarSlash,htmlperlVarBlock,htmlperlVarBlock2,htmlperlShellCommand,htmlperlFloat,htmlperlNumber,htmlperlStringUnexpanded,htmlperlString,htmlperlQQ,htmlperlArrow,htmlperlGenericBlock
  syn region htmlperlArrow		matchgroup=htmlperlArrow start="->\s*(" end=")" contains=@htmlperlExpr nextgroup=htmlperlVarMember,htmlperlVarSimpleMember,htmlperlMethod contained
  syn region htmlperlArrow		matchgroup=htmlperlArrow start="->\s*\[" end="\]" contains=@htmlperlExpr nextgroup=htmlperlVarMember,htmlperlVarSimpleMember,htmlperlMethod contained
  syn region htmlperlArrow		matchgroup=htmlperlArrow start="->\s*{" end="}" contains=@htmlperlExpr nextgroup=htmlperlVarMember,htmlperlVarSimpleMember,htmlperlMethod contained
  syn match  htmlperlArrow		"->\s*{\s*\I\i*\s*}" contains=htmlperlVarSimpleMemberName nextgroup=htmlperlVarMember,htmlperlVarSimpleMember,htmlperlMethod contained
  syn region htmlperlArrow		matchgroup=htmlperlArrow start="->\s*\$*\I\i*\s*(" end=")" contains=@htmlperlExpr nextgroup=htmlperlVarMember,htmlperlVarSimpleMember,htmlperlMethod contained
  syn region htmlperlVarBlock	matchgroup=htmlperlVarPlain start="\%($#\|[$@]\)\$*{" skip="\\}" end="}" contains=@htmlperlExpr nextgroup=htmlperlVarMember,htmlperlVarSimpleMember,htmlperlMethod
  syn region htmlperlVarBlock2	matchgroup=htmlperlVarPlain start="[%&*]\$*{" skip="\\}" end="}" contains=@htmlperlExpr nextgroup=htmlperlVarMember,htmlperlVarSimpleMember,htmlperlMethod
  syn match  htmlperlVarPlain2	"[%&*]\$*{\I\i*}" nextgroup=htmlperlVarMember,htmlperlVarSimpleMember,htmlperlMethod
  syn match  htmlperlVarPlain	"\%(\$#\|[@$]\)\$*{\I\i*}" nextgroup=htmlperlVarMember,htmlperlVarSimpleMember,htmlperlMethod
  syn region htmlperlVarMember	matchgroup=htmlperlVarPlain start="\%(->\)\={" skip="\\}" end="}" contained contains=@htmlperlExpr nextgroup=htmlperlVarMember,htmlperlVarSimpleMember,htmlperlMethod
  syn match  htmlperlVarSimpleMember	"\%(->\)\={\s*\I\i*\s*}" nextgroup=htmlperlVarMember,htmlperlVarSimpleMember,htmlperlMethod contains=htmlperlVarSimpleMemberName contained
  syn match  htmlperlVarSimpleMemberName	"\I\i*" contained
  syn region htmlperlVarMember	matchgroup=htmlperlVarPlain start="\%(->\)\=\[" skip="\\]" end="]" contained contains=@htmlperlExpr nextgroup=htmlperlVarMember,htmlperlVarSimpleMember,htmlperlMethod
  syn match htmlperlPackageConst	"__PACKAGE__" nextgroup=htmlperlMethod
  syn match  htmlperlMethod		"->\$*\I\i*" contained nextgroup=htmlperlVarSimpleMember,htmlperlVarMember,htmlperlMethod
endif

" File Descriptors
syn match  htmlperlFiledescRead	"<\h\w*>"

syn match  htmlperlFiledescStatementComma	"(\=\s*\u\w*\s*,"me=e-1 transparent contained contains=htmlperlFiledescStatement
syn match  htmlperlFiledescStatementNocomma "(\=\s*\u\w*\s*[^, \t]"me=e-1 transparent contained contains=htmlperlFiledescStatement

syn match  htmlperlFiledescStatement	"\u\w*" contained

" Special characters in strings and matches
syn match  htmlperlSpecialString	"\\\%(\o\{1,3}\|x\%({\x\+}\|\x\{1,2}\)\|c.\|[^cx]\)" contained extend
syn match  htmlperlSpecialStringU2	"\\." extend contained transparent contains=NONE
syn match  htmlperlSpecialStringU	"\\\\" contained
syn match  htmlperlSpecialMatch	"\\[1-9]" contained extend
syn match  htmlperlSpecialMatch	"\\g\%(\d\+\|{\%(-\=\d\+\|\h\w*\)}\)" contained
syn match  htmlperlSpecialMatch	"\\k\%(<\h\w*>\|'\h\w*'\)" contained
syn match  htmlperlSpecialMatch	"{\d\+\%(,\%(\d\+\)\=\)\=}" contained
syn match  htmlperlSpecialMatch	"\[[]-]\=[^\[\]]*[]-]\=\]" contained
syn match  htmlperlSpecialMatch	"[+*()?.]" contained
syn match  htmlperlSpecialMatch	"(?[#:=!]" contained
syn match  htmlperlSpecialMatch	"(?[impsx]*\%(-[imsx]\+\)\=)" contained
syn match  htmlperlSpecialMatch	"(?\%([-+]\=\d\+\|R\))" contained
syn match  htmlperlSpecialMatch	"(?\%(&\|P[>=]\)\h\w*)" contained
syn match  htmlperlSpecialMatch	"(\*\%(\%(PRUNE\|SKIP\|THEN\)\%(:[^)]*\)\=\|\%(MARK\|\):[^)]*\|COMMIT\|F\%(AIL\)\=\|ACCEPT\))" contained

" Possible errors
"
" Highlight lines with only whitespace (only in blank delimited here documents) as errors
syn match  htmlperlNotEmptyLine	"^\s\+$" contained
" Highlight '} else if (...) {', it should be '} else { if (...) { ' or
" '} elsif (...) {'.

syn keyword htmlperlElseIfError	elseif

" Variable interpolation
"
" These items are interpolated inside "" strings and similar constructs.
syn cluster htmlperlInterpDQ	contains=htmlperlSpecialString,htmlperlVarPlain,htmlperlVarNotInMatches,htmlperlVarSlash,htmlperlVarBlock
" These items are interpolated inside '' strings and similar constructs.
syn cluster htmlperlInterpSQ	contains=htmlperlSpecialStringU,htmlperlSpecialStringU2
" These items are interpolated inside m// matches and s/// substitutions.
syn cluster htmlperlInterpSlash	contains=htmlperlSpecialString,htmlperlSpecialMatch,htmlperlVarPlain,htmlperlVarBlock
" These items are interpolated inside m## matches and s### substitutions.
syn cluster htmlperlInterpMatch	contains=@htmlperlInterpSlash,htmlperlVarSlash

" Shell commands
syn region  htmlperlShellCommand	matchgroup=htmlperlMatchStartEnd start="`" end="`" contains=@htmlperlInterpDQ keepend

" Constants
"
" Numbers
syn match  htmlperlNumber	"\<\%(0\%(x\x[[:xdigit:]_]*\|b[01][01_]*\|\o[0-7_]*\|\)\|[1-9][[:digit:]_]*\)\>"
syn match  htmlperlFloat	"\<\d[[:digit:]_]*[eE][\-+]\=\d\+"
syn match  htmlperlFloat	"\<\d[[:digit:]_]*\.[[:digit:]_]*\%([eE][\-+]\=\d\+\)\="
syn match  htmlperlFloat	"\.[[:digit:]_]\+\%([eE][\-+]\=\d\+\)\="

syn match  htmlperlString	"\<\%(v\d\+\%(\.\d\+\)*\|\d\+\%(\.\d\+\)\{2,}\)\>" contains=htmlperlVStringV
syn match  htmlperlVStringV	"\<v" contained


syn region htmlperlParensSQ		start=+(+ end=+)+ extend contained transparent contains=htmlperlParensSQ,@htmlperlInterpSQ keepend
syn region htmlperlBracketsSQ	start=+\[+ end=+\]+ extend contained transparent contains=htmlperlBracketsSQ,@htmlperlInterpSQ keepend
syn region htmlperlBracesSQ		start=+{+ end=+}+ extend contained transparent contains=htmlperlBracesSQ,@htmlperlInterpSQ keepend
syn region htmlperlAnglesSQ		start=+<+ end=+>+ extend contained transparent contains=htmlperlAnglesSQ,@htmlperlInterpSQ keepend

syn region htmlperlParensDQ		start=+(+ end=+)+ extend contained transparent contains=htmlperlParensDQ,@htmlperlInterpDQ keepend
syn region htmlperlBracketsDQ	start=+\[+ end=+\]+ extend contained transparent contains=htmlperlBracketsDQ,@htmlperlInterpDQ keepend
syn region htmlperlBracesDQ		start=+{+ end=+}+ extend contained transparent contains=htmlperlBracesDQ,@htmlperlInterpDQ keepend
syn region htmlperlAnglesDQ		start=+<+ end=+>+ extend contained transparent contains=htmlperlAnglesDQ,@htmlperlInterpDQ keepend


" Simple version of searches and matches
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!m\>\s*\z([^[:space:]'([{<#]\)+ end=+\z1[cgimopsx]*+ contains=@htmlperlInterpMatch keepend
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!m#+ end=+#[cgimopsx]*+ contains=@htmlperlInterpMatch keepend
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!m\s*'+ end=+'[cgimopsx]*+ contains=@htmlperlInterpSQ keepend
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!m\s*/+ end=+/[cgimopsx]*+ contains=@htmlperlInterpSlash keepend
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!m\s*(+ end=+)[cgimopsx]*+ contains=@htmlperlInterpMatch,htmlperlParensDQ keepend

" A special case for m{}, m<> and m[] which allows for comments and extra whitespace in the pattern
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!m\s*{+ end=+}[cgimopsx]*+ contains=@htmlperlInterpMatch,htmlperlComment,htmlperlBracesDQ keepend
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!m\s*<+ end=+>[cgimopsx]*+ contains=@htmlperlInterpMatch,htmlperlAnglesDQ keepend
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!m\s*\[+ end=+\][cgimopsx]*+ contains=@htmlperlInterpMatch,htmlperlComment,htmlperlBracketsDQ keepend

" Below some hacks to recognise the // variant. This is virtually impossible to catch in all
" cases as the / is used in so many other ways, but these should be the most obvious ones.
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start="\%([$@%&*]\@<!\%(\<split\|\<while\|\<if\|\<unless\|\.\.\|[-+*!~(\[{=]\)\s*\)\@<=/\%(/=\)\@!" start=+^/\%(/=\)\@!+ start=+\s\@<=/\%(/=\)\@![^[:space:][:digit:]$@%=]\@=\%(/\_s*\%([([{$@%&*[:digit:]"'`]\|\_s\w\|[[:upper:]_abd-fhjklnqrt-wyz]\)\)\@!+ skip=+\\/+ end=+/[cgimopsx]*+ contains=@htmlperlInterpSlash


" Substitutions
" htmlperlMatch is the first part, htmlperlSubstitution* is the substitution part
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!s\>\s*\z([^[:space:]'([{<#]\)+ end=+\z1+me=e-1 contains=@htmlperlInterpMatch nextgroup=htmlperlSubstitutionGQQ keepend
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!s\s*'+  end=+'+me=e-1 contains=@htmlperlInterpSQ nextgroup=htmlperlSubstitutionSQ keepend
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!s\s*/+  end=+/+me=e-1 contains=@htmlperlInterpSlash nextgroup=htmlperlSubstitutionGQQ keepend
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!s#+  end=+#+me=e-1 contains=@htmlperlInterpMatch nextgroup=htmlperlSubstitutionGQQ keepend
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!s\s*(+ end=+)+ contains=@htmlperlInterpMatch,htmlperlParensDQ nextgroup=htmlperlSubstitutionGQQ skipwhite skipempty skipnl keepend
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!s\s*<+ end=+>+ contains=@htmlperlInterpMatch,htmlperlAnglesDQ nextgroup=htmlperlSubstitutionGQQ skipwhite skipempty skipnl keepend
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!s\s*\[+ end=+\]+ contains=@htmlperlInterpMatch,htmlperlBracketsDQ nextgroup=htmlperlSubstitutionGQQ skipwhite skipempty skipnl keepend
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!s\s*{+ end=+}+ contains=@htmlperlInterpMatch,htmlperlBracesDQ nextgroup=htmlperlSubstitutionGQQ skipwhite skipempty skipnl keepend
syn region htmlperlSubstitutionGQQ		matchgroup=htmlperlMatchStartEnd start=+\z([^[:space:]'([{<]\)+ end=+\z1[ecgimopsx]*+ keepend contained contains=@htmlperlInterpDQ
syn region htmlperlSubstitutionGQQ		matchgroup=htmlperlMatchStartEnd start=+(+ end=+)[ecgimopsx]*+ contained contains=@htmlperlInterpDQ,htmlperlParensDQ keepend
syn region htmlperlSubstitutionGQQ		matchgroup=htmlperlMatchStartEnd start=+\[+ end=+\][ecgimopsx]*+ contained contains=@htmlperlInterpDQ,htmlperlBracketsDQ keepend
syn region htmlperlSubstitutionGQQ		matchgroup=htmlperlMatchStartEnd start=+{+ end=+}[ecgimopsx]*+ contained contains=@htmlperlInterpDQ,htmlperlBracesDQ keepend
syn region htmlperlSubstitutionGQQ		matchgroup=htmlperlMatchStartEnd start=+<+ end=+>[ecgimopsx]*+ contained contains=@htmlperlInterpDQ,htmlperlAnglesDQ keepend
syn region htmlperlSubstitutionSQ		matchgroup=htmlperlMatchStartEnd start=+'+  end=+'[ecgimopsx]*+ contained contains=@htmlperlInterpSQ keepend 

" Translations
" htmlperlMatch is the first part, htmlperlTranslation* is the second, translator part.
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!\%(tr\|y\)\>\s*\z([^[:space:]([{<#]\)+ end=+\z1+me=e-1 contains=@htmlperlInterpSQ nextgroup=htmlperlTranslationGQ
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!\%(tr\|y\)#+ end=+#+me=e-1 contains=@htmlperlInterpSQ nextgroup=htmlperlTranslationGQ
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!\%(tr\|y\)\s*\[+ end=+\]+ contains=@htmlperlInterpSQ,htmlperlBracketsSQ nextgroup=htmlperlTranslationGQ skipwhite skipempty skipnl
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!\%(tr\|y\)\s*(+ end=+)+ contains=@htmlperlInterpSQ,htmlperlParensSQ nextgroup=htmlperlTranslationGQ skipwhite skipempty skipnl
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!\%(tr\|y\)\s*<+ end=+>+ contains=@htmlperlInterpSQ,htmlperlAnglesSQ nextgroup=htmlperlTranslationGQ skipwhite skipempty skipnl
syn region htmlperlMatch	matchgroup=htmlperlMatchStartEnd start=+\<\%(::\|'\|->\)\@<!\%(tr\|y\)\s*{+ end=+}+ contains=@htmlperlInterpSQ,htmlperlBracesSQ nextgroup=htmlperlTranslationGQ skipwhite skipempty skipnl
syn region htmlperlTranslationGQ		matchgroup=htmlperlMatchStartEnd start=+\z([^[:space:]([{<]\)+ end=+\z1[cds]*+ contained
syn region htmlperlTranslationGQ		matchgroup=htmlperlMatchStartEnd start=+(+ end=+)[cds]*+ contains=htmlperlParensSQ contained
syn region htmlperlTranslationGQ		matchgroup=htmlperlMatchStartEnd start=+\[+ end=+\][cds]*+ contains=htmlperlBracketsSQ contained
syn region htmlperlTranslationGQ		matchgroup=htmlperlMatchStartEnd start=+{+ end=+}[cds]*+ contains=htmlperlBracesSQ contained
syn region htmlperlTranslationGQ		matchgroup=htmlperlMatchStartEnd start=+<+ end=+>[cds]*+ contains=htmlperlAnglesSQ contained


" Strings and q, qq, qw and qr expressions

syn region htmlperlStringUnexpanded	matchgroup=htmlperlStringStartEnd start="'" end="'" contains=@htmlperlInterpSQ keepend
syn region htmlperlString		matchgroup=htmlperlStringStartEnd start=+"+  end=+"+ contains=@htmlperlInterpDQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!q\>\s*\z([^[:space:]#([{<]\)+ end=+\z1+ contains=@htmlperlInterpSQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!q#+ end=+#+ contains=@htmlperlInterpSQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!q\s*(+ end=+)+ contains=@htmlperlInterpSQ,htmlperlParensSQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!q\s*\[+ end=+\]+ contains=@htmlperlInterpSQ,htmlperlBracketsSQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!q\s*{+ end=+}+ contains=@htmlperlInterpSQ,htmlperlBracesSQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!q\s*<+ end=+>+ contains=@htmlperlInterpSQ,htmlperlAnglesSQ keepend

syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!q[qx]\>\s*\z([^[:space:]#([{<]\)+ end=+\z1+ contains=@htmlperlInterpDQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!q[qx]#+ end=+#+ contains=@htmlperlInterpDQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!q[qx]\s*(+ end=+)+ contains=@htmlperlInterpDQ,htmlperlParensDQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!q[qx]\s*\[+ end=+\]+ contains=@htmlperlInterpDQ,htmlperlBracketsDQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!q[qx]\s*{+ end=+}+ contains=@htmlperlInterpDQ,htmlperlBracesDQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!q[qx]\s*<+ end=+>+ contains=@htmlperlInterpDQ,htmlperlAnglesDQ keepend

syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!qw\s*\z([^[:space:]#([{<]\)+  end=+\z1+ contains=@htmlperlInterpSQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!qw#+  end=+#+ contains=@htmlperlInterpSQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!qw\s*(+  end=+)+ contains=@htmlperlInterpSQ,htmlperlParensSQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!qw\s*\[+  end=+\]+ contains=@htmlperlInterpSQ,htmlperlBracketsSQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!qw\s*{+  end=+}+ contains=@htmlperlInterpSQ,htmlperlBracesSQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!qw\s*<+  end=+>+ contains=@htmlperlInterpSQ,htmlperlAnglesSQ keepend

syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!qr\>\s*\z([^[:space:]#([{<'/]\)+  end=+\z1[imosx]*+ contains=@htmlperlInterpMatch keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!qr\s*/+  end=+/[imosx]*+ contains=@htmlperlInterpSlash keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!qr#+  end=+#[imosx]*+ contains=@htmlperlInterpMatch keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!qr\s*'+  end=+'[imosx]*+ contains=@htmlperlInterpSQ keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!qr\s*(+  end=+)[imosx]*+ contains=@htmlperlInterpMatch,htmlperlParensDQ keepend

" A special case for qr{}, qr<> and qr[] which allows for comments and extra whitespace in the pattern
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!qr\s*{+  end=+}[imosx]*+ contains=@htmlperlInterpMatch,htmlperlBracesDQ,htmlperlComment keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!qr\s*<+  end=+>[imosx]*+ contains=@htmlperlInterpMatch,htmlperlAnglesDQ,htmlperlComment keepend
syn region htmlperlQQ		matchgroup=htmlperlStringStartEnd start=+\<\%(::\|'\|->\)\@<!qr\s*\[+  end=+\][imosx]*+ contains=@htmlperlInterpMatch,htmlperlBracketsDQ,htmlperlComment keepend

" Constructs such as print <<EOF [...] EOF, 'here' documents
"
" XXX Any statements after the identifier are in htmlperlString colour (i.e.
" 'if $a' in 'print <<EOF if $a'). This is almost impossible to get right it
" seems due to the 'auto-extending nature' of regions.
if exists("htmlperl_fold")
  syn region htmlperlHereDoc	matchgroup=htmlperlStringStartEnd start=+<<\z(\I\i*\).*+    end=+^\z1$+ contains=@htmlperlInterpDQ fold
  syn region htmlperlHereDoc	matchgroup=htmlperlStringStartEnd start=+<<\s*"\z([^\\"]*\%(\\.[^\\"]*\)*\)"+ end=+^\z1$+ contains=@htmlperlInterpDQ fold
  syn region htmlperlHereDoc	matchgroup=htmlperlStringStartEnd start=+<<\s*'\z([^\\']*\%(\\.[^\\']*\)*\)'+ end=+^\z1$+ contains=@htmlperlInterpSQ fold
  syn region htmlperlHereDoc	matchgroup=htmlperlStringStartEnd start=+<<\s*""+           end=+^$+    contains=@htmlperlInterpDQ,htmlperlNotEmptyLine fold
  syn region htmlperlHereDoc	matchgroup=htmlperlStringStartEnd start=+<<\s*''+           end=+^$+    contains=@htmlperlInterpSQ,htmlperlNotEmptyLine fold
  syn region htmlperlAutoload	matchgroup=htmlperlStringStartEnd start=+<<\s*\(['"]\=\)\z(END_\%(SUB\|OF_FUNC\|OF_AUTOLOAD\)\)\1+ end=+^\z1$+ contains=ALL fold
else
  syn region htmlperlHereDoc	matchgroup=htmlperlStringStartEnd start=+<<\z(\I\i*\)+    end=+^\z1$+ contains=@htmlperlInterpDQ
  syn region htmlperlHereDoc	matchgroup=htmlperlStringStartEnd start=+<<\s*"\z([^\\"]*\%(\\.[^\\"]*\)*\)"+ end=+^\z1$+ contains=@htmlperlInterpDQ
  syn region htmlperlHereDoc	matchgroup=htmlperlStringStartEnd start=+<<\s*'\z([^\\']*\%(\\.[^\\']*\)*\)'+ end=+^\z1$+ contains=@htmlperlInterpSQ
  syn region htmlperlHereDoc	matchgroup=htmlperlStringStartEnd start=+<<\s*""+           end=+^$+    contains=@htmlperlInterpDQ,htmlperlNotEmptyLine
  syn region htmlperlHereDoc	matchgroup=htmlperlStringStartEnd start=+<<\s*''+           end=+^$+    contains=@htmlperlInterpSQ,htmlperlNotEmptyLine
  syn region htmlperlAutoload	matchgroup=htmlperlStringStartEnd start=+<<\s*\(['"]\=\)\z(END_\%(SUB\|OF_FUNC\|OF_AUTOLOAD\)\)\1+ end=+^\z1$+ contains=ALL
endif


" Class declarations
"
syn match   htmlperlPackageDecl		"\<package\s\+\%(\h\|::\)\%(\w\|::\)*" contains=htmlperlStatementPackage
syn keyword htmlperlStatementPackage	package contained

" Functions
"       sub [name] [(prototype)] {
"
syn match htmlperlSubError "[^[:space:];{#]" contained
if v:version == 701 && !has('patch221')  " XXX I hope that's the right one
    syn match htmlperlSubAttributes ":" contained
else
    syn match htmlperlSubAttributesCont "\h\w*\_s*\%(:\_s*\)\=" nextgroup=@htmlperlSubAttrMaybe contained
    syn region htmlperlSubAttributesCont matchgroup=htmlperlSubAttributesCont start="\h\w*(" end=")\_s*\%(:\_s*\)\=" nextgroup=@htmlperlSubAttrMaybe contained contains=@htmlperlInterpSQ,htmlperlParensSQ
    syn cluster htmlperlSubAttrMaybe contains=htmlperlSubAttributesCont,htmlperlSubError
    syn match htmlperlSubAttributes "" contained nextgroup=htmlperlSubError
    syn match htmlperlSubAttributes ":\_s*" contained nextgroup=@htmlperlSubAttrMaybe
endif
syn match htmlperlSubPrototypeError "(\%(\_s*\%(\%(\\\%([$@%&*]\|\[[$@%&*]\+\]\)\|[$&*]\|[@%]\%(\_s*)\)\@=\|;\%(\_s*[)$@%&*\\]\)\@=\|_\%(\_s*[);]\)\@=\)\_s*\)*\)\@>\zs\_[^)]\+" contained
syn match htmlperlSubPrototype +(\_[^)]*)\_s*\|+ nextgroup=htmlperlSubAttributes contained contains=htmlperlSubPrototypeError
syn match htmlperlSubName +\%(\h\|::\|'\w\)\%(\w\|::\|'\w\)*\_s*\|+ contained nextgroup=htmlperlSubPrototype

syn match htmlperlFunction +\<sub\>\_s*+ nextgroup=htmlperlSubName

if !exists("htmlperl_no_scope_in_variables")
   syn match  htmlperlFunctionPRef	"\h\w*::" contained

else

endif

" The => operator forces a bareword to the left of it to be interpreted as
" a string
syn match  htmlperlString "\I\@<!-\?\I\i*\%(\s*=>\)\@="

" All other # are comments, except ^#!
syn match  htmlperlComment		"#.*" contains=htmlperlTodo,@Spell
syn match  htmlperlSharpBang	"^#!.*"

" Formats
syn region htmlperlFormat		matchgroup=htmlperlStatementIOFunc start="^\s*\<format\s\+\k\+\s*=\s*$"rs=s+6 end="^\s*\.\s*$" contains=htmlperlFormatName,htmlperlFormatField,htmlperlVarPlain,htmlperlVarPlain2
syn match  htmlperlFormatName	"format\s\+\k\+\s*="lc=7,me=e-1 contained
syn match  htmlperlFormatField	"[@^][|<>~]\+\%(\.\.\.\)\=" contained
syn match  htmlperlFormatField	"[@^]#[#.]*" contained
syn match  htmlperlFormatField	"@\*" contained
syn match  htmlperlFormatField	"@[^A-Za-z_|<>~#*]"me=e-1 contained
syn match  htmlperlFormatField	"@$" contained

" __END__ and __DATA__ clauses
if exists("htmlperl_fold")
  syntax region htmlperlDATA		start="^__\%(DATA\|END\)__$" skip="." end="." contains=htmlperlPOD,@htmlperlDATA fold
else
  syntax region htmlperlDATA		start="^__\%(DATA\|END\)__$" skip="." end="." contains=htmlperlPOD,@htmlperlDATA
endif

"
" Folding

if exists("htmlperl_fold")
  " Note: this bit must come before the actual highlighting of the "package"
  " keyword, otherwise this will screw up Pod lines that match /^package/
  if !exists("htmlperl_nofold_packages")
    syn region htmlperlPackageFold start="^package \S\+;\s*\%(#.*\)\=$" end="^1;\=\s*\%(#.*\)\=$" end="\n\+package"me=s-1 transparent fold keepend
  endif
  if !exists("htmlperl_nofold_subs")
    syn region htmlperlSubFold     start="^\z(\s*\)\<sub\>.*[^};]$" end="^\z1}\s*\%(#.*\)\=$" transparent fold keepend
    syn region htmlperlSubFold start="^\z(\s*\)\<\%(BEGIN\|END\|CHECK\|INIT\|UNITCHECK\)\>.*[^};]$" end="^\z1}\s*$" transparent fold keepend
  endif

  if exists("htmlperl_fold_blocks")
    syn region htmlperlBlockFold start="^\z(\s*\)\%(if\|elsif\|unless\|for\|while\|until\|given\)\s*(.*)\%(\s*{\)\=\s*\%(#.*\)\=$" start="^\z(\s*\)foreach\s*\%(\%(my\|our\)\=\s*\S\+\s*\)\=(.*)\%(\s*{\)\=\s*\%(#.*\)\=$" end="^\z1}\s*;\=\%(#.*\)\=$" transparent fold keepend
    syn region htmlperlBlockFold start="^\z(\s*\)\%(do\|else\)\%(\s*{\)\=\s*\%(#.*\)\=$" end="^\z1}\s*while" end="^\z1}\s*;\=\%(#.*\)\=$" transparent fold keepend
  endif

  setlocal foldmethod=syntax
  syn sync fromstart
else
  " fromstart above seems to set minlines even if htmlperl_fold is not set.
  syn sync minlines=0
endif

command -nargs=+ HiLink hi def link <args>

" The default highlighting.
HiLink htmlperlSharpBang		PreProc
HiLink htmlperlControl		PreProc
HiLink htmlperlInclude		Include
HiLink htmlperlSpecial		Special
HiLink htmlperlString		String
HiLink htmlperlCharacter		Character
HiLink htmlperlNumber		Number
HiLink htmlperlFloat		Float
HiLink htmlperlType			Type
HiLink htmlperlIdentifier		Identifier
HiLink htmlperlLabel		Label
HiLink htmlperlStatement		Statement
HiLink htmlperlConditional		Conditional
HiLink htmlperlRepeat		Repeat
HiLink htmlperlOperator		Operator
HiLink htmlperlFunction		Keyword
HiLink htmlperlSubName		Function
HiLink htmlperlSubPrototype		Type
HiLink htmlperlSubAttributes	PreProc
HiLink htmlperlSubAttributesCont	htmlperlSubAttributes
HiLink htmlperlComment		Comment
HiLink htmlperlTodo			Todo
if exists("htmlperl_string_as_statement")
  HiLink htmlperlStringStartEnd	htmlperlStatement
else
  HiLink htmlperlStringStartEnd	htmlperlString
endif
HiLink htmlperlVStringV		htmlperlStringStartEnd
HiLink htmlperlList			htmlperlStatement
HiLink htmlperlMisc			htmlperlStatement
HiLink htmlperlVarPlain		htmlperlIdentifier
HiLink htmlperlVarPlain2		htmlperlIdentifier
HiLink htmlperlArrow		htmlperlIdentifier
HiLink htmlperlFiledescRead		htmlperlIdentifier
HiLink htmlperlFiledescStatement	htmlperlIdentifier
HiLink htmlperlVarSimpleMember	htmlperlIdentifier
HiLink htmlperlVarSimpleMemberName 	htmlperlString
HiLink htmlperlVarNotInMatches	htmlperlIdentifier
HiLink htmlperlVarSlash		htmlperlIdentifier
HiLink htmlperlQQ			htmlperlString
HiLink htmlperlHereDoc		htmlperlString
HiLink htmlperlStringUnexpanded	htmlperlString
HiLink htmlperlSubstitutionSQ	htmlperlString
HiLink htmlperlSubstitutionGQQ	htmlperlString
HiLink htmlperlTranslationGQ	htmlperlString
HiLink htmlperlMatch		htmlperlString
HiLink htmlperlMatchStartEnd	htmlperlStatement
HiLink htmlperlFormatName		htmlperlIdentifier
HiLink htmlperlFormatField		htmlperlString
HiLink htmlperlPackageDecl		htmlperlType
HiLink htmlperlStorageClass		htmlperlType
HiLink htmlperlPackageRef		htmlperlType
HiLink htmlperlStatementPackage	htmlperlStatement
HiLink htmlperlStatementStorage	htmlperlStatement
HiLink htmlperlStatementControl	htmlperlStatement
HiLink htmlperlStatementScalar	htmlperlStatement
HiLink htmlperlStatementRegexp	htmlperlStatement
HiLink htmlperlStatementNumeric	htmlperlStatement
HiLink htmlperlStatementList	htmlperlStatement
HiLink htmlperlStatementHash	htmlperlStatement
HiLink htmlperlStatementIOfunc	htmlperlStatement
HiLink htmlperlStatementFiledesc	htmlperlStatement
HiLink htmlperlStatementVector	htmlperlStatement
HiLink htmlperlStatementFiles	htmlperlStatement
HiLink htmlperlStatementFlow	htmlperlStatement
HiLink htmlperlStatementInclude	htmlperlStatement
HiLink htmlperlStatementProc	htmlperlStatement
HiLink htmlperlStatementSocket	htmlperlStatement
HiLink htmlperlStatementIPC		htmlperlStatement
HiLink htmlperlStatementNetwork	htmlperlStatement
HiLink htmlperlStatementPword	htmlperlStatement
HiLink htmlperlStatementTime	htmlperlStatement
HiLink htmlperlStatementMisc	htmlperlStatement
HiLink htmlperlStatementIndirObj	htmlperlStatement

HiLink htmlperlMethod		htmlperlIdentifier
HiLink htmlperlFunctionPRef		htmlperlType
HiLink htmlperlPOD			htmlperlComment
HiLink htmlperlShellCommand		htmlperlString
HiLink htmlperlSpecialAscii		htmlperlSpecial
HiLink htmlperlSpecialDollar	htmlperlSpecial
HiLink htmlperlSpecialString	htmlperlSpecial
HiLink htmlperlSpecialStringU	htmlperlSpecial
HiLink htmlperlSpecialMatch		htmlperlSpecial
HiLink htmlperlDATA			htmlperlComment

" Possible errors
HiLink htmlperlNotEmptyLine		Error
HiLink htmlperlElseIfError		Error
HiLink htmlperlSubPrototypeError	Error
HiLink htmlperlSubError		Error

delcommand HiLink

" Syncing to speed up processing
"
if !exists("htmlperl_no_sync_on_sub")
  syn sync match htmlperlSync	grouphere NONE "^\s*\<package\s"
  syn sync match htmlperlSync	grouphere NONE "^\s*\<sub\>"
  syn sync match htmlperlSync	grouphere NONE "^}"
endif

if !exists("htmlperl_no_sync_on_global_var")
  syn sync match htmlperlSync	grouphere NONE "^$\I[[:alnum:]_:]+\s*=\s*{"
  syn sync match htmlperlSync	grouphere NONE "^[@%]\I[[:alnum:]_:]+\s*=\s*("
endif

if exists("htmlperl_sync_dist")
  execute "syn sync maxlines=" . htmlperl_sync_dist
else
  syn sync maxlines=100
endif

syn sync match htmlperlSyncPOD	grouphere htmlperlPOD "^=pod"
syn sync match htmlperlSyncPOD	grouphere htmlperlPOD "^=head"
syn sync match htmlperlSyncPOD	grouphere htmlperlPOD "^=item"
syn sync match htmlperlSyncPOD	grouphere NONE "^=cut"

let b:current_syntax = "htmlperl"

" XXX Change to sts=4:sw=4
" vim:ts=8:sts=2:sw=2:expandtab:ft=vim

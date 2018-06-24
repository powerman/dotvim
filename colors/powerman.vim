set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name = "powerman"

""" Базовые
hi Normal				ctermfg=7   ctermbg=4	    cterm=NONE
hi Comment				ctermfg=6   ctermbg=0	    cterm=NONE
hi PreProc				ctermfg=5   ctermbg=0	    cterm=bold
hi Constant				ctermfg=3   ctermbg=NONE    cterm=bold
hi Special				ctermfg=5   ctermbg=NONE    cterm=bold
hi Identifier				ctermfg=2   ctermbg=NONE    cterm=bold
hi Statement				ctermfg=7   ctermbg=NONE    cterm=bold
hi NonText				ctermfg=6   ctermbg=NONE    cterm=NONE
hi Underlined				ctermfg=7   ctermbg=NONE    cterm=NONE
hi Type		                        ctermfg=5   ctermbg=NONE    cterm=bold
" - поиск (:set hls), quickfix window (текущая ошибка)
hi Search				ctermfg=0   ctermbg=6	    cterm=NONE
hi Delimiter				ctermfg=6   ctermbg=NONE    cterm=NONE
""" Обозначить правую границу (обычно на 80 колонке)
hi ColorColumn				ctermfg=4   ctermbg=NONE    cterm=bold
""" Стоп-слова
hi Todo						    ctermbg=3	    cterm=NONE
""" vim
hi vimBracket				ctermfg=2   ctermbg=NONE    cterm=bold
hi qfError				ctermfg=9   ctermbg=NONE    cterm=NONE
""" mail
hi mailQuoted1				ctermfg=6   ctermbg=0	    cterm=NONE
hi mailQuoted2				ctermfg=2   ctermbg=0	    cterm=NONE
""" sh
hi link zshOperator Statement
hi link zshFunction Function
hi link zshVariable Identifier
hi link zshVariableDef Identifier
""" markdown
hi link markdownCode Identifier
hi link markdownCodeBlock Identifier
""" go
hi goPredefinedIdentifiers              ctermfg=3   ctermbg=NONE    cterm=bold
hi link goReceiverType goTypeName
hi link goTypeConstructor NONE
""" perl
hi perlMethod				ctermfg=7   ctermbg=NONE    cterm=NONE
hi perlType				ctermfg=2   ctermbg=NONE    cterm=NONE
hi perlNOT				ctermfg=6   ctermbg=NONE    cterm=bold
""" mojo
hi PerlInside					    ctermbg=0
hi MojoStart				ctermfg=12  ctermbg=0
hi MojoSingleStart			ctermfg=12  ctermbg=0
hi MojoEnd				ctermfg=12  ctermbg=0
""" perl внутри html
hi htmlperlDelimiter			ctermfg=4   ctermbg=0	    cterm=bold
hi htmlperlBlock			ctermfg=7   ctermbg=0	    cterm=NONE
hi htmlperlGenericBlock			ctermfg=7   ctermbg=0	    cterm=NONE
hi htmlperlVarMember			ctermfg=7   ctermbg=0	    cterm=NONE
hi htmlperlVarBlock2			ctermfg=7   ctermbg=0	    cterm=NONE
hi htmlperlStatementIndirObjWrap	ctermfg=7   ctermbg=0	    cterm=NONE
hi htmlperlMethod			ctermfg=7   ctermbg=0	    cterm=NONE
hi htmlperlNOT				ctermfg=6   ctermbg=0	    cterm=bold
hi htmlperlSpecial			ctermfg=5   ctermbg=0	    cterm=bold
hi htmlperlString			ctermfg=3   ctermbg=0	    cterm=bold
hi htmlperlNumber			ctermfg=3   ctermbg=0	    cterm=bold
hi htmlperlFloat			ctermfg=3   ctermbg=0	    cterm=bold
hi htmlperlType				ctermfg=2   ctermbg=0	    cterm=bold
hi htmlperlIdentifier			ctermfg=2   ctermbg=0	    cterm=NONE
hi htmlperlLabel			ctermfg=7   ctermbg=0	    cterm=NONE
hi htmlperlStatement			ctermfg=7   ctermbg=0	    cterm=bold
hi htmlperlConditional			ctermfg=7   ctermbg=0	    cterm=bold
hi htmlperlRepeat			ctermfg=7   ctermbg=0	    cterm=bold
hi htmlperlOperator			ctermfg=7   ctermbg=0	    cterm=bold
hi htmlperlFunction			ctermfg=7   ctermbg=0	    cterm=bold
hi htmlperlSubName			ctermfg=2   ctermbg=0	    cterm=NONE
hi htmlperlSubPrototype			ctermfg=1   ctermbg=0	    cterm=NONE
hi htmlperlSubAttributes		ctermfg=1   ctermbg=0	    cterm=NONE
hi htmlperlSubAttributesCont		ctermfg=1   ctermbg=0	    cterm=NONE
hi htmlperlComment			ctermfg=6   ctermbg=0	    cterm=bold
hi htmlperlTodo				ctermfg=0   ctermbg=3	    cterm=NONE
hi htmlperlNotEmptyLine			ctermfg=7   ctermbg=1	    cterm=bold
hi htmlperlElseIfError			ctermfg=2   ctermbg=1	    cterm=NONE
hi htmlperlSubPrototypeError		ctermfg=7   ctermbg=1	    cterm=bold
hi htmlperlSubError			ctermfg=7   ctermbg=1	    cterm=bold
""" javascript внутри template
hi JSTmplBlock					    ctermbg=17
hi tmpljavaScriptParens				    ctermbg=17
hi tmpljavaScriptValue				    ctermbg=17
hi tmpljavaScriptConditional		ctermfg=7   ctermbg=17	    cterm=bold
hi tmpljavaScriptOperator		ctermfg=7   ctermbg=17	    cterm=bold
hi tmpljavaScriptBraces			ctermfg=2   ctermbg=17	    cterm=bold
hi tmpljavaScriptIdentifier		ctermfg=2   ctermbg=17	    cterm=bold
hi tmpljavaScriptFunction		ctermfg=2   ctermbg=17	    cterm=bold
hi tmpljavaScriptStringS		ctermfg=3   ctermbg=17	    cterm=bold
hi tmpljavaScriptStringD		ctermfg=3   ctermbg=17	    cterm=bold
hi tmpljavaScriptRegexpString		ctermfg=3   ctermbg=17	    cterm=bold
hi tmpljavaScriptType			ctermfg=81  ctermbg=17

if &t_Co > 8
    """ Базовые
    hi Constant			ctermfg=11      ctermbg=NONE    cterm=NONE
    """ Go
    hi goFunctionCall		ctermfg=81	ctermbg=NONE	cterm=NONE
    hi goTypeName               ctermfg=170     ctermbg=NONE    cterm=bold
    """ JavaScript templates inside html
    hi JSTmplTag		ctermfg=213	ctermbg=8	cterm=NONE
    hi JSTmplDelimiter		ctermfg=13	ctermbg=0	cterm=NONE
    """ vim
    hi MatchParen		ctermfg=NONE	ctermbg=238	cterm=NONE
    hi TabLine			ctermfg=15	ctermbg=234	cterm=NONE
    hi TabLineFill		ctermfg=15	ctermbg=234	cterm=NONE
    hi TabLineSel		ctermfg=15	ctermbg=239	cterm=NONE
    hi Pmenu			ctermfg=245	ctermbg=19	cterm=NONE
    hi PmenuSel			ctermfg=245	ctermbg=17	cterm=NONE
"    hi StatusLine		ctermfg=15	ctermbg=234	cterm=NONE
"    hi StatusLineNC		ctermfg=242	ctermbg=234	cterm=NONE
    """ markdown
    hi markdownItalic           ctermfg=81      ctermbg=NONE    cterm=italic
    """ asciidoc
    hi asciidocQuotedEmphasized ctermfg=81      ctermbg=NONE    cterm=italic
    hi asciidocQuotedEmphasized2 ctermfg=81     ctermbg=NONE    cterm=italic
    hi asciidocXref		ctermfg=115	ctermbg=NONE	cterm=underline
    hi asciidocLink		ctermfg=115	ctermbg=NONE	cterm=underline
    hi link asciidocSubscriptDelimiter			SpecialChar
    hi link asciidocSuperscriptDelimiter		SpecialChar
    hi link asciidocMonospacedDelimiter			SpecialChar
    hi link asciidocMonospaced2Delimiter		SpecialChar
    hi link asciidocUnconstrainedMonospacedDelimiter	SpecialChar
    hi link asciidocEmphasizedDelimiter			SpecialChar
    hi link asciidocEmphasized2Delimiter		SpecialChar
    hi link asciidocUnconstrainedEmphasizedDelimiter	SpecialChar
    hi link asciidocBoldDelimiter			SpecialChar
    hi link asciidocUnconstrainedBoldDelimiter		SpecialChar
    hi link asciidocUnquotedDelimiter			SpecialChar
    hi link asciidocUnconstrainedUnquotedDelimiter	SpecialChar
    hi link asciidocConcealUnReplacement		SpecialChar
endif

""" spell
if &t_Co > 8
    hi SpellBad			ctermfg=NONE	ctermbg=NONE	cterm=underline
    hi SpellCap			ctermfg=NONE	ctermbg=NONE	cterm=NONE
    hi SpellLocal		ctermfg=NONE	ctermbg=NONE	cterm=underline
    hi SpellRare		ctermfg=NONE	ctermbg=NONE	cterm=NONE
else
    hi SpellCap			ctermfg=NONE	ctermbg=NONE	cterm=NONE
    hi SpellRare		ctermfg=NONE	ctermbg=NONE	cterm=NONE
    hi SpellBad			ctermfg=3	ctermbg=NONE	cterm=NONE
    hi SpellLocal		ctermfg=3	ctermbg=NONE	cterm=NONE
    autocmd BufEnter *	if &ft == "perl" |  hi SpellBad ctermbg=0	| endif
    autocmd BufLeave *			    hi SpellBad ctermbg=NONE
    autocmd BufEnter *	if &ft == "perl" |  hi SpellLocal ctermbg=0	| endif
    autocmd BufLeave *			    hi SpellLocal ctermbg=NONE
endif


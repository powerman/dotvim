set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name = "powerman"

""" Базовые
hi Normal				ctermfg=7   ctermbg=4	    cterm=NONE
hi Comment				ctermfg=6   ctermbg=0	    cterm=NONE
hi PreProc				ctermfg=5   ctermbg=0       cterm=bold
hi Constant				ctermfg=3   ctermbg=NONE    cterm=bold
hi Special				ctermfg=5   ctermbg=NONE    cterm=bold
hi Identifier				ctermfg=2   ctermbg=NONE    cterm=bold
hi Statement				ctermfg=7   ctermbg=NONE    cterm=bold
hi NonText				ctermfg=6   ctermbg=NONE    cterm=NONE
hi Underlined				ctermfg=7   ctermbg=NONE    cterm=NONE
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
""" perl
hi perlMethod				ctermfg=7   ctermbg=NONE    cterm=NONE
hi perlType				ctermfg=2   ctermbg=NONE    cterm=NONE
hi perlNOT				ctermfg=6   ctermbg=NONE    cterm=bold
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

if &t_Co > 8
    """ Базовые
    hi Type			ctermfg=81	ctermbg=NONE	cterm=NONE
    """ JavaScript templates inside html
    hi JSTmplTag		ctermfg=213	ctermbg=8	cterm=NONE
    hi JSTmplDelimiter		ctermfg=13	ctermbg=0	cterm=NONE
    """ vim
    hi MatchParen		ctermfg=NONE	ctermbg=238	cterm=NONE
    hi TabLine			ctermfg=15	ctermbg=234	cterm=NONE
    hi TabLineFill		ctermfg=15	ctermbg=234	cterm=NONE
    hi TabLineSel		ctermfg=15	ctermbg=239	cterm=NONE
"    hi StatusLine		ctermfg=15	ctermbg=234	cterm=NONE
"    hi StatusLineNC		ctermfg=242	ctermbg=234	cterm=NONE
    """ asciidoc
    hi asciidocXref		ctermfg=115	ctermbg=NONE	cterm=underline
    hi asciidocLink		ctermfg=115	ctermbg=NONE	cterm=underline
endif

""" spell
if &t_Co > 8
    hi SpellBad			ctermfg=NONE    ctermbg=NONE    cterm=underline
    hi SpellCap			ctermfg=NONE    ctermbg=NONE    cterm=NONE
    hi SpellLocal		ctermfg=NONE    ctermbg=NONE    cterm=underline
    hi SpellRare		ctermfg=NONE    ctermbg=NONE    cterm=NONE
else
    hi SpellCap			ctermfg=NONE	ctermbg=NONE    cterm=NONE
    hi SpellRare		ctermfg=NONE	ctermbg=NONE    cterm=NONE
    hi SpellBad			ctermfg=3	ctermbg=NONE    cterm=NONE
    hi SpellLocal		ctermfg=3	ctermbg=NONE    cterm=NONE
    autocmd BufEnter *	if &ft == "perl" |  hi SpellBad ctermbg=0	| endif
    autocmd BufLeave *			    hi SpellBad ctermbg=NONE
    autocmd BufEnter *	if &ft == "perl" |  hi SpellLocal ctermbg=0	| endif
    autocmd BufLeave *			    hi SpellLocal ctermbg=NONE
endif

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name = "powerman"

""" Базовые
hi Normal                        ctermfg=7    ctermbg=4    cterm=NONE      guifg=#888888 guibg=#000088 gui=NONE
hi Comment                       ctermfg=6    ctermbg=0    cterm=NONE      guifg=#008888 guibg=#000000 gui=NONE
hi PreProc                       ctermfg=5    ctermbg=0    cterm=bold      guifg=#880088 guibg=#000000 gui=bold
hi Constant                      ctermfg=3    ctermbg=NONE cterm=bold      guifg=#884400 guibg=NONE    gui=bold
hi Special                       ctermfg=5    ctermbg=NONE cterm=bold      guifg=#880088 guibg=NONE    gui=bold
hi Identifier                    ctermfg=2    ctermbg=NONE cterm=bold      guifg=#008800 guibg=NONE    gui=bold
hi Statement                     ctermfg=7    ctermbg=NONE cterm=bold      guifg=#888888 guibg=NONE    gui=bold
hi NonText                       ctermfg=6    ctermbg=NONE cterm=NONE      guifg=#008888 guibg=NONE    gui=NONE
hi Underlined                    ctermfg=7    ctermbg=NONE cterm=NONE      guifg=#888888 guibg=NONE    gui=NONE
hi Type                          ctermfg=5    ctermbg=NONE cterm=bold      guifg=#880088 guibg=NONE    gui=bold
" - поиск (:set hls), quickfix window (текущая ошибка)
hi Search                        ctermfg=0    ctermbg=6    cterm=NONE      guifg=#000000 guibg=#008888 gui=NONE
hi Delimiter                     ctermfg=6    ctermbg=NONE cterm=NONE      guifg=#008888 guibg=NONE    gui=NONE
""" Обозначить правую границу (обычно на 80 колонке)
hi ColorColumn                   ctermfg=4    ctermbg=NONE cterm=bold      guifg=#000088 guibg=NONE    gui=bold
""" Стоп-слова
hi Todo                                       ctermbg=3    cterm=NONE                    guibg=#884400 gui=NONE
""" vim
hi vimBracket                    ctermfg=2    ctermbg=NONE cterm=bold      guifg=#008800 guibg=NONE    gui=bold
hi qfError                       ctermfg=9    ctermbg=NONE cterm=NONE      guifg=#cc4444 guibg=NONE    gui=NONE
""" mail
hi mailQuoted1                   ctermfg=6    ctermbg=0    cterm=NONE      guifg=#008888 guibg=#000000 gui=NONE
hi mailQuoted2                   ctermfg=2    ctermbg=0    cterm=NONE      guifg=#008800 guibg=#000000 gui=NONE
""" sh
hi link zshOperator Statement
hi link zshFunction Function
hi link zshVariable Identifier
hi link zshVariableDef Identifier
""" markdown
hi link markdownCode Identifier
hi link markdownCodeBlock Identifier
""" go
hi goPredefinedIdentifiers       ctermfg=3    ctermbg=NONE cterm=bold      guifg=#884400 guibg=NONE    gui=bold
hi link goReceiverType goTypeName
hi link goTypeConstructor NONE
""" perl
hi perlMethod                    ctermfg=7    ctermbg=NONE cterm=NONE      guifg=#888888 guibg=NONE    gui=NONE
hi perlType                      ctermfg=2    ctermbg=NONE cterm=NONE      guifg=#008800 guibg=NONE    gui=NONE
hi perlNOT                       ctermfg=6    ctermbg=NONE cterm=bold      guifg=#008888 guibg=NONE    gui=bold
""" mojo
hi PerlInside                                 ctermbg=0                                  guibg=#000000
hi MojoStart                     ctermfg=12   ctermbg=0                    guifg=#4444cc guibg=#000000
hi MojoSingleStart               ctermfg=12   ctermbg=0                    guifg=#4444cc guibg=#000000
hi MojoEnd                       ctermfg=12   ctermbg=0                    guifg=#4444cc guibg=#000000
""" perl внутри html
hi htmlperlDelimiter             ctermfg=4    ctermbg=0    cterm=bold      guifg=#000088 guibg=#000000 gui=bold
hi htmlperlBlock                 ctermfg=7    ctermbg=0    cterm=NONE      guifg=#888888 guibg=#000000 gui=NONE
hi htmlperlGenericBlock          ctermfg=7    ctermbg=0    cterm=NONE      guifg=#888888 guibg=#000000 gui=NONE
hi htmlperlVarMember             ctermfg=7    ctermbg=0    cterm=NONE      guifg=#888888 guibg=#000000 gui=NONE
hi htmlperlVarBlock2             ctermfg=7    ctermbg=0    cterm=NONE      guifg=#888888 guibg=#000000 gui=NONE
hi htmlperlStatementIndirObjWrap ctermfg=7    ctermbg=0    cterm=NONE      guifg=#888888 guibg=#000000 gui=NONE
hi htmlperlMethod                ctermfg=7    ctermbg=0    cterm=NONE      guifg=#888888 guibg=#000000 gui=NONE
hi htmlperlNOT                   ctermfg=6    ctermbg=0    cterm=bold      guifg=#008888 guibg=#000000 gui=bold
hi htmlperlSpecial               ctermfg=5    ctermbg=0    cterm=bold      guifg=#880088 guibg=#000000 gui=bold
hi htmlperlString                ctermfg=3    ctermbg=0    cterm=bold      guifg=#884400 guibg=#000000 gui=bold
hi htmlperlNumber                ctermfg=3    ctermbg=0    cterm=bold      guifg=#884400 guibg=#000000 gui=bold
hi htmlperlFloat                 ctermfg=3    ctermbg=0    cterm=bold      guifg=#884400 guibg=#000000 gui=bold
hi htmlperlType                  ctermfg=2    ctermbg=0    cterm=bold      guifg=#008800 guibg=#000000 gui=bold
hi htmlperlIdentifier            ctermfg=2    ctermbg=0    cterm=NONE      guifg=#008800 guibg=#000000 gui=NONE
hi htmlperlLabel                 ctermfg=7    ctermbg=0    cterm=NONE      guifg=#888888 guibg=#000000 gui=NONE
hi htmlperlStatement             ctermfg=7    ctermbg=0    cterm=bold      guifg=#888888 guibg=#000000 gui=bold
hi htmlperlConditional           ctermfg=7    ctermbg=0    cterm=bold      guifg=#888888 guibg=#000000 gui=bold
hi htmlperlRepeat                ctermfg=7    ctermbg=0    cterm=bold      guifg=#888888 guibg=#000000 gui=bold
hi htmlperlOperator              ctermfg=7    ctermbg=0    cterm=bold      guifg=#888888 guibg=#000000 gui=bold
hi htmlperlFunction              ctermfg=7    ctermbg=0    cterm=bold      guifg=#888888 guibg=#000000 gui=bold
hi htmlperlSubName               ctermfg=2    ctermbg=0    cterm=NONE      guifg=#008800 guibg=#000000 gui=NONE
hi htmlperlSubPrototype          ctermfg=1    ctermbg=0    cterm=NONE      guifg=#880000 guibg=#000000 gui=NONE
hi htmlperlSubAttributes         ctermfg=1    ctermbg=0    cterm=NONE      guifg=#880000 guibg=#000000 gui=NONE
hi htmlperlSubAttributesCont     ctermfg=1    ctermbg=0    cterm=NONE      guifg=#880000 guibg=#000000 gui=NONE
hi htmlperlComment               ctermfg=6    ctermbg=0    cterm=bold      guifg=#008888 guibg=#000000 gui=bold
hi htmlperlTodo                  ctermfg=0    ctermbg=3    cterm=NONE      guifg=#000000 guibg=#884400 gui=NONE
hi htmlperlNotEmptyLine          ctermfg=7    ctermbg=1    cterm=bold      guifg=#888888 guibg=#880000 gui=bold
hi htmlperlElseIfError           ctermfg=2    ctermbg=1    cterm=NONE      guifg=#008800 guibg=#880000 gui=NONE
hi htmlperlSubPrototypeError     ctermfg=7    ctermbg=1    cterm=bold      guifg=#888888 guibg=#880000 gui=bold
hi htmlperlSubError              ctermfg=7    ctermbg=1    cterm=bold      guifg=#888888 guibg=#880000 gui=bold
""" javascript внутри template
hi JSTmplBlock                                ctermbg=17                                 guibg=#00005f
hi tmpljavaScriptParens                       ctermbg=17                                 guibg=#00005f
hi tmpljavaScriptValue                        ctermbg=17                                 guibg=#00005f
hi tmpljavaScriptConditional     ctermfg=7    ctermbg=17   cterm=bold      guifg=#888888 guibg=#00005f gui=bold
hi tmpljavaScriptOperator        ctermfg=7    ctermbg=17   cterm=bold      guifg=#888888 guibg=#00005f gui=bold
hi tmpljavaScriptBraces          ctermfg=2    ctermbg=17   cterm=bold      guifg=#008800 guibg=#00005f gui=bold
hi tmpljavaScriptIdentifier      ctermfg=2    ctermbg=17   cterm=bold      guifg=#008800 guibg=#00005f gui=bold
hi tmpljavaScriptFunction        ctermfg=2    ctermbg=17   cterm=bold      guifg=#008800 guibg=#00005f gui=bold
hi tmpljavaScriptStringS         ctermfg=3    ctermbg=17   cterm=bold      guifg=#884400 guibg=#00005f gui=bold
hi tmpljavaScriptStringD         ctermfg=3    ctermbg=17   cterm=bold      guifg=#884400 guibg=#00005f gui=bold
hi tmpljavaScriptRegexpString    ctermfg=3    ctermbg=17   cterm=bold      guifg=#884400 guibg=#00005f gui=bold
hi tmpljavaScriptType            ctermfg=81   ctermbg=17                   guifg=#5fd7ff guibg=#00005f

if &t_Co > 8
    """ Базовые
    hi Constant                  ctermfg=11   ctermbg=NONE cterm=NONE      guifg=#cccc44 guibg=NONE    gui=NONE
    """ Go
    hi goFunctionCall            ctermfg=81   ctermbg=NONE cterm=NONE      guifg=#5fd7ff guibg=NONE    gui=NONE
    hi goTypeName                ctermfg=170  ctermbg=NONE cterm=bold      guifg=#d75fd7 guibg=NONE    gui=bold
    """ JavaScript templates inside html
    hi JSTmplTag                 ctermfg=213  ctermbg=8    cterm=NONE      guifg=#ff87ff guibg=#444444 gui=NONE
    hi JSTmplDelimiter           ctermfg=13   ctermbg=0    cterm=NONE      guifg=#cc44cc guibg=#000000 gui=NONE
    """ vim
    hi MatchParen                ctermfg=NONE ctermbg=238  cterm=NONE      guifg=NONE    guibg=#444444 gui=NONE
    hi TabLine                   ctermfg=15   ctermbg=234  cterm=NONE      guifg=#cccccc guibg=#1c1c1c gui=NONE
    hi TabLineFill               ctermfg=15   ctermbg=234  cterm=NONE      guifg=#cccccc guibg=#1c1c1c gui=NONE
    hi TabLineSel                ctermfg=15   ctermbg=239  cterm=NONE      guifg=#cccccc guibg=#4e4e4e gui=NONE
    hi Pmenu                     ctermfg=245  ctermbg=19   cterm=NONE      guifg=#8a8a8a guibg=#0000af gui=NONE
    hi PmenuSel                  ctermfg=245  ctermbg=17   cterm=NONE      guifg=#8a8a8a guibg=#00005f gui=NONE
"    hi StatusLine               ctermfg=15   ctermbg=234  cterm=NONE      guifg=#cccccc guibg=#1c1c1c gui=NONE
"    hi StatusLineNC             ctermfg=242  ctermbg=234  cterm=NONE      guifg=#6c6c6c guibg=#1c1c1c gui=NONE
    """ markdown
    hi markdownItalic            ctermfg=81   ctermbg=NONE cterm=italic    guifg=#5fd7ff guibg=NONE    gui=italic
    """ asciidoc
    hi asciidocQuotedEmphasized  ctermfg=81   ctermbg=NONE cterm=italic    guifg=#5fd7ff guibg=NONE    gui=italic
    hi asciidocQuotedEmphasized2 ctermfg=81   ctermbg=NONE cterm=italic    guifg=#5fd7ff guibg=NONE    gui=italic
    hi asciidocXref              ctermfg=115  ctermbg=NONE cterm=underline guifg=#87d7af guibg=NONE    gui=underline
    hi asciidocLink              ctermfg=115  ctermbg=NONE cterm=underline guifg=#87d7af guibg=NONE    gui=underline
    hi link asciidocSubscriptDelimiter                  SpecialChar
    hi link asciidocSuperscriptDelimiter                SpecialChar
    hi link asciidocMonospacedDelimiter                 SpecialChar
    hi link asciidocMonospaced2Delimiter                SpecialChar
    hi link asciidocUnconstrainedMonospacedDelimiter    SpecialChar
    hi link asciidocEmphasizedDelimiter                 SpecialChar
    hi link asciidocEmphasized2Delimiter                SpecialChar
    hi link asciidocUnconstrainedEmphasizedDelimiter    SpecialChar
    hi link asciidocBoldDelimiter                       SpecialChar
    hi link asciidocUnconstrainedBoldDelimiter          SpecialChar
    hi link asciidocUnquotedDelimiter                   SpecialChar
    hi link asciidocUnconstrainedUnquotedDelimiter      SpecialChar
    hi link asciidocConcealUnReplacement                SpecialChar
endif

""" spell
if &t_Co > 8
    hi SpellBad                  ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE    guibg=NONE    gui=underline
    hi SpellCap                  ctermfg=NONE ctermbg=NONE cterm=NONE      guifg=NONE    guibg=NONE    gui=NONE
    hi SpellLocal                ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE    guibg=NONE    gui=underline
    hi SpellRare                 ctermfg=NONE ctermbg=NONE cterm=NONE      guifg=NONE    guibg=NONE    gui=NONE
else
    hi SpellCap                  ctermfg=NONE ctermbg=NONE cterm=NONE      guifg=NONE    guibg=NONE    gui=NONE
    hi SpellRare                 ctermfg=NONE ctermbg=NONE cterm=NONE      guifg=NONE    guibg=NONE    gui=NONE
    hi SpellBad                  ctermfg=3    ctermbg=NONE cterm=NONE      guifg=#884400 guibg=NONE    gui=NONE
    hi SpellLocal                ctermfg=3    ctermbg=NONE cterm=NONE      guifg=#884400 guibg=NONE    gui=NONE
    autocmd BufEnter *  if &ft == "perl" |  hi SpellBad ctermbg=0       | endif
    autocmd BufLeave *                      hi SpellBad ctermbg=NONE
    autocmd BufEnter *  if &ft == "perl" |  hi SpellLocal ctermbg=0     | endif
    autocmd BufLeave *                      hi SpellLocal ctermbg=NONE
endif


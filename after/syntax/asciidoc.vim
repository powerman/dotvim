" allow ) as first char
" allow -−~^+`_ around
syn match asciidocQuotedMonospaced   /\(^\|[-−~^+`_| \t([.,=\]]\)\@<=+\([ \n\t]\)\@!\(.\|\n\(\s*\n\)\@!\)\{-}\S\(+\([-−~^+`_| \t)[\],.?!;:=]\|$\)\@=\)/ contains=asciidocEntityRef
	\ containedin=asciidocQuotedSubscript,asciidocQuotedSuperscript
syn match asciidocQuotedMonospaced2  /\(^\|[-−~^+`_| \t([.,=\]]\)\@<=`\([ \n\t]\)\@!\(.\|\n\(\s*\n\)\@!\)\{-}\S\(`\([-−~^+`_| \t)[\],.?!;:=]\|$\)\@=\)/
	\ containedin=asciidocQuotedSubscript,asciidocQuotedSuperscript
syn match asciidocQuotedEmphasized   /\(^\|[-−~^+`_| \t([.,=\]]\)\@<=_\([ \n\t]\)\@!\(.\|\n\(\s*\n\)\@!\)\{-}\S\(_\([-−~^+`_| \t)[\],.?!;:=]\|$\)\@=\)/ contains=asciidocEntityRef
	\ containedin=asciidocQuotedSubscript,asciidocQuotedSuperscript
syn match asciidocQuotedEmphasized2  /\(^\|[-−~^+`_| \t([.,=\]]\)\@<='\([ \n\t]\)\@!\(.\|\n\(\s*\n\)\@!\)\{-}\S\('\([-−~^+`_| \t)[\],.?!;:=]\|$\)\@=\)/ contains=asciidocEntityRef
	\ containedin=asciidocQuotedSubscript,asciidocQuotedSuperscript
syn match asciidocQuotedBold         /\(^\|[-−~^+`_| \t([.,=\]]\)\@<=\*\([ \n\t]\)\@!\(.\|\n\(\s*\n\)\@!\)\{-}\S\(\*\([-−~^+`_| \t)[\],.?!;:=]\|$\)\@=\)/ contains=asciidocEntityRef
	\ containedin=asciidocQuotedSubscript,asciidocQuotedSuperscript
syn match asciidocQuotedSingleQuoted /\(^\|[-−~^+`_| \t([.,=\]]\)\@<=`\([ \n\t]\)\@!\([^`]\|\n\(\s*\n\)\@!\)\{-}[^` \t]\('\([-−~^+`_| \t)[\],.?!;:=]\|$\)\@=\)/ contains=asciidocEntityRef
	\ containedin=asciidocQuotedSubscript,asciidocQuotedSuperscript
syn match asciidocQuotedDoubleQuoted /\(^\|[-−~^+`_| \t([.,=\]]\)\@<=``\([ \n\t]\)\@!\(.\|\n\(\s*\n\)\@!\)\{-}\S\(''\([-−~^+`_| \t)[\],.?!;:=]\|$\)\@=\)/ contains=asciidocEntityRef
	\ containedin=asciidocQuotedSubscript,asciidocQuotedSuperscript
" not modified, but have to be executed after Quoted*
syn match asciidocQuotedUnconstrainedMonospaced /[\\+]\@<!++\S\_.\{-}\(++\|\n\s*\n\)/ contains=asciidocEntityRef
" add to allow delimiter highlight
syn match asciidocQuotedUnquoted     /\(^\|[-−~^+`_| \t([.,=\]]\)\@<=#\([ \n\t]\)\@!\(.\|\n\(\s*\n\)\@!\)\{-}\S\(#\([-−~^+`_| \t)[\],.?!;:=]\|$\)\@=\)/ contains=asciidocEntityRef

" allow line break in lists
syn match asciidocLineBreak		/[ \t]+$/ conceal containedin=asciidocList

" delimiters: conceal or highlight as SpecialChar
syn match asciidocConcealMonospaced	contained "[+]" conceal containedin=asciidocQuotedMonospaced
syn match asciidocConcealMonospaced2	contained "[`]" conceal containedin=asciidocQuotedMonospaced2
syn match asciidocConcealUMonospaced	contained "++"  conceal containedin=asciidocQuotedUnconstrainedMonospaced
syn match asciidocConcealEmphasized	contained "[_]" conceal containedin=asciidocQuotedEmphasized
syn match asciidocConcealEmphasized2	contained "[']" conceal containedin=asciidocQuotedEmphasized2
syn match asciidocConcealBold		contained "[*]" conceal containedin=asciidocQuotedBold
" delimiters: highlight as SpecialChar
syn match asciidocDelimiterUnquoted	contained "[#]"         containedin=asciidocQuotedUnquoted
syn match asciidocDelimiterSubscript	contained "[~]"         containedin=asciidocQuotedSubscript
syn match asciidocDelimiterSuperscript	contained "\^"          containedin=asciidocQuotedSuperscript

" escaping: conceal
syn match asciidocConcealUnReplacement	contained "\\\([-=]>\)\@=" conceal containedin=asciidocQuotedMonospaced,asciidocQuotedMonospaced2
syn match asciidocConcealUnReplacement	contained "\\\(<[-=]\)\@=" conceal containedin=asciidocQuotedMonospaced,asciidocQuotedMonospaced2

" not modified, but have to be executed after ???
syn region asciidocListLabel start=/^\s*/ end=/\(:\{2,4}\|;;\)$/ oneline contains=asciidocQuoted.*,asciidocMacroAttributes,asciidocAttributeRef,asciidocEntityRef,asciidocEmail,asciidocURL,asciidocBackslash,asciidocToDo keepend


hi def link asciidocConcealMonospaced		SpecialChar
hi def link asciidocConcealMonospaced2		SpecialChar
hi def link asciidocConcealUMonospaced		SpecialChar
hi def link asciidocConcealEmphasized		SpecialChar
hi def link asciidocConcealEmphasized2		SpecialChar
hi def link asciidocConcealBold			SpecialChar
hi def link asciidocDelimiterUnquoted		SpecialChar
hi def link asciidocDelimiterSubscript		SpecialChar
hi def link asciidocDelimiterSuperscript	SpecialChar
hi def link asciidocConcealUnReplacement	SpecialChar


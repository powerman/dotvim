" Add highlighting for TODO.
syn keyword markdownToDo TODO TBD FIXME
hi def link markdownToDo Todo

" Fix list continuation lines indented with 4+ spaces.
" TODO: Add support for code blocks inside lists.
syn cluster markdownBlock contains=markdownH1,markdownH2,markdownH3,markdownH4,markdownH5,markdownH6,markdownBlockquote,markdownList,markdownCodeBlock,markdownRule
syn region markdownList start="\%(^\%(>\s\)*\)\@<=\%(\t\| \{0,4\}\)\%([-*+]\|\d\+\.\)\%(\s\+\S\)\@=" end=/\%(^\%(>\s\)*\s*$\)\@=/ contains=markdownListMarker,markdownOrderedListMarker,@markdownInline,markdownBlockquote,markdownToDo
syn clear markdownListMarker
syn match markdownListMarker "\%(^\%(>\s\)*\)\@<=\s*[-*+]\%(\s\+\S\)\@=" contained

" Add concealing for ` and ``.
syn clear markdownCode
syn region markdownCode matchgroup=markdownCodeDelimiter start="`" end="`" keepend contains=markdownLineStart concealends
syn region markdownCode matchgroup=markdownCodeDelimiter start="`` \=" end=" \=``" keepend contains=markdownLineStart concealends
syn region markdownCode matchgroup=markdownCodeDelimiter start="^\s*```.*$" end="^\s*```\ze\s*$" keepend
for s:type in g:markdown_fenced_languages
	exe 'syn region markdownHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\..*','','').' matchgroup=markdownCodeDelimiter start="^\s*```\s*'.matchstr(s:type,'[^=]*').'\>.*$" end="^\s*```\ze\s*$" keepend contains=@markdownHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\.','','g')
endfor
unlet! s:type

" Add concealing for escaped symbols.
syn match markdownEscape "\\[][\\`*_{}()<>#+.!-]" contains=markdownEscapeDelimiter
syn match markdownEscapeDelimiter "\\\@<!\\" contained conceal

" Fix bold/italic start/end position.
syn clear markdownItalic
syn region markdownItalic matchgroup=markdownItalicDelimiter start="\(^\|\W\@<=\)\*\S\@=" end="\S\@<=\*\(\W\@=\|$\)" keepend contains=markdownLineStart concealends
syn region markdownItalic matchgroup=markdownItalicDelimiter start="\(^\|\W\@<=\)_\S\@=" end="\S\@<=_\(\W\@=\|$\)" keepend contains=markdownLineStart concealends
syn region markdownBold matchgroup=markdownBoldDelimiter start="\(^\|\W\@<=\)\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" keepend contains=markdownLineStart,markdownItalic concealends
syn region markdownBold matchgroup=markdownBoldDelimiter start="\(^\|\W\@<=\)__\S\@=" end="\S\@<=__\|__\S\@=" keepend contains=markdownLineStart,markdownItalic concealends
syn region markdownBoldItalic matchgroup=markdownBoldItalicDelimiter start="\(^\|\W\@<=\)\*\*\*\S\@=" end="\S\@<=\*\*\*\(\W\@=\|$\)" keepend contains=markdownLineStart concealends
syn region markdownBoldItalic matchgroup=markdownBoldItalicDelimiter start="\(^\|\W\@<=\)___\S\@=" end="\S\@<=___\(\W\@=\|$\)" keepend contains=markdownLineStart concealends
" Remove annoying and useless error.
hi def link markdownError NONE

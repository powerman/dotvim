""" Include javascript templates inside <script type="text/x-tmpl" or type="text/template">
syn region  JSTmplBlock		keepend matchgroup=JSTmplDelimiter start=+<%[=^#]\?+ end=+%>+  contains=@tmplJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc contained
syn region  JSTmpl 		keepend matchgroup=JSTmplTag start=+<script [^>]*type *=[^>]*\(tmpl\|template\)[^>]*>+ end=+</script>+ contains=@htmlTop,htmlScriptTag,@htmlPreproc,JSTmplBlock
syn cluster htmlPreproc		add=JSTmpl,JSTmplBlock

""" Include perl templates
" Use separate syntax (htmlperl instead of perl) to make it possible to
" define different highlight for perl and perl inside html.
" - copy standard perl.vim as htmlperl.vim with renamed identifiers
let s:f_htmlperl = $HOME.'/.vim/syntax/htmlperl.vim'
let s:f_perl     = $VIMRUNTIME.'/syntax/perl.vim'
if !exists('*s:GenerateHTMLPerl')
    function s:GenerateHTMLPerl()
	let syn = readfile(s:f_perl, 'b')
	let i = 0
	while i < len(syn)
	    let syn[i] = substitute(syn[i], '\<perl', 'htmlperl', 'g')
	    " XXX	Not sure why, but within html these things work incorrectly:
	    "	1) perlElseIfError (detect any 'if' as wrong)
	    "	2) perlFunctionName (most constructions become perlFunctionName)
	    let syn[i] = substitute(syn[i], '^.*match\s\+htmlperlElseIfError.*$', '', '')
	    let syn[i] = substitute(syn[i], '^.*FunctionName.*$', '', '')
	    let i = i + 1
	endwhile
	call writefile(syn, s:f_htmlperl, 'b')
    endfunction
endif
if !filereadable(s:f_htmlperl) || getftime(s:f_htmlperl) < getftime(s:f_perl)
    call s:GenerateHTMLPerl()
endif
""" Include javascript templates
" Use separate syntax (tmpljavaScript instead of javaScript) to make it possible to
" define different highlight for javascript and javascript inside html templates.
" - copy standard javascript.vim as tmpljavascript.vim with renamed identifiers
let s:f_tmpljs = $HOME.'/.vim/syntax/tmpljavascript.vim'
let s:f_js     = $VIMRUNTIME.'/syntax/javascript.vim'
if !exists('*s:GenerateTmplJavaScript')
    function s:GenerateTmplJavaScript()
	let syn = readfile(s:f_js, 'b')
	let i = 0
	while i < len(syn)
	    let syn[i] = substitute(syn[i], '\<java', 'tmpljava', 'g')
	    let i = i + 1
	endwhile
	call writefile(syn, s:f_tmpljs, 'b')
    endfunction
endif
if !filereadable(s:f_tmpljs) || getftime(s:f_tmpljs) < getftime(s:f_js)
    call s:GenerateTmplJavaScript()
endif
" - load
unlet b:current_syntax
syn include @tmplJavaScript syntax/tmpljavascript.vim
unlet b:current_syntax
syn include @HTMLPerl syntax/htmlperl.vim
let b:current_syntax='html'
" - use Text::MiniTmpl template syntax
syn region  htmlperlBlock	keepend matchgroup=htmlperlDelimiter start=+&\~+   end=+\~&+  contains=@HTMLPerl
syn region  htmlperlBlock	keepend matchgroup=htmlperlDelimiter start=+<!--&+ end=+-->+  contains=@HTMLPerl
syn region  htmlperlBlock	keepend matchgroup=htmlperlDelimiter start=+@\~+   end=+\~@+  contains=@HTMLPerl
syn region  htmlperlBlock	keepend matchgroup=htmlperlDelimiter start=+\^\~+  end=+\~\^+ contains=@HTMLPerl
syn region  htmlperlBlock	keepend matchgroup=htmlperlDelimiter start=+#\~+   end=+\~#+  contains=@HTMLPerl
syn cluster htmlPreproc		add=htmlperlBlock

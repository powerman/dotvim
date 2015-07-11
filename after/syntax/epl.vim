" Replace default "perl" syntax with same but named "htmlperl" to be able
" to define alternative colors for perl inside html than to usual perl.
syn include @HTMLPerl syntax/htmlperl.vim
syn cluster HTMLPerl remove=htmlperlFunctionName,htmlperlElseIfError
syn clear PerlInside
syn region PerlInside keepend oneline start=+<%=\{0,2}+hs=s end=+=\{0,1}%>+he=s-1,me=s-1 contains=MojoStart,@HTMLPerl nextgroup=MojoEnd
syn region PerlInside keepend oneline start=+^\s*%=\{0,2}+hs=s end=+$+ contains=MojoSingleStart,@HTMLPerl

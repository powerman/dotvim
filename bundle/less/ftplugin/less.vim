" Vim file type fle
" Language: Less
" Author: Kohpoll (http://www.cnblogs.com/kohpoll/)
" Licensed under MIT.
" Last Modified: 2012-08-03

if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

" Enable LessMake if it won't overwrite any settings.
" if !len(&l:makeprg)
"   compiler less
" endif

" FIXME: can not se the correct errorformat for lessc produce the error string
" with escape character like(echo in console with color): 
" \033[31mParseError: missing closing `}` \033[39m\033[31m in \033[39mD:\PlayGround\x.less\033[90m:152:1\033[39m
" \033[90m151 }\033[39m\033[0m
" so, do not use the compiler, I just substitute all the escape string with empty string and echo it. = =

" compile the curren less file，save it as css with the same file name,echo the error.
func! s:CompileLess()
    let l:input = fnameescape(expand("%:p"))
    let l:output = fnameescape(expand("%:p:r") . ".css")

    let l:cmd = "lessc " . l:input . " " . l:output

    let l:errs = system(l:cmd)

    if (!empty(l:errs))
      " replace the escape string(\%oxxx match the octal character).  e.g: \033[33m
      let l:errs = substitute(l:errs, "\\%o033[\\d\\+m", "", "g") 
      " replace the blank lines
      let l:errs = substitute(l:errs, "^$", "", "g")
      " we jsut need the error message
      let l:errs = split(l:errs, "\\n")[0]

      echo l:errs
    endif
endfunc

" compile less when saving.
autocmd! BufWritePost,FileWritePost *.less call s:CompileLess()

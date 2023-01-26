if exists('b:current_syntax')
  finish
endif

if !exists('g:main_syntax')
  let g:main_syntax = 'conf'
endif

runtime! syntax/conf.vim
unlet b:current_syntax
runtime! syntax/gotexttmpl.vim
unlet b:current_syntax

syn region	confString	start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=gotplAction,goTplComment oneline
syn region	confString	start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=gotplAction,goTplComment oneline

let b:current_syntax = 'goconftmpl'

" vim: sw=2 ts=2 et

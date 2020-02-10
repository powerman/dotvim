if exists('b:current_syntax')
  finish
endif

if !exists('g:main_syntax')
  let g:main_syntax = 'nginx'
endif

runtime! syntax/nginx.vim
unlet b:current_syntax
runtime! syntax/gotexttmpl.vim
unlet b:current_syntax

syn region ngxBlock start=+^+ end=+{+ contains=gotplAction,goTplComment,ngxComment,ngxDirectiveBlock,ngxVariableBlock,ngxString oneline
syn region ngxString start=+"+ end=+"+ skip=+\\\\\|\\"+ contains=gotplAction,goTplComment,ngxVariableString oneline
syn region ngxString start=+'+ end=+'+ skip=+\\\\\|\\'+ contains=gotplAction,goTplComment,ngxVariableString oneline

let b:current_syntax = 'gonginxtmpl'

" vim: sw=2 ts=2 et

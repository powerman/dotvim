if exists('b:current_syntax')
  finish
endif

if !exists('g:main_syntax')
  let g:main_syntax = 'caddyfile'
endif

runtime! syntax/caddyfile.vim
unlet b:current_syntax
runtime! syntax/gotexttmpl.vim
unlet b:current_syntax

syn region caddySubdirectiveArgs start="" end="\(#\|$\)"me=s-1 oneline contained contains=gotplAction,goTplComment,caddyPlaceholder,caddyString,caddyNamedMatcher

let b:current_syntax = 'gocaddyfiletmpl'

" vim: sw=2 ts=2 et

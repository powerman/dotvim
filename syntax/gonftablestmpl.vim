if exists('b:current_syntax')
  finish
endif

if !exists('g:main_syntax')
  let g:main_syntax = 'nftables'
endif

runtime! syntax/nftables.vim
unlet b:current_syntax
runtime! syntax/gotexttmpl.vim
unlet b:current_syntax

let b:current_syntax = 'gonftablestmpl'

" vim: sw=2 ts=2 et

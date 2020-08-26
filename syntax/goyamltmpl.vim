if exists('b:current_syntax')
  finish
endif

if !exists('g:main_syntax')
  let g:main_syntax = 'yaml'
endif

runtime! syntax/yaml.vim
unlet b:current_syntax
runtime! syntax/gotexttmpl.vim
unlet b:current_syntax

syn region yamlFlowString matchgroup=yamlFlowStringDelimiter start='"' skip='\\"' end='"'
            \ contains=gotplAction,goTplComment,yamlEscape
            \ nextgroup=yamlKeyValueDelimiter
syn region yamlFlowString matchgroup=yamlFlowStringDelimiter start="'" skip="''"  end="'"
            \ contains=gotplAction,goTplComment,yamlSingleEscape
            \ nextgroup=yamlKeyValueDelimiter
syn cluster yamlFlow      add=gotplAction,goTplComment

let b:current_syntax = 'goyamltmpl'

" vim: sw=2 ts=2 et

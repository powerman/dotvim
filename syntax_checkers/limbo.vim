"============================================================================
"File:        limbo.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Sam Nguyen <samxnguyen@gmail.com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================
if exists("loaded_limbo_syntax_checker")
    finish
endif
let loaded_limbo_syntax_checker = 1

"bail if the user doesnt have limbo installed
if !executable("limbo")
    finish
endif

function! SyntaxCheckers_limbo_GetLocList()
    let makeprg = 'if [[ % == *.b ]]; then limbo -I$INFERNO_HOME -w $([[ -f mkfile ]] && echo -o /dev/null) % ; fi'
    let errorformat = '%f:%l:%m'

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

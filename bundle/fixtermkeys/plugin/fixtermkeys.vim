" Maintainer: Alex Efros <powerman-asdf@ya.ru>
" Version: 1.1
" Last Modified: Feb 21, 2020
" License: MIT
" URL: https://github.com/powerman/vim-plugin-fixtermkeys
" Description: Fix terminal Ctrl Alt Shift modifiers for keys like Tab CR Space BS cursor and others
"
" Based on http://www.leonerd.org.uk/hacks/vim/fixtermkeys.html

if exists('g:loaded_fixtermkeys') || &cp || v:version < 700
	finish
endif
let g:loaded_fixtermkeys = 1


function s:MapToKey(key, lhs)
    exe 'map  ' . a:lhs . ' <' . a:key . '>'
    exe 'map! ' . a:lhs . ' <' . a:key . '>'
    if get(g:, 'fixtermkeys#debug') && a:key =~# '-'
        exe 'imap <' . a:key . '> ' . a:key
    endif
endfunction

function s:MapToAllKeys(key, fmt)
    call s:MapToKey(    'S-' . a:key, printf(a:fmt, 2))
    call s:MapToKey(    'A-' . a:key, printf(a:fmt, 3))
    call s:MapToKey(  'A-S-' . a:key, printf(a:fmt, 4))
    call s:MapToKey(    'C-' . a:key, printf(a:fmt, 5))
    call s:MapToKey(  'C-S-' . a:key, printf(a:fmt, 6))
    call s:MapToKey(  'C-A-' . a:key, printf(a:fmt, 7))
    call s:MapToKey('C-A-S-' . a:key, printf(a:fmt, 8))
endfunction

function s:CSIu_Key(key, num)
    call s:MapToAllKeys(a:key, printf('<Esc>[%d;%%du', a:num))
    " Also handle <Esc>-prefixing.
    call s:MapToKey(a:key, printf('<Esc><%s>', a:key))
endfunction

function s:CSItilde_Key(key, num)
    call s:MapToAllKeys(a:key, printf('<Esc>[%d;%%d~', a:num))
endfunction

function s:CSI_Key(key, letter)
    call s:MapToAllKeys(a:key, printf('<Esc>[1;%%d%s', a:letter))
endfunction

call s:CSIu_Key('Tab',    9)
call s:CSIu_Key('CR',    13)
" call s:CSIu_Key('Esc',   27)
call s:CSIu_Key('Space', 32)
call s:CSIu_Key('BS',   127)

call s:CSItilde_Key('Insert',   2)
call s:CSItilde_Key('Delete',   3)
call s:CSItilde_Key('PageUp',   5)
call s:CSItilde_Key('PageDown', 6)

call s:CSI_Key('Up',    'A')
call s:CSI_Key('Down',  'B')
call s:CSI_Key('Right', 'C')
call s:CSI_Key('Left',  'D')
call s:CSI_Key('End',   'F')
call s:CSI_Key('Home',  'H')

let s:keys = {
    \ '1': '!',
    \ '2': '@',
    \ '3': '#',
    \ '4': '$',
    \ '5': '%',
    \ '6': '^',
    \ '7': '&',
    \ '8': '*',
    \ '9': '(',
    \ '0': ')',
    \ '-': '_',
    \ '=': '+',
    \ '.': '<',
    \ ',': '>',
    \ }
for [s:ch, s:shift_ch] in items(s:keys)
    call s:MapToAllKeys(s:ch, printf('<Esc>[%d;%%du', char2nr(s:ch)))
    " Also handle <Esc>-prefixing.
    call s:MapToKey(  'A-' . s:ch, printf('<Esc>%s', s:ch))
    call s:MapToKey('A-S-' . s:ch, printf('<Esc>%s', s:shift_ch))
    unlet s:ch s:shift_ch
endfor

# Improved AnsiEsc.vim

Files with ANSI escape sequences look good when dumped onto a terminal
that accepts them, but have been a distracting clutter when edited via
vim. The AnsiEsc.vim file, when sourced, will conceal Ansi escape
sequences but will cause subsequent text to be colored as the escape
sequence specifies.

This is a [Vim script №302: AnsiEsc.vim](http://www.vim.org/scripts/script.php?script_id=302)
updated to [latest author's version](http://www.drchip.org/astronaut/vim/index.html#ANSIESC)
with several fixes/improvements.

Download .zip/.vmb from http://www.vim.org/scripts/script.php?script_id=4979

## Changes

* updated to latest author's version: **13i** (Apr 02, 2015)
* add support for simple ANSI sequences like "bold" (without defining color)
* add support for 16-color 'light' escape sequences (by Andy Berdan, merged from https://github.com/berdandy/AnsiEsc.vim)
* disable `\swp` and `\rwp` maps if `g:no_plugin_maps` or `g:no_cecutil_maps` exists
* disable DrChip/AnsiEsc menu if `g:no_drchip_menu` or `g:no_ansiesc_menu` exists
* add support for simple ANSI sequences like disable bold/italic/etc.
* minor fixes

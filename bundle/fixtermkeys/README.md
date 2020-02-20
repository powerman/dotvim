# fixtermkeys

Fix terminal Ctrl Alt Shift modifiers for keys like Tab CR Space BS cursor and others.

Based on http://www.leonerd.org.uk/hacks/vim/fixtermkeys.html.

## Terminal setup

Even without extra terminal setup this plugin will improve detection of
some keys, but to get all keys to work chances are you'll have to
configure your terminal.

Example for urxvt (rxvt-unicode) - add this to `~/.Xresources` (and then
either restart Xorg or run `xrdb ~/.Xresources` and start new `urxvt`):

```
/*
 *  Keyboard:
 */
!// All key names: /usr/include/X11/keysymdef.h

!// Found at http://vim.wikia.com/wiki/Get_Alt_key_to_work_in_terminal.
!// (https://github.com/sunaku/home/blob/master/.Xdefaults.d/URxvt.xrdb)
!// Emulate XTerm for proper recognition of key combinations in Vim.

URxvt.keysym.S-Up             : \033[1;2A
URxvt.keysym.M-Up             : \033[1;3A
URxvt.keysym.M-S-Up           : \033[1;4A
URxvt.keysym.C-Up             : \033[1;5A
URxvt.keysym.C-S-Up           : \033[1;6A
URxvt.keysym.M-C-Up           : \033[1;7A
URxvt.keysym.M-C-S-Up         : \033[1;8A
URxvt.keysym.S-Down           : \033[1;2B
URxvt.keysym.M-Down           : \033[1;3B
URxvt.keysym.M-S-Down         : \033[1;4B
URxvt.keysym.C-Down           : \033[1;5B
URxvt.keysym.C-S-Down         : \033[1;6B
URxvt.keysym.M-C-Down         : \033[1;7B
URxvt.keysym.M-C-S-Down       : \033[1;8B
URxvt.keysym.S-Right          : \033[1;2C
URxvt.keysym.M-Right          : \033[1;3C
URxvt.keysym.M-S-Right        : \033[1;4C
URxvt.keysym.C-Right          : \033[1;5C
URxvt.keysym.C-S-Right        : \033[1;6C
URxvt.keysym.M-C-Right        : \033[1;7C
URxvt.keysym.M-C-S-Right      : \033[1;8C
URxvt.keysym.S-Left           : \033[1;2D
URxvt.keysym.M-Left           : \033[1;3D
URxvt.keysym.M-S-Left         : \033[1;4D
URxvt.keysym.C-Left           : \033[1;5D
URxvt.keysym.C-S-Left         : \033[1;6D
URxvt.keysym.M-C-Left         : \033[1;7D
URxvt.keysym.M-C-S-Left       : \033[1;8D

! URxvt.keysym.S-Insert         : paste
URxvt.keysym.M-Insert         : \033[2;3~
URxvt.keysym.M-S-Insert       : \033[2;4~
URxvt.keysym.C-Insert         : \033[2;5~
URxvt.keysym.C-S-Insert       : \033[2;6~
URxvt.keysym.M-C-Insert       : \033[2;7~
URxvt.keysym.M-C-S-Insert     : \033[2;8~

URxvt.keysym.S-Delete         : \033[3;2~
URxvt.keysym.M-Delete         : \033[3;3~
URxvt.keysym.M-S-Delete       : \033[3;4~
URxvt.keysym.C-Delete         : \033[3;5~
URxvt.keysym.C-S-Delete       : \033[3;6~
URxvt.keysym.M-C-Delete       : \033[3;7~
URxvt.keysym.M-C-S-Delete     : \033[3;8~

URxvt.keysym.S-Home           : \033[1;2H
URxvt.keysym.M-Home           : \033[1;3H
URxvt.keysym.M-S-Home         : \033[1;4H
URxvt.keysym.C-Home           : \033[1;5H
URxvt.keysym.C-S-Home         : \033[1;6H
URxvt.keysym.M-C-Home         : \033[1;7H
URxvt.keysym.M-C-S-Home       : \033[1;8H

URxvt.keysym.S-End            : \033[1;2F
URxvt.keysym.M-End            : \033[1;3F
URxvt.keysym.M-S-End          : \033[1;4F
URxvt.keysym.C-End            : \033[1;5F
URxvt.keysym.C-S-End          : \033[1;6F
URxvt.keysym.M-C-End          : \033[1;7F
URxvt.keysym.M-C-S-End        : \033[1;8F

! URxvt.keysym.S-Page_Up        : captured by terminal for scrolling
URxvt.keysym.M-Page_Up        : \033[5;3~
URxvt.keysym.M-S-Page_Up      : \033[5;4~
URxvt.keysym.C-Page_Up        : \033[5;5~
URxvt.keysym.C-S-Page_Up      : \033[5;6~
URxvt.keysym.M-C-Page_Up      : \033[5;7~
URxvt.keysym.M-C-S-Page_Up    : \033[5;8~

! URxvt.keysym.S-Page_Down      : captured by terminal for scrolling
URxvt.keysym.M-Page_Down      : \033[6;3~
URxvt.keysym.M-S-Page_Down    : \033[6;4~
URxvt.keysym.C-Page_Down      : \033[6;5~
URxvt.keysym.C-S-Page_Down    : \033[6;6~
URxvt.keysym.M-C-Page_Down    : \033[6;7~
URxvt.keysym.M-C-S-Page_Down  : \033[6;8~

!// See http://www.leonerd.org.uk/hacks/fixterms/

!// S-Tab has own code: \033[Z
! URxvt.keysym.S-Tab            : \033[9;2u
URxvt.keysym.M-Tab            : \033[9;3u
URxvt.keysym.M-S-Tab          : \033[9;4u
URxvt.keysym.C-Tab            : \033[9;5u
URxvt.keysym.C-S-Tab          : \033[9;6u
URxvt.keysym.M-C-Tab          : \033[9;7u
URxvt.keysym.M-C-S-Tab        : \033[9;8u

URxvt.keysym.S-Return         : \033[13;2u
URxvt.keysym.M-Return         : \033[13;3u
URxvt.keysym.M-S-Return       : \033[13;4u
URxvt.keysym.C-Return         : \033[13;5u
URxvt.keysym.C-S-Return       : \033[13;6u
URxvt.keysym.M-C-Return       : \033[13;7u
URxvt.keysym.M-C-S-Return     : \033[13;8u

URxvt.keysym.S-Escape         : \033[27;2u
URxvt.keysym.M-Escape         : \033[27;3u
URxvt.keysym.M-S-Escape       : \033[27;4u
URxvt.keysym.C-Escape         : \033[27;5u
URxvt.keysym.C-S-Escape       : \033[27;6u
URxvt.keysym.M-C-Escape       : \033[27;7u
URxvt.keysym.M-C-S-Escape     : \033[27;8u

!// S-space is often pressed occasionally while typing.
! URxvt.keysym.S-space          : \033[32;2u
URxvt.keysym.M-space          : \033[32;3u
URxvt.keysym.M-S-space        : \033[32;4u
!// C-space has own code: ^@ (Nul)
! URxvt.keysym.C-space          : \033[32;5u
URxvt.keysym.C-S-space        : \033[32;6u
URxvt.keysym.M-C-space        : \033[32;7u
URxvt.keysym.M-C-S-space      : \033[32;8u

URxvt.keysym.S-BackSpace      : \033[127;2u
URxvt.keysym.M-BackSpace      : \033[127;3u
URxvt.keysym.M-S-BackSpace    : \033[127;4u
!// C-BackSpace has own code: ^H
! URxvt.keysym.C-BackSpace      : \033[127;5u
URxvt.keysym.C-S-BackSpace    : \033[127;6u
URxvt.keysym.M-C-BackSpace    : \033[127;7u
URxvt.keysym.M-C-S-BackSpace  : \033[127;8u

URxvt.keysym.C-0              : \033[48;5u
URxvt.keysym.C-parenright     : \033[48;6u
URxvt.keysym.M-C-0            : \033[48;7u
URxvt.keysym.M-C-parenright   : \033[48;8u
URxvt.keysym.C-1              : \033[49;5u
URxvt.keysym.C-exclam         : \033[49;6u
URxvt.keysym.M-C-1            : \033[49;7u
URxvt.keysym.M-C-exclam       : \033[49;8u
URxvt.keysym.C-2              : \033[50;5u
URxvt.keysym.C-at             : \033[50;6u
URxvt.keysym.M-C-2            : \033[50;7u
URxvt.keysym.M-C-at           : \033[50;8u
URxvt.keysym.C-3              : \033[51;5u
URxvt.keysym.C-numbersign     : \033[51;6u
URxvt.keysym.M-C-3            : \033[51;7u
URxvt.keysym.M-C-numbersign   : \033[51;8u
URxvt.keysym.C-4              : \033[52;5u
URxvt.keysym.C-dollar         : \033[52;6u
URxvt.keysym.M-C-4            : \033[52;7u
URxvt.keysym.M-C-dollar       : \033[52;8u
URxvt.keysym.C-5              : \033[53;5u
URxvt.keysym.C-percent        : \033[53;6u
URxvt.keysym.M-C-5            : \033[53;7u
URxvt.keysym.M-C-percent      : \033[53;8u
URxvt.keysym.C-6              : \033[54;5u
URxvt.keysym.C-asciicircum    : \033[54;6u
URxvt.keysym.M-C-6            : \033[54;7u
URxvt.keysym.M-C-asciicircum  : \033[54;8u
URxvt.keysym.C-7              : \033[55;5u
URxvt.keysym.C-ampersand      : \033[55;6u
URxvt.keysym.M-C-7            : \033[55;7u
URxvt.keysym.M-C-ampersand    : \033[55;8u
URxvt.keysym.C-8              : \033[56;5u
URxvt.keysym.C-asterisk       : \033[56;6u
URxvt.keysym.M-C-8            : \033[56;7u
URxvt.keysym.M-C-asterisk     : \033[56;8u
URxvt.keysym.C-9              : \033[57;5u
URxvt.keysym.C-parenleft      : \033[57;6u
URxvt.keysym.M-C-9            : \033[57;7u
URxvt.keysym.M-C-parenleft    : \033[57;8u

URxvt.keysym.C-minus          : \033[45;5u
URxvt.keysym.C-underscore     : \033[45;6u
URxvt.keysym.M-C-minus        : \033[45;7u
URxvt.keysym.M-C-underscore   : \033[45;8u

URxvt.keysym.C-equal          : \033[61;5u
URxvt.keysym.C-plus           : \033[61;6u
URxvt.keysym.M-C-equal        : \033[61;7u
URxvt.keysym.M-C-plus         : \033[61;8u

URxvt.keysym.C-comma          : \033[44;5u
URxvt.keysym.C-less           : \033[44;6u
URxvt.keysym.M-C-comma        : \033[44;7u
URxvt.keysym.M-C-less         : \033[44;8u

URxvt.keysym.C-period         : \033[46;5u
URxvt.keysym.C-greater        : \033[46;6u
URxvt.keysym.M-C-period       : \033[46;7u
URxvt.keysym.M-C-greater      : \033[46;8u
```

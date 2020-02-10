""" Vim syntax file cheatsheet
scriptencoding utf-8
" Syntax ITEMS:
" - keyword:					:help syn-keyword
"   * match only full word defined by		:help iskeyword
"   * can't contain anything
"   :syn keyword {group}
"	{keyword}…
"	[{options}]
"   :syn keyword Type  int long char  contained
"   * keyword may have optional tail (:sy or :syn or :syntax):
"   :syn keyword Keyword  sy[ntax]
"   * if keyword match syntax OPTION name - use :syn match instead
" - match:					:help syn-match
"   * match single regex
"   :syn match {group}
"	[excludenl]		" don't extend parent when end regex uses '$'
"	{pattern}
"	[{options}]
"   :syn match Character /'.'/hs=s+1,he=e-1
"   * pattern may match over multiple lines	:help syn-excludenl
" - region:					:help syn-region
"   * match between "start" and "end" regex, skipping "skip" regex before "end"
"   :syn region {group}
"	[matchgroup={group}]	" group for text matching start/end regex
"	[keepend]		" contained items can't extend over end regex
"	[extend]		" ignore parent's keepend option
"	[excludenl]		" don't extend parent when end regex uses '$'
"	start={start_regex}
"	[skip={skip_regex}]
"	end={end_regex}
"	[{options}]
"   :syn region String   start=+"+  skip=+\\"+  end=+"+
"   * there may be one or more start and end regex, but only 0 or 1 skip regex!
"   * region start when start regex match, end regex doesn't checked;
"     if you need to check for end regex use match instead of region:
"     :syn match {group} +start\_.\{-}end+
"   * keepend/extend/excludenl usage rules:
"     1. if all/most contained items shouldn't extend over end regex -
"        use keepend   in containing (parent)
"     2. if contained items should extend over parent's end regex -
"        use extend    in contained (child)
"     3. if contained item shouldn't extend parent, but need to match EOL ($) -
"        use excludenl in contained (child)
"
" Syntax OPTIONS:				:help syn-arguments
" - keyword, match, region:
"   * conceal			" make item concealable
"   * cchar			" replacement char for concealed text
"   * contained			" don't match at top level
"   * containedin={group},…	" inject item into {group}'s contains=
"   * transparent		" inherit parent's highlighting and contains=
"   * nextgroup={group},…	" after current item listed groups will
"				" have higher priority to match
"   * skipwhite			" allow nextgroup= to match after space/tab
"   * skipnl			" allow nextgroup= to match after newline
"   * skipempty			" allow nextgroup= to match after empty lines
" - match, region:
"   * contains={group},…	" these groups may start within match/region;
"				" they may ends outside of it;
"				" {group} may be regex;
"				" {group} may match inside start/end regex
"				" if matchgroup not used
"      =ALL			" any group accepted
"      =ALLBUT,{group},…	" any group except listed accepted
"      =TOP			" any group without contained option accepted
"      =TOP,{group},…		" like TOP except listed
"      =CONTAINED		" any group with contained option accepted
"      =CONTAINED,{group},…	" like CONTAINED except listed
"   * fold			" used with :set foldmethod=syntax
"   * display			" IGNORE: strange optimization
"   * extend			" ignore parent's keepend option
" - region:
"   * oneline			" end regex should start in line where start regex stop
"   * concealends		" start/end regex concealable
"
" Syntax GROUPS:
" Every syntax ITEM should belong to some syntax GROUP.
" Highlighting rule defined for syntax GROUP.
" Standard group names				:help group-name
"
" Syntax CLUSTERS:
" Allow to refer to multiple syntax GROUPS using single name prefixed with @
" :syn cluster {cluster}
"	[contains={group},…]	" set {cluster} to these groups
"	[add={group},…]		" add these groups to {cluster}
"	[remove={group},…]	" del these groups from {cluster}
"
" Syntax INCLUDES:
" Allow to include syntax of some other language inside some match/region:
" :syn include [@{group}] {file}
" :syn include @Pod syntax/pod.vim
" :syn region perlPOD start="^=head" end="^=cut" contains=@Pod
"
" Priority:
" - if several match/region match at same position - last defined wins
" - keyword have higher priority than match/region
" - case-sensitive keyword have higher priority than case-insensitive keyword
"
" Change Behaviour Of NEXT Commands:
" :syn case match		" force case-sensitivity
" :syn case ignore		" force case-insensitivity
" :syn conceal on		" force conceal option
" :syn conceal off		" don't force conceal option
"
" Spell Checking:
" :syn spell toplevel		" do spell check
" :syn spell notoplevel		" don't spell check
" :syn spell default		" do spell check if no @Spell or @NoSpell used,
"				" otherwise check only in @Spell



" Vim syntax file
" TODO Replace <language> with this file's language and remove this line!
" Language:	<language>
" Maintainer:	Alex Efros <powerman-asdf@ya.ru>
" URL:		http://powerman.name/download/vim/syntax/<language>.vim
" Version:	1.0
" Last Change:	2012-12-01
" Params:
" :let <language>_option=1
" :unlet <language>_option

if v:version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif


" syn keyword …
" syn match …
" syn region …
" syn cluster …
" if exists("<language>_option")
"   syn …
" endif


if v:version >= 508 || !exists('did_<language>_syn_inits')
  if v:version < 508
    let did_<language>_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " HiLink …

  delcommand HiLink
endif

let b:current_syntax = '<language>'


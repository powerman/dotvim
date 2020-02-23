syn keyword fermToDo contained TODO FIXME BUG XXX WARNING DEBUG
syntax region fermComment start="#" end="$" contains=fermToDo,@Spell
hi def link fermToDo Todo

syn keyword TODO contained TODO FIXME BUG XXX WARNING DEBUG
syn region Comment start=/#/ end=/$/ contains=TODO
hi def link TODO Todo

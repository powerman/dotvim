if exists('b:did_ftplugin')
	finish
endif
let b:did_ftplugin = 1

if has('conceal')
	setlocal conceallevel=2 concealcursor=nc
endif

let b:undo_ftplugin = 'setlocal conceallevel< concealcursor<'
	\ . '|unlet b:did_ftplugin'

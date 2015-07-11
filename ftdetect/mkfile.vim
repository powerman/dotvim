autocmd BufNewFile,BufRead mk*	if expand("<afile>") !~ '\.' | setf mkfile | endif

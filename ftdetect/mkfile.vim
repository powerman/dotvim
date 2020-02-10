augroup ft_mk
autocmd!
autocmd BufNewFile,BufRead mk*	if expand("<afile>") !~ '\.' | setf mkfile | endif
augroup end

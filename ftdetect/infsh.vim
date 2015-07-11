autocmd BufNewFile,BufRead profile,wmsetup	setf infsh
autocmd BufNewFile,BufRead *	if getline(1) =~ '^#!/dis/sh' || getline(1) =~ '^load ' || getline(2) =~ '^load ' | setlocal ft=infsh | endif

let g:filetype_m='limbo'
augroup ft_limbo
autocmd!
autocmd BufNewFile,BufRead *.[bm]       setf limbo
augroup end

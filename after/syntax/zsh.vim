" Do not highlight spaces before # in same way as comment
syn region  zshComment		oneline start='\%(^\|\s*\)#' end='$'
				\ contains=zshCommentIndent,zshTodo,@Spell fold
syn match   zshCommentIndent	'\%(^\|\S\)\@<=\s\+#\@='
syn keyword zshTodo		contained BUG WARNING DEBUG

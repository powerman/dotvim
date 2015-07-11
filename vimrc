""" SUMMARY                                                     
" VERSION: 3.2.0
" To view summary of this file run this (require foldutil plugin):
"	:FoldMatching ^""" -1

""" TODO                                                        
"
" Настроить единообразную поддержку программирования:
"			Vim	Perl	Limbo	Bash	/dis/sh	HTML	JS	CSS	
" - :tabfind            -	+	+       -	-       -	-	-	
" - syntax              +	+	+       +	+       +	+	+	
" - документация        +	+	+       +	+			2.1	
" - omni-complete									
" - snippets            +	+	+       +		+	+		
" - ctags										
" - syntax check		+	+       +		+	+		
"   + lint									+	
"			Python	Go	C	C++	Erlang	Haskell	
" - :tabfind				+				
" - syntax              +	+	+	+	+	+	
" - документация        +						
" - omni-complete							
" - snippets		+		+	+	+		
" - ctags								
" - syntax check        +	+	+	+	+	+	
"   + lint								
"
" Подобрать новую цветовую схему? http://habrahabr.ru/blogs/vim/134194/
"
" Проверить работу переназначенных кнопок через ssh и в текстовой консоли.

""" Шпаргалка по редко используемым классным стандартным фичам  
" - проверка правописания:
"   ]s		перейти к следующему слову
"   [s		перейти к предыдущему слову
"   zg		запомнить правильное слово
"   zw		отменить запомненное правильное слово
" - разное:
"   :tabfind	открыть файл по части имени (используя каталоги из `set path`)
"   [I		показать строки, в которых встречается текущее слово
"   >i}		сдвинуть вправо текущий блок между {...}
"   <i)		сдвинуть влево  текущий блок между (...)
"   q/		просмотреть/выполнить предыдущий поиск
"   q:		просмотреть/выполнить предыдущую команду

""" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
" Относительно универсальные настройки
" --------------------------------------------------------------

""" Разные настройки                                            
" - вспомогательные функции
function! s:Mkdir(dir)
	if !isdirectory(expand(a:dir))
		call mkdir(expand(a:dir), "p", 0700)
	endif
endfunction
" - система
if &term == "xterm"
    set term=xterm-256color
endif
set fileencodings=ucs-bom,utf-8,koi8-r,default
" - предыдущая версия/состояние текста
set viewdir=~/.cache/vim/view 		" убираем все временные файлы из ~/.vim/
set undofile				" использовать persistent undo
set undodir=~/.cache/vim/undo		" 
set nobackup				" зачем бэкап когда есть persistent undo!
call s:Mkdir(&viewdir)
call s:Mkdir(&undodir)
" - табы и отступы
set tabstop=8				" стандартный размер таба
set noexpandtab				" табы пробелами автоматически НЕ заменять
set shiftwidth=4			" величина отступа (indent)
set shiftround				" выравнивать отступы по shiftwidth
set softtabstop=4			" сдвиг при нажатии таба (вставляет и табы и пробелы)
set autoindent				" сохранять текущий отступ для новых строк
set smartindent				" автоматическая коррекция отступа для блоков кода
set copyindent				" использовать те же символы для отступа при:
set preserveindent			"   1) autoindent; 2) изменении глубины отступа
"   ... коррекция smartindent: сохранять отступ для комментариев
inoremap #	X#
set formatoptions+=ro			" продолжать комментарий на следующей строке
set formatoptions+=n			" авто-перенос длинных строк внутри списков
" - вывод текста
set textwidth=74			" граница для переформатирования и авто-переноса
set formatoptions+=l			" отключить авто-перенос строк которые УЖЕ длиннее textwidth
set nowrap				" не выводить длинные строки на нескольких строках
set listchars=eol:¬,nbsp:•,tab:▸·	" при `set list` показывать eol, nbsp и tab
set listchars+=extends:→,precedes:←	" при `set nowrap` выводить индикатор длинных строк
set showbreak=↪ 			" при `set wrap` выводить индикатор длинных строк
set sidescrolloff=1			" коррекция из-за индикатора длинных строк
set sidescroll=1			" плавный горизонтальный скроллинг
" - поиск
set incsearch				" искать по мере набора
set nohlsearch				" не подсвечивать результаты поиска
" - общие фичи
set backspace=indent,eol,start		" разрешить <BS>-ом удалять всё что угодно
set ruler				" всё время показывать позицию курсора внизу
set completeopt=			" автодополнение в режиме вставки не выводит меню
set wildmenu				" <Tab> в командной строке выводит меню
set wildcharm=<Tab>			" вызов меню командной строки из скрипта
set wildignore=*.sw?,*.bak,*.orig	" не выводить эти файлы при автодополнении
set wildignore+=.hg,.git,.svn
set wildignore+=*.dis,*.sbl
set wildignore+=*.o,*.obj,*.manifest
set wildignore+=*.jpg,*.gif,*.png,*.jpeg,*.ico
set wildignore+=*/patch/prev/**
set wildignore+=*/_Inline/**
set showcmd				" показывать нажимаемые кнопки в командном режиме
set notimeout ttimeout ttimeoutlen=100 	" таймаут для одиночных кнопок, но не комбинаций
set mouse=a				" поддержка мыши во всех режимах
set nomodeline				" эта фича - дыра в безопасности, отключаем
set shortmess+=I			" не выводить заставку при старте vi
filetype plugin on			" подгружать плагины для конкретных типов файлов
filetype indent off			" отключить автоматическое переформатирование отступов
set spell spelllang=en,ru		" включить проверку правописания
"   ... останавливаться только на некорректных словах, а не редких/etc.
nnoremap ]s	]S
nnoremap [s	[S
" - copy&paste в стиле винды
set keymodel=startsel			" Shift со стрелками начинает выделение текста
"   ...	выделенный текст копируется автоматически, Ctrl+Insert просто снимает выделение
vnoremap <C-Insert>	<Esc>
" - подсветка синтаксиса
set synmaxcol=1000 			" не подсвечивать слишком длинные строчки
colorscheme powerman
let perl_include_pod = 1		" подсвечивать POD внутри скриптов
let perl_string_as_statement = 1	" кавычки подсвечивать не как строку, а как if, while, ...
let htmlperl_string_as_statement = 1	" perl внутри html (без POD, но с кавычками)

""" Подключение плагинов из .vim/bundle/                        
" Plugin: pathogen
" Позволяет держать каждый плагин в отдельном подкаталоге, а не смешивать
" их все в ~/.vim/plugin/.
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

""" Улучшенный вариант команды:                                 % 
" Plugin: matchit
" Добавляет поддержку тегов, if/else/endif, окружающих строку кавычек, etc.
" Можно добавлять поддержку для новых типов файлов через b:match_words.

""" Поддержка командного режима в русской раскладке             
" Plugin: ruscmd
" Помимо русской раскладки в Normal/Visual режимах так же поддерживает
" некоторые команды (вроде :wq) набираемые в русской раскладке.

""" Автоматическая загрузка/сохранение сессии                   
" Plugin: autosess
" Запуск vim без параметров автоматически открывает все файлы/окна/табы,
" которые были открыты при выходе из vim запущенного в этом же каталоге
" (если в момент выхода было открыто больше одного файла).
let g:autosess_dir = '~/.cache/vim/autosess/'

""" Прозрачное редактирование файлов зашифрованных GnuPG        
" Plugin: vim-gnupg

""" Ускоренное открытие больших файлов                          
" Plugin: largefile
let g:LargeFile = 6			" in MB, default value is 20

""" Простое ручное управление свёрткой (folding):               :FoldMatching 
" Plugin: foldutil
" Plugin: genutils (нужен для foldutil)

""" Просмотр документации help/man/perldoc/etc.:                <F1>, K, q 
" Plugin: viewdoc
let g:viewdoc_man_cmd = 'LANG=en_US.UTF-8 /usr/bin/man'
let g:ViewDoc_css = 'ViewDoc_help_custom'
let g:viewdoc_copy_to_search_reg = 1
let g:viewdoc_perldoc_format = 'ansi'

""" Сохранение:                                                 <F2> 
inoremap <F2>	<C-O>:w<CR>
nnoremap <F2>	:w<CR>
vnoremap <F2>	<Esc>:w<CR>gv

""" Открытие:                                                   <F3> 
" inoremap <F3>	<C-O>:tabfind<Space>
" nnoremap <F3>	:tabfind<Space>
" vnoremap <F3>	<Esc>:tabfind<Space>
" Plugin: Command-T
inoremap <F3>	<C-O>:CommandT<CR>
nnoremap <F3>	:CommandT<CR>
vnoremap <F3>	<Esc>:CommandT<CR>
let g:CommandTCancelMap = '<F3>'
let g:CommandTAcceptSelectionMap = '<C-e>'
let g:CommandTAcceptSelectionTabMap = '<CR>'
let g:CommandTMaxFiles = 30000
let g:CommandTMaxHeight = 20
let g:CommandTMinHeight = 20
let g:CommandTRefreshMap = '<C-r>'

""" Вкл/Выкл вставку as-is (paste mode):                        <F4> 
" в INSERT: <F4> переключает paste/nopaste
" в NORMAL: i и <Insert> всегда входят в INSERT с nopaste
" в NORMAL: <F4> входит в INSERT с paste
set pastetoggle=<xF4>
nnoremap i		:set nopaste<CR><Insert>
nnoremap <Insert>	:set nopaste<CR><Insert>
nnoremap <F4>		:set paste<CR><Insert>

""" Вкл/Выкл перенос строк:                                     <F5> 
inoremap <F5>	<C-O>:set wrap!<CR>
nnoremap <F5>	:set wrap!<CR>

""" Выход (если все файлы записаны):                            <F10> 
inoremap <F10>	<Esc>:qa<CR>
nnoremap <F10>	:qa<CR>
vnoremap <F10>	<Esc>:qa<CR>

""" Скроллирование текста без смещения курсора:                 <Ctrl>+Arrows 
inoremap <C-Up>		<C-O><C-Y>
inoremap <C-Down>	<C-O><C-E>
inoremap <C-Right>	<C-O>z<Right>
inoremap <C-Left>	<C-O>z<Left>
nnoremap <C-Up>		<C-Y>
nnoremap <C-Down>	<C-E>
nnoremap <C-Right>	z<Right>
nnoremap <C-Left>	z<Left>
vnoremap <C-Up>		<C-Y>
vnoremap <C-Down>	<C-E>
vnoremap <C-Right>	z<Right>
vnoremap <C-Left>	z<Left>

""" Поиск потенциальных tag-ов и попытка перехода по ним:       <Alt>+Arrows 
" TODO	Сделать из этого отдельный плагин либо встроить в viewdoc.
"	Повесить s:SearchTag() на локально подменённые стандартные команды
"	работы с тэгами (tab, tnext, etc.).
"	Проверить совместимость с настоящими тэгами.
"	Поискать аналоги среди существующих плагинов.
autocmd FileType man			let b:searchtag = '\k\+(\([0-9]p\?\|[nlp]\|tcl\))'
autocmd FileType help			let b:searchtag = '|\S\+|\|''\S\+'''
autocmd FileType perl			let b:searchtag = '\<\w\+\(::\|(\)'
autocmd FileType perldoc		let b:searchtag = '\<\w\+\(::\|(\)'
inoremap <silent> <A-Up>	<C-O>:call <SID>SearchTag(0)<CR>
inoremap <silent> <A-Down>	<C-O>:call <SID>SearchTag(1)<CR>
nnoremap <silent> <A-Up>	:call <SID>SearchTag(0)<CR>
nnoremap <silent> <A-Down>	:call <SID>SearchTag(1)<CR>
imap <A-Right>			<C-]>
imap <A-Left>			<C-T>
nmap <A-Right>			<C-]>
nmap <A-Left>			<C-T>
function! s:SearchTag(forward)
	if !exists('b:searchtag')
		echohl WarningMsg | echo 'b:searchtag not configured for this file' | echohl None
	else
		call search(b:searchtag, a:forward ? 'W' : 'bW')
	endif
endfunction

""" За|Рас-комментирование:                                     #, <Ctrl>+C 
" Plugin: tcomment
" TODO Пусть работает, пока работает. А потом придётся написать свой плагин,
" т.к. простых реализаций нужной мне тривиальной функциональности пока нет.
" Либо форкнуть https://github.com/tpope/vim-commentary
let g:tcommentOptions = {'col': 1}
set commentstring=#\ %s
autocmd FileType fluxkeys		setlocal commentstring=!%s
autocmd FileType less			setlocal commentstring=//\ %s
" - закомментировать/раскомментировать: #
nnoremap #	:TComment<CR><Down>
vnoremap #	:TComment<CR>`><Down>
" - сделать копию текущей строки/блока, закомментировать верхнюю копию,
"   и перейти к нижней (изменение кода с сохранением старой версии): <Ctrl>+C
" Хак с visual в nmap (V, V"_Y) нужен для работы счётчика, например: 3<C-c>
inoremap <C-c>	<C-O>Y<C-O>:TComment!<CR><C-O>p
nnoremap <C-c>	VYgv:TComment!<CR>`>V"_Yp<Insert>
vnoremap <C-c>	Ygv:TComment!<CR>`>p<Insert>

""" Дописывание текущего слова:                                 <Tab>, <S-Tab> 
" Plugin: supertab
" Plugin: html5
au BufEnter * 	call s:SetupSuperTab()
function! s:SetupSuperTab()
	if &ft == 'html'
		" omni-complete using html5 plugin
		" html templates with header in separate file may need to set
		" b:html_omni_flavor or b:html_omni (not sure) to "html5"
		let g:SuperTabNoCompleteAfter = ['^', '\s']
		call SuperTabSetDefaultCompletionType("<c-x><c-o>")
	else
		let g:SuperTabNoCompleteAfter = ['^', '\k\@<!']
		call SuperTabSetDefaultCompletionType("context")
	endif
endfunction

""" Сниппеты:                                                   <Tab> 
" Plugin: snipMate
let g:snips_author = "Alex Efros"

""" Отступы/выравнивание:                                       <Tab> 
" Plugin: Smart Tabs
let g:ctab_disable_checkalign = 1 " эта непонятная фича ломает позицию курсора после <CR>

""" Проверка кода на ошибки при сохранении                      <F11>, <F12> 
" Plugin: syntastic
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0
let g:syntastic_echo_current_error = 0
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 3
" - отключить проверку из-за "ошибок" в html-шаблонах
let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }
" - disable perlcritic
"    TODO don't disable podchecker
"    TODO enable perlcritic for .pm files (and use t/.perlcritic if available)
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_enable_perl_checker = 1
" - переход к следующей/предыдущей ошибке: <F12>/<F11>
imap <silent> <F11>	<C-O>:execute "try<Bar>lprev<Bar>catch<Bar>lclose<Bar>endtry"<CR>
imap <silent> <F12>	<C-O>:execute "try<Bar>lnext<Bar>catch<Bar>lclose<Bar>endtry"<CR>
nmap <silent> <F11>	:execute "try<Bar>lprev<Bar>catch<Bar>lclose<Bar>endtry"<CR>
nmap <silent> <F12>	:execute "try<Bar>lnext<Bar>catch<Bar>lclose<Bar>endtry"<CR>

""" Открытие группы файлов в отдельных табах (эмуляция vi -p)   
autocmd VimEnter * nested		if argc() > 1 && !&diff | tab sball | tabfirst | endif

""" После закрытия таба переходить к предыдущему                
let s:leave_tab = 0
autocmd TabLeave *	let s:leave_tab = tabpagenr()
autocmd TabEnter *	if tabpagenr() != 1 && tabpagenr() == s:leave_tab | tabprevious | endif

""" Автоматически сворачивать отдельные файлы в патчах          
autocmd FileType diff			silent! FoldMatching ^diff -1

let g:vim_markdown_folding_disabled=0

""" Форсировать качественную подсветку синтаксиса (но медленную)
autocmd BufWinEnter *			syntax sync fromstart

""" Стиль форматирования разных типов файлов                    
" - отключить форматирование кода (оставить форматирование комментариев)
autocmd FileType perl			setlocal formatoptions-=t
autocmd FileType vim,sh,javascript	setlocal formatoptions-=t
autocmd FileType limbo,c,cpp,go		setlocal formatoptions-=t
autocmd FileType html			setlocal formatoptions-=t
" - большой отступ стимулирует уменьшать сложность/вложенность кода
autocmd FileType vim,sh,javascript	setlocal softtabstop=0 shiftwidth=8
autocmd FileType limbo,c,cpp,go		setlocal softtabstop=0 shiftwidth=8
" - пока выравниваем всё пробелами
autocmd FileType perl			setlocal expandtab
" - комментариев не бывает, а настройка по умолчанию мешает спискам
autocmd FileType asciidoc		setlocal comments=
" - авто-перенос длинных строк в списках
autocmd FileType asciidoc		setlocal formatlistpat=^\\s*\\(-\\\\|\\*\\+\\\\|\\.\\+\\\\|[A-Za-z]\\.\\\\|[0-9]\\+\\.\\)\\s\\+
" - маленький отступ в html
autocmd FileType html,html.tmpl         setlocal softtabstop=2 shiftwidth=2 expandtab

""" 80-column margin                                            
autocmd FileType perl			setlocal colorcolumn=81,82,83,84,85
autocmd FileType sh,javascript		setlocal colorcolumn=81,82,83,84,85
autocmd FileType limbo,c,cpp,go		setlocal colorcolumn=81,82,83,84,85
autocmd FileType mail,asciidoc		setlocal colorcolumn=81,82,83,84,85

""" Save & restore folding                                      
autocmd BufReadPost,FileReadPost *	if expand('<afile>') != 'quickfix' && !&readonly && !&diff && &ft != 'diff' | loadview | endif
autocmd BufWritePre,FileWritePre *	if expand('<afile>') != 'quickfix' && !&readonly && !&diff && &ft != 'diff' | mkview   | endif

""" Enter Insert mode                                           <CR> 
nnoremap <CR>	A<CR>

""" Enter commands without <Shift>                              ; 
nnoremap ;	:

""" Search in files                                             <Leader>/ 
" Plugin: ack
" Require: /usr/bin/ack http://betterthangrep.com/ (emerge sys-apps/ack)
nnoremap <Leader>/	:Ack!<Space>

""" HTML Zen Coding                                             <C-E>, <C-F> 
" Plugin: Sparkup
let g:sparkupNextMapping = '<C-F>'

""" Сравнение двух блоков в одном файле                         :Linediff 
" Plugin: linediff

""" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
" Экспериментальные или связанные с локальными файлами
" --------------------------------------------------------------

""" Настройка путей к файлам текущего проекта                   
" - defaults (if unable to detect project type)
set path=.,,
set tags=./tags,tags
let s:proj = ""
" - Narada project
let root  = filereadable("config/version")		? "."
	\ : filereadable("../config/version")		? ".."
	\ : filereadable("../../config/version")	? "../.."
	\ : filereadable("../../../config/version")	? "../../.."
	\ :						  ""
if !empty(root)
	execute "set path=.,".root.",".root."/template,".root."/public/css,".root."/public/js,".root."/t,".root."/perl,".root."/opt/*/*/module,".root."/opt/*/*/appl/cmd,".root."/opt/*/*/appl/lib,".","
	execute "set tags=".root."/tmp/tags"
	let s:proj = "Narada"
endif
" - ASDF project
let root  = filereadable(".lib/.version")		? "."
	\ : filereadable("../.lib/.version")		? ".."
	\ : filereadable("../../.lib/.version")		? "../.."
	\ : filereadable("../../../.lib/.version")	? "../../.."
	\ :						  ""
if !empty(root)
	execute "set path=.,".root.",".root."/.lib,".root."/.lib/t,".","
	execute "set tags=".root."/.lib/tmp/tags"
	let s:proj = "ASDF"
endif
" - Inferno project
let root  = filereadable("mkconfig")			? "."
	\ : filereadable("../mkconfig")			? ".."
	\ : filereadable("../../mkconfig")		? "../.."
	\ : filereadable("../../../mkconfig")		? "../../.."
	\ :						  ""
if !empty(root)
	execute "set path=.,".root.",".root."/module,".root."/appl/cmd,".root."/appl/lib,".","
	let s:proj = "Inferno"
endif
let s:proj_path = &path
" - file type specific
autocmd FileType c			setlocal path+=/usr/include
autocmd FileType limbo			setlocal path+=/usr/inferno/module,/usr/inferno/appl/cmd,/usr/inferno/appl/lib
" default ftplugin/perl.vim replace user's path, so we have to restore it
autocmd FileType perl			execute "setlocal path=".s:proj_path.",".&l:path


""" Улучшение определения типа файлов                           
autocmd BufRead */.fluxbox/keys		set ft=fluxkeys
autocmd BufRead */.opera/cache*		set ft=html
autocmd BufNewFile,BufRead *.txt        set ft=asciidoc

""" Особая проверка синтаксиса для некоторых файлов             
" Использование вспомогательных скриптов при проверке синтаксиса некоторых
" perl-скриптов для подгрузки всех нужных (для проверяемого) модулей и
" файлов, плюс дополнительная фильтрация неактуальных warning-ов
autocmd BufRead */proj/perl/*.pm        let g:syntastic_perl_perl_exe = "check_perl"
autocmd BufRead */proj/soft/*.pm        let g:syntastic_perl_perl_exe = "check_perl"
autocmd BufRead */t/*.t			let g:syntastic_perl_perl_exe = "check_perl"
autocmd BufRead */t/*.pm		let g:syntastic_perl_perl_exe = "check_perl"
autocmd BufRead */proj/rajeev/*		let g:syntastic_perl_perl_exe = "check_perl"
autocmd BufRead */parsers/[^.]*		let g:syntastic_perl_perl_exe = "check_perl"

" bootswatch:
" - заблокировать автоматическую компиляцию в .css (плагин vim-less)
" - проверять синтаксис подгружая все .less файлы проекта
autocmd BufReadPre */bootswatch/*.less  let b:did_ftplugin = 1
autocmd BufRead */bootswatch.less       let g:syntastic_less_lessc_args="--no-color ../global/build.less /dev/null"

""" Автоматический запуск команд после изменения файла          
autocmd BufWritePre  *			let b:was_modified = &modified
autocmd BufWritePost *			if b:was_modified && s:proj=="Narada" && (&ft == "perl" || &ft == "html" || &ft == "html.epl" || &ft == "html.tmpl") | call system("fastcgi_restart") | endif
autocmd BufWritePost *.dot		if b:was_modified && filereadable("index.txt") | call system("touch index.txt") | endif

""" Почта                                                       
" удалить подписи в конце письма, в т.ч. процитированные
" удалить лишние пустые строки перед подписью
" установить курсор перед подписью
" перейти в режим вставки
autocmd FileType mail
	\ %s/\(\(>\s\?\)\+\s*\n\)\+\(\(>\s\?\)\+\)-- \?\r\?\n\(\3.*\n\)\+//e |
	\ %s/^\n\+\n-- \n/-- /e |
	\ call search("^\\n\\n-- \\n") |
	\ if !empty(getline(line('.')-1)) | execute "normal o" | endif |
	\ startinsert

""" Фильтр для удаления из html всех тегов кроме тегов форм:    :ShowForm 
function! s:ShowForm()
    %!perl -p0e 'use Regexp::Common "RealHTML"; $_=join"\n",map{s/\s*$//;$_}/<\/?(?:form|input|select|option|textarea|button)${RE{">"}}[^<]*/ig'
endfunction
command! ShowForm :call <SID>ShowForm()

""" Переформатирование html                                     :Tidy 
function! s:Tidy()
	let oldft=&ft
	filetype indent on
	set ft=html
	normal gg=G
	filetype indent off
	let &ft=oldft
endfunction
command! Tidy :call <SID>Tidy()

""" Определение текущей группы подсветки:                       <Leader>hi, <Leader>HI, <Leader>SS 
nmap <silent> <Leader>hi	:echo
	\     "hi<" . synIDattr(           synID(line("."),col("."),1) ,"name") . ">" .
	\ " trans<" . synIDattr(           synID(line("."),col("."),0) ,"name") . ">" .
	\    " lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
nmap <silent> <Leader>HI	:autocmd CursorMoved <buffer> normal \hi<CR>
nmap <silent> <Leader>SS	:autocmd CursorMoved <buffer> :call <SID>SynStack()<CR>
function! s:SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc

""" Unsorted


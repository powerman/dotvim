""" SUMMARY                                                     
" VERSION: 3.4.0
" To view summary of this file run this (require foldutil plugin):
"       :FoldMatching ^""" -1

scriptencoding utf-8
"vint: -ProhibitAutocmdWithNoGroup

""" TODO                                                        
"
" Настроить единообразную поддержку программирования:
"                       Vim     Bash    Go      Perl    HTML    JS      CSS     
" - :tabfind            -       -               +       -       -       -       
" - syntax              +       +       +       +       +       +       +       
" - документация        +       +       +       +                       2.1     
" - omni-complete                       +               +                       
" - snippets            +       +       +       +       +       +               
" - ctags                                                                       
" - syntax check                +       +       +       +       +               
"   + lint              +       +       +                               +       
"                       Python  C       C++     Erlang  Haskell Limbo   /dis/sh 
" - :tabfind                    +                               +       -       
" - syntax              +       +       +       +       +       +       +       
" - документация        +                                       +       +       
" - omni-complete                                                               
" - snippets            +       +       +       +               +               
" - ctags                                                                       
" - syntax check        +       +       +       +       +       +               
"   + lint                                                                      
"
" Подобрать новую цветовую схему? http://habrahabr.ru/blogs/vim/134194/
"
" Проверить работу переназначенных кнопок через ssh и в текстовой консоли.

""" Шпаргалка по редко используемым классным стандартным фичам  
" - проверка правописания:
"   ]s          перейти к следующему слову
"   [s          перейти к предыдущему слову
"   zg          запомнить правильное слово
"   zw          отменить запомненное правильное слово
" - разное:
"   :tabfind    открыть файл по части имени (используя каталоги из `set path`)
"   [I          показать строки, в которых встречается текущее слово
"   >i}         сдвинуть вправо текущий блок между {...}
"   <i)         сдвинуть влево  текущий блок между (...)
"   q/          просмотреть/выполнить предыдущий поиск
"   q:          просмотреть/выполнить предыдущую команду

""" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
" Относительно универсальные настройки
" --------------------------------------------------------------

""" Разные настройки                                            
" - вспомогательные функции
function! s:Mkdir(dir)
    if !isdirectory(expand(a:dir))
        call mkdir(expand(a:dir), 'p', 0700)
    endif
endfunction
" - система
if &term ==# 'xterm'
    set term=xterm-256color
endif
if &term ==# 'screen'
    set term=screen-256color
    map  [1;5A <C-Up>
    map! [1;5A <C-Up>
    map  [1;5B <C-Down>
    map! [1;5B <C-Down>
    map  [1;5C <C-Right>
    map! [1;5C <C-Right>
    map  [1;5D <C-Left>
    map! [1;5D <C-Left>
    map  [2;5~ <C-Insert>
    map! [2;5~ <C-Insert>
    map  [3^   <C-Delete>
    map! [3^   <C-Delete>
    map  [1;5H <C-Home>
    map! [1;5H <C-Home>
    map  [1;5F <C-End>
    map! [1;5F <C-End>
    map  [5;5~ <C-PageUp>
    map! [5;5~ <C-PageUp>
    map  [6;5~ <C-PageDown>
    map! [6;5~ <C-PageDown>
    map  [1;3A <A-Up>
    map! [1;3A <A-Up>
    map  [1;3B <A-Down>
    map! [1;3B <A-Down>
    map  [1;3C <A-Right>
    map! [1;3C <A-Right>
    map  [1;3D <A-Left>
    map! [1;3D <A-Left>
    map  [1;3H <A-Home>
    map! [1;3H <A-Home>
    map  [1;3F <A-End>
    map! [1;3F <A-End>
    map  [5;3~ <A-PageUp>
    map! [5;3~ <A-PageUp>
    map  [6;3~ <A-PageDown>
    map! [6;3~ <A-PageDown>
    map  [1;2A <S-Up>
    map! [1;2A <S-Up>
    map  [1;2B <S-Down>
    map! [1;2B <S-Down>
    map  [1;2C <S-Right>
    map! [1;2C <S-Right>
    map  [1;2D <S-Left>
    map! [1;2D <S-Left>
    map  [3;2~ <S-Delete>
    map! [3;2~ <S-Delete>
    map  [1;2H <S-Home>
    map! [1;2H <S-Home>
    map  [1;2F <S-End>
    map! [1;2F <S-End>
endif
set fileencodings=ucs-bom,utf-8,koi8-r,default
" - предыдущая версия/состояние текста
set viewdir=~/.cache/vim/view           " убираем все временные файлы из ~/.vim/
set undofile                            " использовать persistent undo
set undodir=~/.cache/vim/undo           " 
set nobackup                            " зачем бэкап когда есть persistent undo!
call s:Mkdir(&viewdir)
call s:Mkdir(&undodir)
" - табы и отступы
set tabstop=8                           " стандартный размер таба
set expandtab                           " табы автоматически заменять пробелами
set shiftwidth=4                        " величина отступа (indent)
set shiftround                          " выравнивать отступы по shiftwidth
set softtabstop=4                       " сдвиг при нажатии таба (вставляет и табы и пробелы)
set autoindent                          " сохранять текущий отступ для новых строк
set smartindent                         " автоматическая коррекция отступа для блоков кода
set copyindent                          " использовать те же символы для отступа при:
set preserveindent                      "   1) autoindent; 2) изменении глубины отступа
"   ... коррекция smartindent: сохранять отступ для комментариев
inoremap #      X#
set formatoptions+=roj                  " продолжать комментарий на следующей строке
set formatoptions+=n                    " авто-перенос длинных строк внутри списков
set nojoinspaces                        " не вставлять 2 пробела после . при слиянии строк по J
" - вывод текста
set textwidth=74                        " граница для переформатирования и авто-переноса
set formatoptions+=l                    " отключить авто-перенос строк которые УЖЕ длиннее textwidth
set nowrap                              " не выводить длинные строки на нескольких строках
set listchars=eol:¬,nbsp:•,tab:▸·       " при `set list` показывать eol, nbsp и tab
set listchars+=extends:→,precedes:←     " при `set nowrap` выводить индикатор длинных строк
set showbreak=↪                         " при `set wrap` выводить индикатор длинных строк
set sidescrolloff=1                     " коррекция из-за индикатора длинных строк
set sidescroll=1                        " плавный горизонтальный скроллинг
" - поиск
set incsearch                           " искать по мере набора
set nohlsearch                          " не подсвечивать результаты поиска
set history=1000
" - сравнение
set diffopt+=vertical                   " по умолчанию открывать diff вертикально
set diffopt+=iwhite                     " по умолчанию игнорировать отличия в пробелах
" - общие фичи
set backspace=indent,eol,start          " разрешить <BS>-ом удалять всё что угодно
set ruler                               " всё время показывать позицию курсора внизу
set completeopt=                        " автодополнение в режиме вставки не выводит меню
set pumheight=5                         " высота меню автодополнения
set wildmenu                            " <Tab> в командной строке выводит меню
set wildcharm=<Tab>                     " вызов меню командной строки из скрипта
set wildignore=*.sw?,*.bak,*.orig       " не выводить эти файлы при автодополнении
set wildignore+=.hg,.git,.svn
set wildignore+=*.dis,*.sbl
set wildignore+=*.o,*.obj,*.manifest
set wildignore+=*.jpg,*.gif,*.png,*.jpeg,*.ico
set wildignore+=*.zwc
set wildignore+=*/patch/prev/*
set wildignore+=*/vendor/*
set wildignore+=_Inline
set wildignore+=_live
set wildignore+=node_modules,bower_components
set notimeout ttimeout ttimeoutlen=100  " таймаут для одиночных кнопок, но не комбинаций
set showcmd                             " показывать нажимаемые кнопки в командном режиме
set mouse=a                             " поддержка мыши во всех режимах
set nomodeline                          " эта фича - дыра в безопасности, отключаем
set shortmess+=I                        " не выводить заставку при старте vi
filetype plugin on                      " подгружать плагины для конкретных типов файлов
filetype indent off                     " отключить автоматическое переформатирование отступов
set spell spelllang=en,ru               " включить проверку правописания
"   ... останавливаться только на некорректных словах, а не редких/etc.
nnoremap ]s     ]S
nnoremap [s     [S
" - copy&paste в стиле винды
set keymodel=startsel                   " Shift со стрелками начинает выделение текста
"   ... выделенный текст копируется автоматически
vnoremap <S-Delete>     <Delete>
"   ... выделенный текст копируется автоматически Ctrl+Insert просто снимает выделение
vnoremap <C-Insert>     <Esc>
" - подсветка синтаксиса
set synmaxcol=1000                      " не подсвечивать слишком длинные строчки
colorscheme powerman
let perl_include_pod = 1                " подсвечивать POD внутри скриптов
let perl_string_as_statement = 1        " кавычки подсвечивать не как строку, а как if, while, ...
let htmlperl_string_as_statement = 1    " perl внутри html (без POD, но с кавычками)

" Avoid conflict with vim-textobj-comment (which defines 'ic' motion).
" This should be set before loading TComment plugin.
let g:tcomment_textobject_inlinecomment = ''

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
packadd! matchit

""" Поддержка Ctrl/Alt/Shift для Tab/CR/Space/BS/arrows/…       
" Plugin: fixtermkeys
map     <C-H>   <C-BS>
map!    <C-H>   <C-BS>
map     <Nul>   <C-Space>
map!    <Nul>   <C-Space>
" set timeout timeoutlen=1000

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
let g:LargeFile = 6                     " in MB, default value is 20

""" Поддержка Git                                               :Gbrowse, :Gstatus, :Gdiff, … 
" Plugin: fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
cnoreabbrev Glog Gllog
cnoreabbrev Ggrep Glgrep

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
inoremap <F2>   <C-O>:w<CR>
nnoremap <F2>   :w<CR>
vnoremap <F2>   <Esc>:w<CR>gv

""" Открытие:                                                   <F3> 
" inoremap <F3>   <C-O>:tabfind<Space>
" nnoremap <F3>   :tabfind<Space>
" vnoremap <F3>   <Esc>:tabfind<Space>
" Plugin: CtrlP
inoremap <F3>   <Esc>:CtrlP<CR>
let g:ctrlp_map = '<F3>'
let g:ctrlp_match_window = 'bottom,order:ttb,min:20,max:20,results:100'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 30000
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>', '<c-t>'],
    \ 'MarkToOpen()':         ['<c-z>'],
    \ 'OpenMulti()':          ['<c-o>'],
    \ 'PrtExit()':            ['<F3>', '<esc>', '<c-c>', '<c-g>'],
    \ }

""" Вкл/Выкл вставку as-is (paste mode):                        <F4> 
" в INSERT: <F4> переключает paste/nopaste
" в NORMAL: i и <Insert> всегда входят в INSERT с nopaste
" в NORMAL: <F4> входит в INSERT с paste
set pastetoggle=<xF4>
nnoremap i              :set nopaste<CR><Insert>
nnoremap <Insert>       :set nopaste<CR><Insert>
nnoremap <F4>           :set paste<CR><Insert>

""" Вкл/Выкл перенос строк:                                     <F5> 
inoremap <F5>   <C-O>:set wrap!<CR>
nnoremap <F5>   :set wrap!<CR>

""" Навигация по ctags                                          <F6> 
" Plugin: tagbar
nnoremap <silent> <F6> :TagbarToggle<CR>

""" Выход (если все файлы записаны):                            <F10> 
inoremap <F10>  <Esc>:qa<CR>
nnoremap <F10>  :qa<CR>
vnoremap <F10>  <Esc>:qa<CR>

""" Сдвиг текста без потери выделения:                          <, > 
vnoremap < <gv
vnoremap > >gv

""" Удалить предыдущее слово:                                   <Ctrl-BS> 
inoremap <C-BS>         <C-O>db
nnoremap <C-BS>         db
vnoremap <C-BS>         <Esc>db

""" Скроллирование текста без смещения курсора:                 <Ctrl>+Arrows 
inoremap <C-Up>         <C-O><C-Y>
inoremap <C-Down>       <C-O><C-E>
inoremap <C-Right>      <C-O>z<Right>
inoremap <C-Left>       <C-O>z<Left>
nnoremap <C-Up>         <C-Y>
nnoremap <C-Down>       <C-E>
nnoremap <C-Right>      z<Right>
nnoremap <C-Left>       z<Left>
vnoremap <C-Up>         <C-Y>
vnoremap <C-Down>       <C-E>
vnoremap <C-Right>      z<Right>
vnoremap <C-Left>       z<Left>

""" Поиск потенциальных tag-ов и попытка перехода по ним:       <Alt>+Arrows 
" TODO  Сделать из этого отдельный плагин либо встроить в viewdoc.
"       Повесить s:SearchTag() на локально подменённые стандартные команды
"       работы с тегами (tab, tnext, etc.).
"       Проверить совместимость с настоящими тегами.
"       Поискать аналоги среди существующих плагинов.
autocmd FileType man                    let b:searchtag = '\k\+(\([0-9]p\?\|[nlp]\|tcl\))'
autocmd FileType help                   let b:searchtag = '|\S\+|\|''\S\+'''
autocmd FileType perl                   let b:searchtag = '\<\w\+\(::\|(\)'
autocmd FileType perldoc                let b:searchtag = '\<\w\+\(::\|(\)'
inoremap <silent> <A-Up>        <C-O>:call <SID>SearchTag(0)<CR>
inoremap <silent> <A-Down>      <C-O>:call <SID>SearchTag(1)<CR>
nnoremap <silent> <A-Up>        :call <SID>SearchTag(0)<CR>
nnoremap <silent> <A-Down>      :call <SID>SearchTag(1)<CR>
imap <A-Right>                  <C-]>
imap <A-Left>                   <C-T>
nmap <A-Right>                  <C-]>
nmap <A-Left>                   <C-T>
function! s:SearchTag(forward)
    if !exists('b:searchtag')
        echohl WarningMsg | echo 'b:searchtag not configured for this file' | echohl None
    else
        call search(b:searchtag, a:forward ? 'W' : 'bW')
    endif
endfunction

""" За|Рас-комментирование:                                     #, <Ctrl-C> 
" Plugin: tcomment
" TODO Пусть работает, пока работает. А потом придётся написать свой плагин,
" т.к. простых реализаций нужной мне тривиальной функциональности пока нет.
" Либо форкнуть https://github.com/tpope/vim-commentary
autocmd FileType *                      let b:tcomment_options = {'col': 1}
autocmd FileType go                     let b:tcomment_options = {}
set commentstring=#\ %s
autocmd FileType fluxbox                setlocal commentstring=#\ %s
autocmd FileType fluxkeys               setlocal commentstring=!%s
autocmd FileType less                   setlocal commentstring=//\ %s
autocmd FileType dot                    setlocal commentstring=//\ %s
" - закомментировать/раскомментировать: #
nnoremap #      :TComment<CR><Down>
vnoremap #      :TComment<CR>`><Down>
" - сделать копию текущей строки/блока, закомментировать верхнюю копию,
"   и перейти к нижней (изменение кода с сохранением старой версии): <Ctrl>+C
" Хак с visual в nmap (V, V"_Y) нужен для работы счётчика, например: 3<C-c>
inoremap <C-c>  <C-O>Y<C-O>:TComment!<CR><C-O>p
nnoremap <C-c>  VYgv:TComment!<CR>`>V"_Yp<Insert>
vnoremap <C-c>  Ygv:TComment!<CR>`>p<Insert>

""" Работа с комментариями:                                     ic, ac, aC 
" Plugin: vim-textobj-comment
" Сокращённая комбинация в стиле Q} для переформатирования комментария.
nmap QC Qac
" Ручное определение конца текущего параграфа в текущем комментарии.
autocmd FileType go nnoremap <buffer> Q} gq/\m\%#.*\(^\s*\/\/.*\)\@<=\(\n\s*\/\/.*\S.*\)*\(\n\s*\)*\ze/e+1<CR>

""" Дописывание текущего слова:                                 <Tab> 
" Plugin: deoplete
" Plugin: context_filetype
" Plugin: go
" Plugin: html5

" Avoid slowdown at startup.
let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#enable_at_startup = 0
call timer_start(1, 'DeopleteEnable', {})
func DeopleteEnable(timer)
    silent call deoplete#enable()
endfunc

" Autocomplete style.
call deoplete#custom#source('_',
    \ 'matchers', ['matcher_head'])

" <Tab> behaviour.
call deoplete#custom#option('auto_complete_popup', 'manual')

" XXX Often (but not always!) after these two steps:
" 1. Press <S-Tab> to expand some UltiSnip's snipped.
" 2. Press :w to trigger vim-go autosave which WILL reformat file.
" will be created ~/.cache/vim/view/* file with these commands:
"   inoremap <buffer> <nowait> <silent> <S-Tab> =UltiSnips#JumpBackwards()
"   snoremap <buffer> <nowait> <silent> <S-Tab> :call UltiSnips#JumpBackwards()
"   inoremap <buffer> <nowait> <silent> 	 =UltiSnips#JumpForwards()
"   snoremap <buffer> <nowait> <silent> 	 :call UltiSnips#JumpForwards()
" which in turn result in non-working both <Tab> and <S-Tab> after opening
" same file next time.
" So, let's unmap these mappings as a dirty workaround.
autocmd BufEnter * call s:unmap_bad_view()
function s:unmap_bad_view()
    silent! iunmap <buffer> <Tab>
    silent! sunmap <buffer> <Tab>
    silent! iunmap <buffer> <S-Tab>
    silent! sunmap <buffer> <S-Tab>
endfunction

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? <SID>smart_tab() :
    \ <SID>manual_complete()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

function s:smart_tab()
    let col = col('.') - 1
    if &expandtab || !col || getline('.')[:col-1] =~# '^\s*$'
        return "\<Tab>"
    endif
    return ' '
endfunction

function! s:manual_complete()
    call timer_start(100, {-> feedkeys("\<C-n>", 'in')})
    return deoplete#manual_complete()
endfunction

" Experimental.
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"

" Configure file types.
call deoplete#custom#var('omni', 'functions', {
    \ 'css':         ['csscomplete#CompleteCSS'],
    \ 'javascript':  ['javascriptcomplete#CompleteJS'],
    \ })
call deoplete#custom#var('omni', 'input_patterns', {
    \ 'javascript':  ['[^. *\t]\.\w*', '^\w+', '\s\w+'],
    \ 'css':         ['^\w+', '\s\w+'],
    \ })
" XXX Теоретически input_patterns должен быть более функционален, но он
" почему-то глючит для Go, поэтому пока используем omni_patterns.
"     \ 'go': ['[^. *\t]\.\w*', '^\w\+', '\s\w\+'],
call deoplete#custom#option('omni_patterns', {
    \ 'go':     ['[^. *\t]\.\w*'],
    \ 'html':   ['<\w*', '</\w*', '<[^>]*\s[[:alnum:]-]*'],
    \ 'xhtml':  ['<\w*', '</\w*', '<[^>]*\s[[:alnum:]-]*'],
    \ 'xml':    ['<\w*', '</\w*', '<[^>]*\s[[:alnum:]-]*'],
    \ })

if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#same_filetypes = {}
endif
let g:context_filetype#same_filetypes.gohtmltmpl = 'html'

if !exists('g:context_filetype#filetypes')
    let g:context_filetype#filetypes = {}
endif
let g:context_filetype#filetypes.gohtmltmpl = [
    \ {
    \   'start':     '<script\%( [^>]*\)\? type="text/javascript"\%( [^>]*\)\?>',
    \   'end':       '</script>',
    \   'filetype':  'javascript',
    \ },
    \ {
    \   'start':     '<script\%( [^>]*\)\? type="text/coffeescript"\%( [^>]*\)\?>',
    \   'end':       '</script>',
    \   'filetype':  'coffee',
    \ },
    \ {
    \   'start':     '<script\%( [^>]*\)\?>',
    \   'end':       '</script>',
    \   'filetype':  'javascript',
    \ },
    \ {
    \   'start':     '<style\%( [^>]*\)\?>',
    \   'end':       '</style>',
    \   'filetype':  'css',
    \ },
    \ {
    \   'start':     '<[^>]\+ style=\([''"]\)',
    \   'end':       '\1',
    \   'filetype':  'css',
    \ },
    \ ]

autocmd FileType gohtmltmpl     let b:html_omni_flavor="html5"

""" Сниппеты:                                                   <Shift-Tab> 
" Plugin: UltiSnips
" Plugin: go
let g:UltiSnipsExpandTrigger='<S-Tab>'
let g:UltiSnipsListSnippets=''
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
let g:UltiSnipsEditSplit = 'tabdo'

" Used in some snippets.
let g:snips_author = 'powerman'

autocmd FileType gohtmltmpl UltiSnipsAddFiletypes html

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
" - disable creating binaries in current dir
let g:syntastic_go_checkers = ['go']
let g:syntastic_go_go_build_args = '-o /dev/null'
let g:syntastic_go_go_test_args = '-tags integration'
" - filtering useless messages
let g:syntastic_zsh_zsh_quiet_messages = {
    \ 'regex':      ['no such user or named directory'],
    \ }
" - check shell .|source'd files
let g:syntastic_sh_shellcheck_args = '-x'
" - check vim
" Require: /usr/bin/vint https://github.com/Vimjas/vint (emerge dev-util/vint)
let g:syntastic_vim_checkers = ['vint']
" - переход к следующей/предыдущей ошибке: <F12>/<F11>
imap <silent> <F11>     <C-O>:execute "try<Bar>lprev<Bar>catch<Bar>lclose<Bar>endtry"<CR>
imap <silent> <F12>     <C-O>:execute "try<Bar>lnext<Bar>catch<Bar>lclose<Bar>endtry"<CR>
nmap <silent> <F11>     :execute "try<Bar>lprev<Bar>catch<Bar>lclose<Bar>endtry"<CR>
nmap <silent> <F12>     :execute "try<Bar>lnext<Bar>catch<Bar>lclose<Bar>endtry"<CR>

""" Открытие группы файлов в отдельных табах (эмуляция vi -p)   
autocmd VimEnter * nested               if argc() > 1 && !&diff | tab sball | tabfirst | endif

""" После закрытия таба переходить к предыдущему                
let s:leave_tab = 0
autocmd TabLeave *      let s:leave_tab = tabpagenr()
autocmd TabEnter *      if tabpagenr() != 1 && tabpagenr() == s:leave_tab | tabprevious | endif

""" Автоматически сворачивать отдельные файлы в патчах          
autocmd FileType diff                   silent! FoldMatching ^diff -1

let g:vim_markdown_folding_disabled=0

""" Форсировать качественную подсветку синтаксиса (но медленную)
autocmd BufWinEnter *                   syntax sync fromstart

""" Стиль форматирования разных типов файлов                    
" - отключить форматирование кода (оставить форматирование комментариев)
autocmd FileType sh,zsh                 setlocal formatoptions-=t
autocmd FileType perl,vim,javascript    setlocal formatoptions-=t
autocmd FileType limbo,c,cpp            setlocal formatoptions-=t
autocmd FileType html                   setlocal formatoptions-=t
" - включить автоматическое переформатирование отступов
autocmd FileType go                     runtime indent/go.vim
" - объявить блочные элементы разметки комментариями и запретить их форматировать по gq
"   * двухстрочные заголовки 1-4 уровней не поддерживаются
"   * заголовки параграфа поддерживаются только начинающиеся на большую букву
"   * блоки которые нет смысла форматировать не поддерживаются:
"       ---- (listing)
"       ++++ (passthrough)
"       .... (literal)
"       [source]
"         indented literal
"       |==== (table)
"   * две строки подряд начинающиеся на одинаковый "комментарий" будут некорректно
"     объединяться в одну:
"       [attribute1]
"       [attribute2]
"       **** первый элемент списка глубиной 4
"       **** второй элемент списка глубиной 4
" TODO Альтернативное решение: https://github.com/dahu/vim-asciidoc
autocmd FileType asciidoc               setlocal comments=://,:==,:****,:____,fb:-,fb:*,fb:**,fb:***,fb:****,fb:*****,fb:.,fb:..,fb:...,fb:....,fb:.....,:[,:--,:+,:.A,:.B,:.C,:.D,:.E,:.F,:.G,:.H,:.I,:.J,:.K,:.L,:.M,:.N,:.O,:.P,:.Q,:.R,:.S,:.T,:.U,:.V,:.W,:.X,:.Y,:.Z,:.А,:.Б,:.В,:.Г,:.Д,:.Е,:.Ё,:.Ж,:.З,:.И,:.Й,:.К,:.Л,:.М,:.Н,:.О,:.П,:.Р,:.С,:.Т,:.У,:.Ф,:.Х,:.Ц,:.Ч,:.Ш,:.Щ,:.Ъ,:.Ы,:.Ь,:.Э,:.Ю,:.Я
autocmd FileType asciidoc               setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" - авто-перенос длинных строк в списках
autocmd FileType asciidoc               setlocal formatlistpat=^\\s*\\(-\\\\|\\*\\+\\\\|\\.\\+\\\\|[A-Za-z]\\.\\\\|[0-9]\\+\\.\\)\\s\\+
" - отступ табами
autocmd FileType go,nginx,gonginxtmpl   setlocal softtabstop=0 shiftwidth=0 noexpandtab
" - коммиты в git
autocmd FileType gitcommit              setlocal textwidth=72
" - переформатирование при сохранении sh/bash
let g:shfmt_fmt_on_save = 1

""" 80-column margin                                            
" autocmd FileType perl                   setlocal colorcolumn=81,82,83,84,85
" autocmd FileType sh,zsh,javascript      setlocal colorcolumn=81,82,83,84,85
" autocmd FileType limbo,c,cpp,go         setlocal colorcolumn=81,82,83,84,85
" autocmd FileType asciidoc,markdown      setlocal colorcolumn=81,82,83,84,85
autocmd FileType mail                   setlocal colorcolumn=81,82,83,84,85

""" Save & restore folding                                      
autocmd BufReadPost,FileReadPost *      call <SID>PersistFolding(0)
autocmd BufWritePre,FileWritePre *      call <SID>PersistFolding(1)
function! s:PersistFolding(save)
    if expand('<afile>') !=# 'quickfix' && !&readonly && !&diff && &ft !=# 'diff' && &ft !=# 'mail'
        let l:save_buftype = &buftype
        set buftype=
        if a:save
            mkview
        else
            loadview
        endif
        let &buftype = l:save_buftype
    endif
endfunction

""" Enter Insert mode                                           <CR> 
autocmd BufWinEnter * if expand('<afile>') != 'quickfix' && !&readonly && !&diff && &ft != 'diff' && &ft != 'qf' && &ft != 'tagbar' | exe 'nnoremap <buffer> <CR> A<CR>' | elseif &ft != 'tagbar' | exe 'silent! nunmap <buffer> <CR>' | endif

""" Enter commands without <Shift>                              ; 
nnoremap ;      :

""" Search in files                                             <Leader>/ 
" Plugin: ack
" Require: /usr/bin/ack http://betterthangrep.com/ (emerge sys-apps/ack)
nnoremap <Leader>/      :Ack!<Space>

""" HTML Zen Coding                                             <Ctrl-E>, <Ctrl-F> 
" Plugin: Sparkup
let g:sparkupNextMapping = '<C-F>'

""" Сравнение двух блоков в одном файле                         :Linediff 
" Plugin: linediff

""" Вертикальное выравнивание по разделителю                    :Tabularize 
" Plugin: tabular

""" Поиск/преобразования (вариантов) слов                       :S, :Abolish, cr… 
" Plugin: abolish

""" Undo tree                                                   U 
" Plugin: undotree
nnoremap U :UndotreeToggle<CR>
let g:undotree_WindowLayout=4
let g:undotree_DiffpanelHeight=6
let g:undotree_SetFocusWhenToggle=1

""" Поддержка Go                                                <Leader>…, :Go… 
" Plugin: vim-go
let g:go_metalinter_command = 'golangci-lint'
let g:go_implements_mode = 'gopls'
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = 'goimports'
if executable('gofumports')
    let g:go_fmt_command = 'gofumports'
endif
" let g:go_fmt_command = 'gopls'
" let g:go_imports_autosave = 1
" let g:go_imports_mode = 'gopls'
let g:go_doc_keywordprg_enabled = 0
let g:go_template_use_pkg = 1
let g:go_list_type = 'quickfix'
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 0
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 0
let g:go_highlight_variable_assignments = 0
let g:go_build_tags = 'integration'
let g:go_gopls_matcher = 'caseSensitive'
let g:go_gopls_deep_completion = 0
let g:go_gopls_temp_modfile = 1
let g:go_gopls_use_placeholders = 1
autocmd FileType go nmap <buffer> <nowait> <Leader>r     <Plug>(go-run)
autocmd FileType go nmap <buffer> <nowait> <Leader>b     <Plug>(go-build)
autocmd FileType go nmap <buffer> <nowait> <Leader>t     <Plug>(go-test)
autocmd FileType go nmap <buffer> <nowait> <Leader>T     <Plug>(go-test-func)
autocmd FileType go nmap <buffer> <nowait> <Leader>c     <Plug>(go-coverage-toggle)
autocmd FileType go nmap <buffer> <nowait> <Leader>gd    <Plug>(go-def-tab)
autocmd FileType go nmap <buffer> <nowait> <Leader>gb    <Plug>(go-doc-browser)
autocmd FileType go nmap <buffer> <nowait> <Leader>s     <Plug>(go-implements)
autocmd FileType go nmap <buffer> <nowait> <Leader>i     <Plug>(go-info)
autocmd FileType go nmap <buffer> <nowait> <Leader>e     <Plug>(go-rename)

""" Поддержка Graphviz                                          <Leader>…, :Graphviz… 
" Plugin: WM Graphviz
let g:WMGraphviz_output='png'

""" Улучшенная строка статуса                                   
" Plugin: vim-airline
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '⏎'
" let g:airline_symbols.branch = 'Ύ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'
" runtime themes/airline-powerman.vim
" let g:airline_theme='powerman'
" " let g:airline_theme='bubblegum'
" " let g:airline_theme='durant'
" " let g:airline_theme='powerlineish'
" " let g:airline_theme='sol'
" " let g:airline_theme='ubaryd'
" set laststatus=2

""" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
" Экспериментальные или связанные с локальными файлами
" --------------------------------------------------------------

""" Настройка путей к файлам текущего проекта                   
" - defaults (if unable to detect project type)
set path=.,,
set tags=./tags,tags
let s:proj = ''
" - Narada project
let root  = filereadable('config/version')      ? '.'
    \ : filereadable('../config/version')       ? '..'
    \ : filereadable('../../config/version')    ? '../..'
    \ : filereadable('../../../config/version') ? '../../..'
    \ : filereadable('VERSION')                 ? '.'
    \ : filereadable('../VERSION')              ? '..'
    \ : filereadable('../../VERSION')           ? '../..'
    \ : filereadable('../../../VERSION')        ? '../../..'
    \ :                                           ''
if !empty(root)
    execute 'set path=.,'.root.','.root.'/template,'.root.'/public/css,'.root.'/public/js,'.root.'/t,'.root.'/perl,'.root.'/opt/*/*/module,'.root.'/opt/*/*/appl/cmd,'.root.'/opt/*/*/appl/lib,'.','
    execute 'set tags='.root.'/tmp/tags'
    let s:cwd = getcwd()
    execute 'lcd '.root
    execute 'autocmd BufNewFile,BufRead * lcd! '.getcwd()
    execute 'lcd '.s:cwd
    let s:proj = 'Narada'
endif
" - ASDF project
let root  = filereadable('.lib/.version')       ? '.'
    \ : filereadable('../.lib/.version')        ? '..'
    \ : filereadable('../../.lib/.version')     ? '../..'
    \ : filereadable('../../../.lib/.version')  ? '../../..'
    \ :                                           ''
if !empty(root)
    execute 'set path=.,'.root.','.root.'/.lib,'.root.'/.lib/t,'.','
    execute 'set tags='.root.'/.lib/tmp/tags'
    let s:proj = 'ASDF'
endif
" - Inferno project
let root  = filereadable('mkconfig')            ? '.'
    \ : filereadable('../mkconfig')             ? '..'
    \ : filereadable('../../mkconfig')          ? '../..'
    \ : filereadable('../../../mkconfig')       ? '../../..'
    \ :                                           ''
if !empty(root)
    execute 'set path=.,'.root.','.root.'/module,'.root.'/appl/cmd,'.root.'/appl/lib,'.','
    let s:proj = 'Inferno'
endif
" - Git project
let root  = isdirectory('.git')                 ? '.'
    \ : isdirectory('../.git')                  ? '..'
    \ : isdirectory('../../.git')               ? '../..'
    \ : isdirectory('../../../.git')            ? '../../..'
    \ : isdirectory('../../../../.git')         ? '../../../..'
    \ : isdirectory('../../../../../.git')      ? '../../../../..'
    \ :                                           ''
if !empty(root)
    execute 'set path=.,'.root.','.root.'/template,'.root.'/public/css,'.root.'/public/js,'.root.'/t,'.','
    execute 'set tags='.root.'/tmp/tags'
    let s:cwd = getcwd()
    execute 'lcd '.root
    execute 'autocmd BufNewFile,BufRead * lcd! '.getcwd()
    execute 'lcd '.s:cwd
endif
let s:proj_path = &path
" - file type specific
autocmd FileType c                      setlocal path+=/usr/include
autocmd FileType limbo                  setlocal path+=/usr/inferno/module,/usr/inferno/appl/cmd,/usr/inferno/appl/lib
" default ftplugin/perl.vim replace user's path, so we have to restore it
autocmd FileType perl                   execute "setlocal path=".s:proj_path.",".&l:path
" - do not copy @INC dirs to path to avoid slowdown while searching hundreds perl modules
let perlpath = ''
" complement binfmt gorun support - check only this source file when in /bin/
autocmd BufNewFile,BufRead */bin/*.go   let b:syntastic_go_go_build_args=g:syntastic_go_go_build_args.' '.expand('%:p')
" packages which depends on static libgit2/git2go
autocmd BufNewFile,BufRead */vcprompt-fast/*.go let b:syntastic_go_go_build_args=g:syntastic_go_go_build_args.' -tags static -buildmode pie'

""" Улучшение определения типа файлов                           
autocmd BufRead */.fluxbox/keys                 set ft=fluxkeys
autocmd BufRead */.opera/cache*                 set ft=html
autocmd BufNewFile,BufRead *nginx*/*.conf       set ft=nginx
autocmd BufNewFile,BufRead *nginx*/sites-*/*    set ft=nginx
autocmd BufNewFile,BufRead TODO*,BUG*,README*   set ft=asciidoc
autocmd BufNewFile,BufRead *.txt,*.adoc         set ft=asciidoc
autocmd BufNewFile,BufRead *.md                 set ft=markdown
autocmd BufNewFile,BufRead migrate,*.migrate    set ft=migrate
autocmd BufNewFile,BufRead *.t                  set ft=perl
autocmd BufNewFile,BufRead *.html.tmpl          set ft=html.tmpl
autocmd BufNewFile,BufRead */go/src/*.tmpl      set ft=gotexttmpl
autocmd BufNewFile,BufRead */go/src/*.html.tmpl set ft=gohtmltmpl
autocmd BufNewFile,BufRead *nginx*/*.tmpl       set ft=gonginxtmpl
autocmd BufNewFile,BufRead *.yml.tmpl,*.yaml.tmpl set ft=goyamltmpl
autocmd BufNewFile,BufRead *zsh*functions/*     set ft=zsh
autocmd BufNewFile,BufRead *.cql                set ft=sql
autocmd BufNewFile,BufRead .mailfilter*         set ft=maildrop
autocmd BufNewFile,BufRead go.mod               set ft=gomod

""" Особая проверка синтаксиса для некоторых файлов             
" Использование вспомогательных скриптов при проверке синтаксиса некоторых
" perl-скриптов для подгрузки всех нужных (для проверяемого) модулей и
" файлов, плюс дополнительная фильтрация неактуальных warning-ов
autocmd BufRead */proj/*.pm             let g:syntastic_perl_perl_exe = "check_perl"
autocmd BufRead */t/*.t                 let g:syntastic_perl_perl_exe = "check_perl"

" bootswatch:
" - заблокировать автоматическую компиляцию в .css (плагин vim-less)
" - проверять синтаксис подгружая все .less файлы проекта
autocmd BufReadPre */bootswatch/*.less  let b:did_ftplugin = 1
autocmd BufRead */bootswatch.less       let g:syntastic_less_lessc_args="--no-color ../global/build.less /dev/null"

""" Автоматический запуск команд после изменения файла          
autocmd BufWritePre  *                  let b:was_modified = &modified
autocmd BufWritePost *                  if b:was_modified && s:proj=="Narada" && (&ft == "perl" || &ft == "html" || &ft == "html.epl" || &ft == "html.tmpl") | call system("fastcgi_restart") | endif
autocmd BufWritePost *.dot              if b:was_modified && filereadable("index.txt") | call system("touch index.txt") | endif
autocmd BufWritePost *.dot              if b:was_modified && !filereadable("index.txt") | silent execute "GraphvizCompile" | endif

""" Почта                                                       
" добавить в начало письма приветствие
" удалить подписи в конце письма, в т.ч. процитированные
" удалить лишние пустые строки (включая процитированные) перед подписью
" установить курсор перед подписью
" перейти в режим вставки
autocmd FileType mail
    \ if match(getline(1), "^On [A-Z]\\|^$") == 0 | execute "0r~/.greeting" | endif |
    \ %s/^\(\(>\s\?\)\+\s*\n\)*\(\(>\s\?\)\+\)-- \?\r\?\n\(\3.*\n\)\+//e |
    \ %s/^\(\(>\s\?\)\+\s*\n\)*\n\+-- \n/-- /e |
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
    " XXX Скорее всего линтер отключать не нужно, но я не понял, что он хочет.
    "vint: -ProhibitCommandRelyOnUser
    normal gg=G
    "vint: +ProhibitCommandRelyOnUser
    filetype indent off
    let &ft=oldft
endfunction
command! Tidy :call <SID>Tidy()

""" Определение текущей группы подсветки:                       <Leader>hi, <Leader>HI, <Leader>SS 
nmap <silent> <Leader>hi        :echo
    \     "hi<" . synIDattr(           synID(line("."),col("."),1) ,"name") . ">" .
    \ " trans<" . synIDattr(           synID(line("."),col("."),0) ,"name") . ">" .
    \    " lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
nmap <silent> <Leader>HI        :autocmd CursorMoved <buffer> normal \hi<CR>
nmap <silent> <Leader>SS        :autocmd CursorMoved <buffer> :call <SID>SynStack()<CR>
function! s:SynStack()
    echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), ' > ')
endfunc

""" Unsorted                                                    
let g:markdown_fenced_languages = ['go']

" Fix "missing" first 2 symbols on line 2 after opening new file.
autocmd BufReadPost,FileReadPost *      call timer_start(1, 'FixRedraw', {})
func FixRedraw(timer)
    redraw!
endfunc

" set re=1 " speedup large asciidoc files a LOT!

" https://vim.fandom.com/wiki/Sum_numbers
" Usage:
"       :let g:sum=0
"       :%s/\d\+/\=Sum(submatch(0))/
"       :%s/\$\zs\d\+/\=Sum(submatch(0))/g
"       :echo g:sum
let g:sum = 0  "result in global variable sum
function! Sum(number)
    let g:sum = g:sum + a:number
    return a:number
endfunction

" Usage:
"       :'<,'>call TR()
function! TR() range
    let g:sum = 0
    execute a:firstline . ',' . a:lastline . 's/\d\+\ze m/\=Sum(submatch(0))'
    let l:mins = g:sum % 60
    let l:hours = g:sum / 60
    let g:sum = 0
    execute a:firstline . ',' . a:lastline . 's/\d\+\ze h/\=Sum(submatch(0))'
    let l:hours = l:hours + g:sum
    echo l:hours 'h' l:mins 'm'
    let g:sum = 0
endfunction

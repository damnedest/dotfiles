set guifont=Consolas\ 11
set guioptions=aegimrLt

let $PATH .= ':/home/ereih/.composer/vendor/bin/:/home/ereih/.config/composer/vendor/bin/'

set nocompatible          " We're running Vim, not Vi!

filetype on
filetype plugin on " Enable filetype-specific indenting and plugins
filetype indent on

"Search options
set ignorecase
set hlsearch
set incsearch

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set softtabstop=4

"set listchars=trail:·
"set list
"my bindings

imap <F2> <ESC>:w<CR>
nmap <F2> :w<CR>
vmap <F2> <ESC>:w<CR>

imap <S-F2> <ESC>:w<CR>:%s/\s\+$//<CR>:w<CR>
nmap <S-F2> :w<CR>:%s/\s\+$//<CR>:w<CR>
vmap <S-F2> <ESC>:w<CR>:%s/\s\+$//<CR>:w<CR>

imap <F3> <ESC>:cn<CR>
nmap <F3> :cn<CR>
vmap <F3> <ESC>:cn<CR>

imap <S-F3> <ESC>:cp<CR>
nmap <S-F3> :cp<CR>
vmap <S-F3> <ESC>:cp<CR>

imap <F9> <ESC>:make<CR>
nmap <F9> :make<CR>
vmap <F9> <ESC>:make<CR>

nmap <Home> ^
imap <Home> <Esc>I

" Пробел в нормальном режиме перелистывает страницы
nmap <Space> <PageDown>

" Автозавершение слов по tab =)
function InsertTabWrapper()
     let col = col('.') - 1
     if !col || getline('.')[col - 1] !~ '\k'
         return "\<tab>"
     else
         return "\<c-p>"
     endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>

" Слова откуда будем завершать
set complete=""
" Из текущего буфера
set complete+=.
" Из других открытых буферов
set complete+=b
" из тегов
set complete+=t

" по Ctrl-Enter вставляем пустую строку в Mormal Mode
map <C-CR> o<ESC>

" map < & > to indent blocks
vnoremap < <gv
vnoremap > >gv

set undolevels=1000
set autowriteall

"Свернутый код
highlight Folded guibg=black guifg=lightblue

"minibufexplorer options
map <C-tab> :MBEbn<CR>
map <C-S-tab> :MBEbp<CR>

" закрыть буфер
" Функция Kwbd определена ниже в этом файле
imap <S-F4> <Esc>:call Kwbd(1)<CR>
nmap <S-F4> :call Kwbd(1)<CR>

"delete the buffer; keep windows
function Kwbd(kwbdStage)
    if(a:kwbdStage == 1)
        let g:kwbdBufNum = bufnr("%")
        let g:kwbdWinNum = winnr()
        windo call Kwbd(2)
        execute "bd! " . g:kwbdBufNum
        execute "normal " . g:kwbdWinNum . ""
    else
        if(bufnr("%") == g:kwbdBufNum)
            let prevbufvar = bufnr("#")
            if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != g:kwbdBufNum)
                b #
            else
                bn
            endif
        endif
    endif
endfunction

"Какая-то фигня в minibuff explorer :)
highlight link MBENormal Normal

"minibufexplorer options
map <Leader>b :MiniBufExplorer<cr>
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapCTabSwitchWindows = 1


" taglist options
nmap <silent> <F11> :TagbarToggle<CR>

"<F7> EOL format (dos <CR><NL>,unix <NL>,mac <CR>)
set  wildmenu
set  wcm=<Tab>
menu EOL.unix :set fileformat=unix<CR>
menu EOL.dos  :set fileformat=dos<CR>
menu EOL.mac  :set fileformat=mac<CR>

"<F8> Change encoding
set  wildmenu
set  wcm=<Tab>
menu Enc.cp1251     :e ++enc=cp1251<CR>
menu Enc.koi8-r     :e ++enc=koi8-r<CR>
menu Enc.cp866      :e ++enc=ibm866<CR>
menu Enc.utf-8      :e ++enc=utf-8<CR>
menu Enc.ucs-2le    :e ++enc=ucs-2le<CR>
map  <F8> :emenu Enc.<Tab>

"<Shift+F8> Convert file encoding
set  wildmenu
set  wcm=<Tab>
menu FEnc.cp1251    :set fenc=cp1251<CR>
menu FEnc.koi8-r    :set fenc=koi8-r<CR>
menu FEnc.cp866     :set fenc=ibm866<CR>
menu FEnc.utf-8     :set fenc=utf-8<CR>
menu FEnc.ucs-2le   :set fenc=ucs-2le<CR>
map  <S-F8> :emenu FEnc.<Tab>

"<Shift+F8> Convert file encoding
set  wildmenu
set  wcm=<Tab>
menu Projects.avito-site<TAB>\<S-F9\>       :source /www/avito-site/settings.vim<CR>
menu Projects.avito-site-helm<TAB>\<S-F9\>  :source /www/avito-site-helm/settings.vim<CR>

"map <S-F8>  :source /www/propheart.com/settings.vim<CR>
map <S-F9>  :source /www/yzerproperty.com/settings.vim<CR>
map <S-F10> :source /www/yzermotors.com/settings.vim<CR>
"map <S-F11> :source /www/damni-core/settings.vim<CR>

set ruler
set hidden

"highlight CursorLine guibg=#000060
"set cursorline

" PHP Docs
let g:pdv_cfg_Package=""
let g:pdv_cfg_Version=""
let g:pdv_cfg_Author=""
let g:pdv_cfg_Copyright=""
let g:pdv_cfg_License=""
let g:pdv_cfg_ClassCommentEnd=""
let g:pdv_cfg_FuncCommentEnd=""
let g:pdv_cfg_CommentTail=" */\r"

source ~/.vim/bundle/php-doc-modded/plugin/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

let g:netrw_dirhistmax=0

call pathogen#infect()

syntax enable

set wildignorecase
set wildignore+=**/**/Templates/Compiled/*.*

" Syntastic plugin settings

let g:loaded_syntastic_xhtml_tidy_checker=1
let g:syntastic_php_checkers = ['php']

map <Leader>t :FufTag <CR>
map <Leader>f :FufCoverageFile <CR>
let g:fuf_coveragefile_exclude = '\v\~$|vendor/|node_modules/|cache/|configs/|debug/|\.git.*'

" Snipmate plugin settings

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['php'] = 'php'

imap <C-Tab> <Plug>snipMateTrigger

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType xhtml vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

let g:padawan#cli = 'padawan'
let g:padawan#server_command = 'padawan-server'

set laststatus=2

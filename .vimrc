syntax on
language en_US.utf8

let &termencoding=&encoding
let g:zenburn_high_Contrast = 1

colorscheme zenburn

" Indenting
set autoindent
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set fileformat=unix
set formatoptions=ro
set ignorecase
set incsearch
set laststatus=2
set modeline
set noerrorbells
set nofoldenable
set nohlsearch
set novisualbell
set nowrap
set number
set scrolljump=5
set scrolloff=3
set shiftwidth=4
set showmatch
set smartcase
set smartindent
set softtabstop=4
set splitbelow
set splitright
set statusline=%F%m%r%h%w\ (%04l/%04L)%=[FORMAT=%{&ff}]\ [TYPE=%Y]\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}
set tabstop=4
set t_Co=256
set wildmode=longest:full
set wildmenu

" Base on https://github.com/spf13/spf13-vim
function! InitializeDirectories()
    let separator = "."
    let parent = $HOME
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/.vim/' . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

" Mappings
" map  <F1>  :tabe ~/.vimrc<CR>
" map  <F2>  :source ~/.vimrc<CR>
map  <F3>  :set paste<CR>i
map  <F4>  :set nopaste<CR>
map  <F5>  :set hlsearch<CR>
map  <F6>  :set nohlsearch<CR>
map  <F7>  :tabprev<CR>
map! <F7>  <ESC>:tabprev<CR>
map  <F8>  :tabnext<CR>
map! <F8>  <ESC>:tabnext<CR>
map  <F9>  :set number<CR>
map! <F9>  <ESC>:set number<CR>i
map  <F10>  :set nonumber<CR>
map! <F10>  <ESC>:set nonumber<CR>i

" Change highlighting
" hi Pmenu ctermbg=darkblue
" hi PmenuSel ctermbg=cyan
" hi PmenuSel ctermfg=white
" hi Comment ctermfg=lightblue
" hi Constant ctermfg=lightred
" hi Preproc ctermfg=lightmagenta
" hi LineNr ctermfg=white
" hi Comment ctermfg=blue
" hi Normal ctermfg=white
" hi Structure ctermfg=green
" hi Statement ctermfg=yellow
" hi Identifier ctermfg=cyan
" hi clear CursorLine
hi CursorLine ctermbg=darkblue
" hi clear CursorColumn
hi CursorColumn ctermbg=darkblue

" Remove trailing whitespace
func! DeleteTrailingWS()
    norm mz
    %s/\s\+$//ge
    norm `z
endfunc

" Remove any ^M
func! DeleteTrailingDOS()
    norm mz
    %s///ge
    norm `z
endfunc

" Replace tabs with 4 spaces
func! ReplaceTabs()
    norm mz
    %s/\t/    /ge
    norm `z
endfunc

" Highlight the trailing whitespaces
highlight WhitespaceEOL ctermbg=DarkRed guibg=Red
match WhitespaceEOL /\s\+$/

" Highlight the tabs
highlight NastyTabs ctermbg=DarkBlue guibg=Blue
match NastyTabs /\t/

match ErrorMsg /\s\+$/


" Map the whitespace removal to keystrokes (<leader> = '\')
map <silent> <leader>ds :call DeleteTrailingWS()<CR>
" Map the DOS ^M removal to keystrokes (<leader> = '\')
map <silent> <leader>dd :call DeleteTrailingDOS()<CR>
" Map the tabs replacing to keystrokes (<leader> = '\')
map <silent> <leader>rt :call ReplaceTabs()<CR>
" Mark the line and column for the cursor
map <silent> <Leader>cc :set cursorcolumn! cursorline!<CR>

" Clean a file when saving it:
"  - Remove trailing whitespace
"  - Remove trailing ^M (DOS)
augroup savecleanup
    autocmd!
    autocmd BufWrite *.{js,php,sql,html,tpl,py} :call DeleteTrailingWS()
    autocmd BufWrite *.{js,php,sql,html,tpl,py} :call DeleteTrailingDOS()
augroup end

" Force highlighting when entering a window/tab
augroup hightlightws
    autocmd!
    autocmd BufWinEnter *.{js,php,sql,html,tpl,py} match WhitespaceEOL /\s\+$/
augroup end

" Force highlighting when entering a window/tab
augroup hightlighttabs
    autocmd!
    autocmd BufWinEnter *.{js,php,sql,html,tpl,py} match NastyTabs /\t/
augroup end

"augroup readskeleton
"    autocmd BufNewFile  *.html  0r ~/.vim/skel/skeleton.html
"    autocmd BufNewFile  *.php   0r ~/.vim/skel/skeleton.php
"    autocmd BufNewFile  *.py    0r ~/.vim/skel/skeleton.py
"    autocmd BufNewFile  *.js    0r ~/.vim/skel/skeleton.js
"    autocmd BufNewFile  *.sql   0r ~/.vim/skel/skeleton.mysql
"augroup end

" Load the settings for snipMate
source ~/.vim/snipMate_settings.vim

" vim, not vi!
set nocompatible

" Vundle {{{
" required Vundle setup
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" colorscheme
Plugin 'chriskempson/base16-vim'

" syntax plugins
" Plugin 'StanAngeloff/php.vim'
" Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'dag/vim-fish'
" Plugin 'hdima/python-syntax'
" Plugin 'hynek/vim-python-pep8-indent'

" features
" Plugin 'tpope/vim-sensible'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'bling/vim-airline'
" Plugin 'scrooloose/syntastic'
" Plugin 'jmcantrell/vim-virtualenv'
" Plugin 'Raimondi/delimitMate'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
" Plugin 'ervandew/supertab'
" Plugin 'itchyny/lightline.vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'godlygeek/tabular'
" Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'scrooloose/nerdtree'
" Plugin 'terryma/vim-expand-region'
" Plugin 'vim-scripts/Css-Pretty'
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'weynhamz/vim-plugin-minibufexpl'
call vundle#end()
filetype plugin on
filetype indent on
" }}}
" Encoding {{{

" Set the locale for vim to use
language en_US.utf8

" Set the keyboard encoding to the terminal encoding
let &termencoding=&encoding

" Sets the character encoding when saving files. Files are converted if the
" value differs from the value in 'encoding'.
" set fileencoding=utf-8

" Sets the character encoding used inside vim itself
set encoding=utf-8

" This gives the <EOL> of the current buffer (UNIX: <NL>)
set fileformat=unix

" }}}
" Indenting {{{

" Backspace over autoindent, linebreaks and start of insert
set backspace=indent,eol,start
" Copy indent from current line when starting a new line
set autoindent
" Use the appropriate number of spaces to insert a Tab
set expandtab
" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>.
set softtabstop=4
" Number of spaces that a <Tab> in the file counts for. Can be disabled if
" spaces are used for indentation (see softtabstop).
" set tabstop=4
" Round indentation to multiples of shiftwidth
set shiftround
" Round identspaces to multitudes of shiftwidth
set shiftwidth=4
" Used with autoindent; indents a step further when using { or (
set smartindent

" }}}
" Search {{{

" When searching for a string that contains uppercase, ignore the ignorecase option
set smartcase
" Ignore case when searching
set ignorecase
" Search whilst typing
set incsearch
" Disable highlighted search by default
set nohlsearch
" }}}
" Folding {{{

" Fold based on indent level
set foldmethod=indent
" Max 10 depth
set foldnestmax=10
" Don't fold files by default on open
set foldenable
" Use space to toggle folds
nnoremap <space> za

" }}}
" GUI {{{

" Enable 256 colors (don't fool vim - property report the terminal capabilities
" using .screenrc (term 'screen-256color') or terminal emulator
" ('xterm-256color')
" set t_Co=256
" Wrap text after the specified column to help readability
set textwidth=79
" A list of screen columns that are highlighted by the ColorColumn group
set colorcolumn=80,120
" Enable the highlighting of the active line
set cursorline
" Force a statusline (even for a single window
set laststatus=2
" Format the statusline
" Full filename
set statusline=%F
" Modification symbol
set statusline+=%m
" Readonly flag
set statusline+=%r
" Preview window flag
set statusline+=%w
" Linenumber / Total lines
set statusline+=\ (%04l/%04L)
" Format filetype
set statusline+=\ %=[FORMAT=%{&ff}]
" Type flag
set statusline+=\ [TYPE=%Y]
" Check for BOM (utf8)
set statusline+=\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")
            \\ &&
            \\ &bomb)?\",B\":\"\").\"]\ \"}
" No beep or screen flash upon errors
set noerrorbells
" No screen flash at all
set novisualbell
" Don't wrap text by default
set nowrap
" Show linenumbers
set number
" Set the width of the linenumber section
set numberwidth=6
" Automatically break to the next line if the length of the exceeeds textwidth
set linebreak
" Enable list mode (characters for tabs, spaces and line-endings)
set list
" Specify other characters for certain list-items
set listchars=tab:»·,trail:·,eol:¬
" When the cursor is on a matchable item (ie parenthesis), highlight the
" matching item
set showmatch
" Set the maximum column to which syntax highlighting should be applied
set synmaxcol=255
" Hide active mode from the statusline (e.g. '--INSERT--')
set noshowmode
" Set the title of the window to the value of the 'titlestring' variable
set title

" }}}
" Misc {{{

" Enable the usage of modelines at the beginning or ending of files
set modeline
" Improve performance when running macros
set lazyredraw
" Open a vertical split below the current buffer
set splitbelow
" Open a horizontal split to the right of the current buffer
set splitright
" When scrolling, jump 5 lines at a time
set scrolljump=5
" When reaching the third line from the bottom or top, perform a scrolljump
set scrolloff=3

" }}}

" Completion options for CTRL-P/CTRL-N
set completeopt=longest,menuone
set formatoptions=ro
set formatoptions-=t
set shortmess=atI
set wildmode=list:longest
set wildmenu

" Mappings {{{
" rebind <Leader> key
let mapleader = ","

vnoremap <Leader>s :sort<CR>
vnoremap <Leader>p :set paste!<CR>
noremap <Leader>n :bp<CR>
noremap <Leader>m :bn<CR>
noremap <Leader>b :buffers<CR>
noremap <Leader><SPACE> :bn<CR>

map <c-n> :set number!<CR>
map <c-l> :set list!<CR>

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" }}}
" Runtime configs {{{

runtime macros/matchit.vim

" set runtimepath+=~/.vim/custom
" runtime! custom/ctrlp.vim
" runtime! custom/airline.vim
" runtime! custom/syntastic.vim
" runtime! custom/virtualenv.vim
" runtime! custom/jedi-vim.vim
" runtime! custom/supertab.vim
" runtime! custom/lightline.vim
" runtime! custom/expandregion.vim
" runtime! custom/indentguides.vim
" runtime! custom/nerdtree.vim
" runtime! custom/supertab.vim
" runtime! custom/neocomplete.vim
" runtime! custom/ultisnips.vim

" }}}
" Colorscheme {{{

" Notify the colorscheme that I want a dark background
set background=dark

" Notify the colorscheme that vim supports 256 colors
let base16colorspace=256
" Select the colorscheme
colorscheme base16-chalk
" Enable highlighting
syntax on

" }}}
" AutoCommand groups {{{

augroup configgroup
    autocmd!
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup END

" }}}
" Functions {{{

" Strips trailing whitespace at the end of files. This is called on buffer
" write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" }}}

" vim:foldmethod=marker:foldlevel=0

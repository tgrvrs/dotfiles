set nocompatible " vim, not vi!

" required Vundle setup
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'Raimondi/delimitMate'
Plugin 'StanAngeloff/php.vim'
Plugin 'bling/vim-airline'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'davidhalter/jedi-vim'
"Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'hdima/python-syntax'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'kien/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/Css-Pretty'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'Shougo/neocomplete.vim'
call vundle#end()
filetype plugin indent on

language en_US.utf8
let &termencoding=&encoding

set autoindent                              " Copy indent from current line when starting a new line
set backspace=2                             " Backspace over autoindent, linebreaks and start of insert
" set colorcolumn=80                        " a comma separated list of screen columns that are highlighted with ColorColumn
set completeopt=longest,menuone             " Completion options for CTRL-P/CTRL-N
" set cursorline                              " Enable the highlighting of the active line (only used for the linenumber, see bottom)
set encoding=utf-8                          " Sets the character encoding used inside Vim
set expandtab                               " Use the appropriate number of spaces to insert a Tab
set fileencoding=utf-8                      " Sets the character encoding for the file of this buffer
set fileformat=unix                         " This gives the <EOL> of the current buffer (UNIX: <NL>)
set formatoptions=ro
set formatoptions-=t
set hidden                                  " Hide a buffer when it is abondoned
set ignorecase                              " Ignore case when searching
set incsearch                               " Search whilst typing
set laststatus=2                            " Force a statusline (even for a single window
set lazyredraw                              " Improve performance when running macros
set linebreak                               " Automatically break to the next line if the length of the exceeeds textwidth
set list                                    " Enable list mode (characters for tabs, spaces and line-endings)
set listchars=tab:»·,trail:·,eol:¬          " Specify other characters for certain list-items
set modeline
set noerrorbells
set nofoldenable
set nohlsearch                              " Disable highlighted search by default
set novisualbell
set nowrap                                  " Don't wrap text by default
set number                                  " Show linenumbers
set numberwidth=6                           " Width for the linenumber section
set scrolljump=5
set scrolloff=3
set shiftround                              " Round identspaces to multitudes of shiftwidth
set shiftwidth=4
set showmatch                               " When the cursor is on a matchable item (ie parenthesis), highlight the matching item
set shortmess=atI
set smartcase                               " When searching for a string that contains uppercase, ignore the ignorecase option
set smartindent                             " Used with autoindent; indents a step further when using { or (
set softtabstop=4
set splitbelow
set splitright
" set statusline=%F%m%r%h%w\ (%04l/%04L)%=[FORMAT=%{&ff}]
" \ [TYPE=%Y]\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}
set synmaxcol=255                           " Halt syntax highlighting if the line exceeds 255 chars
set noshowmode                              " Hide active mode from the statusline
set tabstop=4                               " Number of spaces that a <Tab> in the file counts for
set title
set textwidth=79
set t_Co=256                                " enable 256 colors
set wildmode=list:longest
set wildmenu

" rebind <Leader> key
let mapleader = ","

vnoremap <Leader>s :sort<CR>                " map sort function to a key
vnoremap < <gv  " better indentation        " easier moving of code blocks
vnoremap > >gv  " better indentation

" easier moving between tabs
" map <Leader> <esc>:bp<CR>
map <Leader><space> <esc>:bn<CR>
map <Leader>n <esc>:bp<CR>
map <Leader>m <esc>:bn<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-n> :set number!<CR>
map <c-l> :set list!<CR>

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

set runtimepath+=~/.vim/custom

runtime! custom/airline.vim
runtime! custom/ctrlp.vim
runtime! custom/expandregion.vim
runtime! custom/indentguides.vim
runtime! custom/nerdtree.vim
runtime! custom/syntastic.vim
runtime! custom/virtualenv.vim
runtime! custom/jedi-vim.vim
" runtime! custom/supertab.vim
runtime! custom/neocomplete.vim

" runtime! custom/*.vim
runtime macros/matchit.vim

colorscheme Tomorrow-Night-Bright
syntax on

function TrimWhiteSpace()
    %s/\s\+$//e
    ''
:endfunction

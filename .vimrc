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
Plugin 'ervandew/supertab'
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
call vundle#end()
filetype plugin indent on

runtime macros/matchit.vim

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

" nerdtree
map <c-o> :NERDTreeToggle<CR>
map <c-i> :IndentGuidesToggle<CR>
let g:NERDTreeIgnore = ['\.pyc$']

" vim-indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=blue
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkblue

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = "tomorrow"

function! AirlineInit()
    "let g:airline_section_a = airline#section#create(["mode"])
    "let g:airline_section_b = airline#section#create(["branch"])
    let g:airline_section_c = airline#section#create(["%f"])
    "let g:airline_section_x = airline#section#create(["fenc"])
    "let g:airline_section_y = airline#section#create(["filetype"])
    let g:airline_section_z = airline#section#create(["%l:%L (%p%%)"])
endfunction
autocmd VimEnter * call AirlineInit()

" ctrlp
let g:ctrlp_by_filename = 0
let g:ctrlp_regexp = 1
let g:ctrlp_max_height = 10
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
                \ }
endif

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1

" virtualenv
let g:virtualenv_auto_activate = 1

" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" jedi-vim (disable by default)
let g:jedi#auto_initialization = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = ""
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" autocmd VimEnter,Colorscheme * :hi ColorColumn ctermbg=darkblue
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=blue
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkblue

let b:python_version_2 = 1

colorscheme Tomorrow-Night-Bright
syntax on

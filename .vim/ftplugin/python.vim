set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

" jedi-vim
let g:jedi#auto_initialization = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures = 0
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#popup_on_dot = 0

autocmd FileType python setlocal completeopt-=preview

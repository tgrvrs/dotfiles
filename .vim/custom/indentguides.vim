let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=blue
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkblue

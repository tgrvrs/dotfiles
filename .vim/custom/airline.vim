let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = "tomorrow"

function! AirlineInit()
    "let g:airline_section_a = airline#section#create(["mode"])
    "let g:airline_section_b = airline#section#create(["branch"])
    let g:airline_section_c = airline#section#create(["%F"])
    "let g:airline_section_x = airline#section#create(["fenc"])
    "let g:airline_section_y = airline#section#create(["filetype"])
    let g:airline_section_z = airline#section#create(["%l:%L (%p%%)"])
endfunction
autocmd VimEnter * call AirlineInit()

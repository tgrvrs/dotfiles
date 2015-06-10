let g:ctrlp_by_filename = 0
let g:ctrlp_regexp = 1
let g:ctrlp_max_height = 10
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_use_caching = 0

let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard && echo "$(basename `pwd`)/settings/local.py"'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabLongestHighlight = 1

autocmd FileType python set omnifunc=jedi#completions

" &completefunc:<c-x><c-u>",

" set omnifunc=syntaxcomplete#Complete
"au FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" set completeopt=menu
"" to do text select via j/k
" inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
" inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

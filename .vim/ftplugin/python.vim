" set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

autocmd BufWritePre *.py :call TrimWhiteSpace()

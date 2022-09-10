setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal conceallevel=0

" autocmd!
inoremap { {<CR>}<Esc>O
inoremap [ [<CR>]<Esc>O
packadd vim-json
let g:vim_json_syntax_conceal=0

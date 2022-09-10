setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
let python_hightlight_all = 1
set expandtab

packadd vim-flake8
map <buffer> <F8> :call flake8#Flake8()<CR>

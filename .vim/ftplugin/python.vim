setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
set expandtab

packadd black
packadd vim-flake8

let g:black_virtualenv = '~/.local/pipx/venvs/black'
let g:black_linelength = 79
let g:black_quiet = 1

" :cmdname
"   1 = match
"   2 = math with cmd
"   3 = match several commands
if exists(":Black")
  " autoformat python files
  autocmd BufWritePre,FileWritePre *.py :Black
endif

" Lint against pep8 style rules
map <buffer> <F8> :call flake8#Flake8()<CR>

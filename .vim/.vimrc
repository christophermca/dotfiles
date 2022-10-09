" AUTHOR: Christopher MCA
" Version: 1.0
" Sections:
"
" Plugins
"=============================================================================
" Vim >= 7.0 specific colors
" compatibility
set nocompatible

set fileformat=unix
set textwidth=80
set formatoptions=cq
set backspace=indent,eol,start
filetype plugin indent on
syntax enable " enable syntax processing
set autoindent
set t_Co=256

if &term =~ '256color'
  set t_ut=
endif

set background=dark

" if spsy is set try and use it
if exists("$spsy")
  let g:SpeysideDefaultLuminence = $spsy
else
  let g:SpeysideDefaultLuminence = 2
endif

let g:SpeysideMode="$HOME/.config/theme-switcher/mode"
colorscheme speyside
set cursorline

" nodejs suffix help
set suffixesadd=.js,.jsx,.ts,.tsx,.styl,.css

" fix slow escape in iterm2
set ttimeout
set notimeout
set ttimeoutlen=20
" AUTOCMDS {{{
 set autoread
 autocmd BufWritePre * :silent! :call <SID>Respace()

 augroup checkfileupdate
   autocmd WinEnter * :silent :checktime
 augroup END

 augroup vimrc_autocmds
   autocmd!
   autocmd BufEnter * match ErrorMsg /\%120v.\+/
 augroup END

 augroup reload_vimrc
   autocmd!
   autocmd bufwritepost $myvimrc source $myvimrc
 augroup end

 augroup FiletypeGroup
   autocmd!
   au bufread,bufnewfile *.cson set filetype=coffee
   au bufread,bufnewfile *.json set filetype=json
   au bufread,bufnewfile *.styl set filetype=stylus
 augroup END
"}}}
" FONTS  {{{
"=====================================================================

" choose font by gui
if has("gui_running")
if has("gui_gtk2")
  set guifont=Inconsolata\ 12
elseif has("gui_macvim")
  set guifont=Menlo\ Regular:h12
elseif has("gui_win32")
  set guifont=Consolas:h10:w4:cANSI
endif
endif

" }}}
" VIM UI {{{
"=====================================================================
" error notification `bells` {{{
set visualbell " set error flashing
set noerrorbells " no beeping
"}}}
" splits {{{
set splitbelow
set splitright
"}}}
" backups {{{
set nobackup " No backup files
set nowritebackup " Only in case you don't want a backup file while editing
set noswapfile " No swap files
"}}}
" saving {{{
set confirm " Confirm if you want to save
set hidden " Allow buffer switching without saving
" }}}
set viewoptions=folds,options,cursor,unix,slash " Better Unix Windows compatibility
set virtualedit=all " Allow for cursor beyond last character
set history=1000 " Store a ton of history (default is 20)
set tabpagemax=15 " Only show 15 page tabs
set showmode " Display the current mode
set linespace=0 " No extra spaces between rows
set nowrap " Do not wrap long lines
set scrolloff=1 " Minimum lines to keep above and below cursor
set ttyscroll=3 " Workaround for gvim screen redraw issues
"set lazyredraw " Redraw only when we need to
"
" window {{{
" gui {{{
" ****************
" go: GUI OPTIONS
" +: show
" -: hide
" ****************
set go-=T " Toolbar
set go-=m " Menu
set go-=l " Hide left sroll bar
set go-=L " Hide left scroll bar in split
set go-=R " Hide right scroll bar
set go-=r " Hide right scroll bar in split
"}}}
" size {{{
if has("gui_running")
  " GUI is running or is about to start.
  set lines=999 columns=999
endif

" For windows - sets the window to max size
if has("gui_running")
  if has("gui_win32")
    augroup GUIEnter * simalt ~x
  endif
endif
"}}}
"}}}
" spaces & tabs {{{
set tabstop=2 " Number of visual spaces per tab
set shiftwidth=2
set softtabstop=2 " Number of spaces in tab when editing
set expandtab " Tabs are spaces

"Show hidden chars
set lcs=tab:>-,trail:-
" set listchars=tab:«-»,
" set listchars=tab:«-»,trail:·
"}}}
" status bar + command line {{{
" ****************
set showcmd " Show command line in bottom bar
set wildmenu " Visual autocomplete for command menu

highlight Visual guibg=#333345

if has('statusline')
  set laststatus=2
  set statusline+=%{fugitive#statusline()} " Git status (courtesy of fugitive)

  " Broken down into easily includeable segments
  set statusline=%f%<\ " Filename
  set statusline+=[%{&ff}/%Y]\ " Filetype
  set statusline+=\[%{getcwd()}]%= " Current dir
  set statusline+=%w%h%m%r\ " Options
  set statusline+=%<%-14(%l,%c%V%)\ %p%% " Right aligned file nav info ruler
endif
"}}}
"line numbers {{{
set number " show line numbers
set nuw=4
"}}}
" mouse {{{
set mouse=vh " Automatically enable mouse usage
set mousehide " Hide the mouse cursor while typing
"}}}
" searching {{{
set ic " Ignorecase
set smartcase
set incsearch " Search as characters are entered
set hlsearch " Highlight matches
set magic
"}}}
" folding {{{
" ****************
set foldenable " Enable folding
set foldmethod=indent
set foldlevel=99

let g:SimpylFold_docstring_preview = 1
"}}}
"}}}
" MAPPING {{{
"=====================================================================

" ____Leader mappings
let mapleader="\<Space>"

" __Directory
" Change directory to current edited files directory
nmap <leader>cd :cd %:p:h<CR>

" ____Resizing
nmap <tab>h :vert res -10<CR>
nmap <tab>l :vert res +10<CR>
nmap <tab>k :resize +10<CR>
nmap <tab>j :resize -10<CR>


" Tab shortcuts
nmap <leader>nt :tabnew<CR>

" Close tab
nmap <leader>xt :tabc<CR>

" View Buffer list
nnoremap <leader>l :ls<CR>:b<space>

" Quick change directory

"JSON prettyify and validate
com! FormatJSON '<,'>!python -m json.tool
map <leader>jn :FormatJSON<cr>

map <leader>de :'<,'>!python -m base64 -d<CR>

" Searching
nnoremap <silent> \<leader> :nohlsearch<CR>

" Increment/decrement
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" ****************
" X11 terminal copy/paste
" ****************

" Copy/paste to system clipboard

set clipboard=unnamed
vmap <leader>y "+y
vmap <leader>yy "+yy
vmap <leader>Y "+Y
vmap <leader>yw "+yw
vmap <leader>yb "+yb
vmap <leader>D "+D
vmap <leader>p "+p
vmap <leader>P "+P

nmap <leader>y "+y<cr>
nmap <leader>yy "+yy<cr>
nmap <leader>Y "+Y<cr>
nmap <leader>yw "+yw<cr>
nmap <leader>yb "+yb<cr>
nmap <leader>D "+D<cr>
nmap <leader>p "+p<cr>
nmap <leader>P "+P<cr>

nmap <leader>cp :let @+ = expand("%")<cr>


map <leader>ag :Ack<Space>

" Saving
map <leader>w :w<CR>

" Vimrc
nmap <silent> <leader>vr :vsplit $MYVIMRC<CR>

" Edit colorscheme
nmap <leader>ec :call ToggleColorEdit()<CR>

" Coffee

" Mocha
nmap <leader>r :call <SID>MochaTest()<CR>
nmap <leader>e :call <SID>MochaDebugTest()<CR>
nmap <silent> <leader>1 :call <SID>Console()<CR>
nmap <silent> <leader>o :call <SID>Focus()<CR>

" ____SPLIT CONTROLS
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j

nnoremap - :call <SID>OpenView()<CR>
"}}}
" {{{ FUNCTIONS
function! <SID>Focus()
  :mksession ~/session.vim<CR>
  :wincmd o<CR>
endfunction

function! <SID>Respace()
 let l = line(".")
 let c = col(".")
 %s#\s\+$##ge "Spacing at EOL
 nohlsearch
 call cursor(l, c)
endfunction

function! <SID>Console()
:!
endfunction

function! <SID>MochaDebugTest()
:!mocha debug %
endfunction

function! <SID>MochaTest()
:!clear && NODE_ENV=test mocha %
endfunction

function! ToggleColorEdit()
if !exists("g:editing_colors")
  let g:editing_colors = 1
  :vsplit ~/.vim/pack/colorschemes/start/speyside/colors/speyside.vim
  :so $VIMRUNTIME/syntax/hitest.vim
  :XtermColorTable
else
  unlet g:editing_colors
  :silent! :bd Highlight\ test | :bd */speyside.vim | :bd XtermColorTable
endif
endfunction

function! <SID>OpenView()
if isdirectory(expand("%:h"))
  :Ex %:h
else
  :Ex .
endif
endfunction
" }}}
" PLUGINS CONFIGS {{{
"=====================================================================
"

" YCM {{{
" let g:ycm_semantic_triggers['typescript'] = ['.']
" }}}

" AG - the silver searcher {{{
if executable('ag')
  let g:ackprg = "ag --vimgrep"
endif
" }}}

" NETRW {{{
let g:netrw_preview = 1
let g:netrw_liststyle = 0
let g:netrw_list_hide= '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_banner = 0
let g:netrw_localrmdir = "rm -r"
let g:netrw_bufsettings = "noma nomod nonumber nobuflisted nowrap readonly relativenumber"
" }}}

"Async Linting Engine (ALE) {{{
let g:ale_fixers = {
    \'*': ['remove_trailing_lines', 'trim_whitespace'],
    \'stylus': ['prettier', 'stylelint'],
    \'scss': ['prettier','stylelint'],
    \'javascript': ['prettier', 'eslint'],
    \'typescript':['prettier', 'eslint'],
    \'css':['prettier', 'stylelint'],
    \}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" Edit Error and Warning Highlighting
let g:ale_sign_warning='~'
hi ALEErrorSign ctermfg='red' ctermbg=none

let g:ale_sign_error='>'
hi ALEWarningSign ctermfg='yellow' ctermbg=none
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
"}}}

" speyside {{{
if maparg('<leader>gl', 'n') ==# ''
xmap <leader>gl  <plug>Speyside
vmap <leader>gl  <plug>Speyside
nmap <leader>gl  <plug>Speyside
omap <leader>gl  <plug>Speyside
endif

if maparg('<leader>gt', 'n') ==# ''
xmap <leader>gt  <plug>ToggleLuminance
vmap <leader>gt  <plug>ToggleLuminance
nmap <leader>gt  <plug>ToggleLuminance
omap <leader>gt  <plug>ToggleLuminance
endif

if maparg('<leader>gc', 'n') ==# ''
xmap <leader>gc  <plug>CycleLuminance
vmap <leader>gc  <plug>CycleLuminance
nmap <leader>gc  <plug>CycleLuminance
omap <leader>gc  <plug>CycleLuminance
endif
"}}}

" FZF {{{
set rtp+=/home/.config/theme-switcher/mode,
nmap <f7> :FZF <CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
"}}}


" vim: fdm=marker foldlevelstart=-1 foldlevel=0 foldminlines=1

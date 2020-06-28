" ----------------------
" General Configurations
" ----------------------
set nocompatible " not vi compatible
syntax on " turn on syntax highlighting
set showmatch " show matching braces when text indicator is over them
set nu " line numbers
set shortmess+=I " disable startup message
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set scrolloff=5 " show lines above and below cursor (when possible)
set backspace=indent,eol,start " allow backspacing over everything
set expandtab " use spaces in stead of tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set incsearch " incremental search (as string is being typed)
set ignorecase " case-insensitive search
set smartcase " smart search
set mouse+=a " enable mouse mode (scrolling, selection, etc)
set noerrorbells visualbell t_vb= " disable bell noise

" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" --------------
" NERD Commenter
" --------------
filetype plugin on

" ---
" Ale
" ---
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {'python': ['autopep8'], 'cpp': ['clang-format']}
let g:ale_linters = {'python': ['pylint']}

" ---------------
" Lightline + Ale Plugin
" ---------------
set laststatus=2

if !has('gui_running')
	set t_Co=256
endif

let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

let g:lightline.colorscheme = 'one'
let g:lightline.active = { 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ], [ 'fileformat', 'fileencoding', 'filetype'] ] }

" -----
" Final
" -----
packloadall

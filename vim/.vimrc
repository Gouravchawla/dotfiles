set nocompatible              " required
filetype off                  " required

" Leader - ( comma )
let mapleader = ","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'gmarik/Vundle.vim'
" For improved folding
Plugin 'tmhedberg/SimpylFold'
" For python auto indentation
Plugin 'vim-scripts/indentpython.vim'
" Autocomplete
Plugin 'Valloric/YouCompleteMe'
" Syntax checking/Highlighting
Plugin 'vim-syntastic/syntastic'
" PEP8 checking
Plugin 'nvie/vim-flake8'
" Color Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Search
Plugin 'kien/ctrlp.vim'
" Git
Plugin 'tpope/vim-fugitive'
" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" split navigations - Move between splits using Ctrl plus VIM movement
" keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Show docstring for folded code
let g:SimpylFold_docstring_preview=1


" Python PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Full stack indentation
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Flag extraneous whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use UTF8
set encoding=utf-8             

" YouCompleteMe options
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


let python_highlight_all=1
syntax on

" Color scheme flags
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" Searching
set ignorecase    " Case insensitive search
set smartcase     " If capital letter in search string then case sensitive search else case insensitive
set incsearch     " Show match while searching

" Tab switching
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Toggle paste mode when pasting code from system clipboard
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Switch between solarized dark and light
call togglebg#map("<F5>")

" NERDTree settings - ignores .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
map <leader>n :NERDTreeToggle<CR>

" Line numbering
set nu

" Toggle relative line number
nmap <C-L><C-L> :set invrelativenumber<CR>

" Clipboard
set clipboard=unnamedplus

" CtrlP
" When opening a file, if it's already open in a window somewhere, CtrlP will try
" to jump to it instead of opening a new instance
let g:ctrlp_switch_buffer = 'Et'

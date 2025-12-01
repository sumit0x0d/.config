if empty(glob('~/.vim/autoload/plug.vim'))
     silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'preservim/tagbar'
Plug 'simnalamburt/vim-mundo'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-fugitive'
call plug#end()

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

let g:gutentags_cache_dir = '~/.cache/vim/tags'
let g:gutentags_ctags_args = ['--languages=cpp,c,python', '--fields=+l']
let g:gutentags_generate_on_missing = 0
let g:gutentags_use_compdb = 0

nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>m :MundoToggle<CR>
nnoremap <leader>g :Git<CR>

let mapleader = " "

set autoindent
set background=dark
set colorcolumn=125
set nocompatible
set confirm
set cursorline
set encoding=utf-8
set expandtab
set fileformat=unix
set hlsearch
set ignorecase
set incsearch
set hidden
set laststatus=2
set list
set mouse=a
set nobackup
set number
set relativenumber
set ruler
set showcmd
set showmode
set shiftwidth=5
set signcolumn=yes
set softtabstop=5
set smartcase
set smarttab
set splitbelow
set splitright
set tabstop=5
set tags=./tags;/
set termguicolors
set undofile
set undodir=~/.vim/undo

nnoremap <leader>e :Ex<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <D-k> :m .-2<CR>==
nnoremap <D-j> :m .+1<CR>==

nnoremap <D-1> 1gt
nnoremap <D-2> 2gt
nnoremap <D-3> 3gt
nnoremap <D-4> 4gt
nnoremap <D-5> 5gt
nnoremap <D-6> 6gt
nnoremap <D-7> 7gt
nnoremap <D-8> 8gt
nnoremap <D-9> 9gt

let g:netrw_dirhistmax = 0
let g:netrw_sort_by = "name"
let g:netrw_sort_direction = "normal"
let g:netrw_liststyle = 1

" syntax on
filetype plugin indent on


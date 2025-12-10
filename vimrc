if empty(glob('~/.vim/autoload/plug.vim'))
     silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'preservim/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

let g:gutentags_cache_dir = '~/.vim/tags'
let g:gutentags_ctags_args = ['--languages=cpp,c,python', '--fields=+l']
let g:gutentags_generate_on_missing = 0
let g:gutentags_use_compdb = 0

let mapleader = " "

nnoremap tt :TagbarToggle<CR>
nnoremap tu :UndotreeToggle<CR>

let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1

let g:ale_virtualtext_cursor = 0
" let g:ale_virtualtext = 0
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gr :ALEFindReferences<CR>
nnoremap gi :ALEGoToImplementation<CR>


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

nnoremap <leader>e :Explore<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>q :quit<CR>

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

syntax on
filetype plugin indent on


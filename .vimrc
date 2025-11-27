syntax on

set autoindent
set background=dark
set colorcolumn=125
set cursorline
set encoding=utf-8
set expandtab
set fileformat=unix
set hlsearch
set ignorecase
set incsearch
set hidden
set laststatus=2
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
colorscheme quite

filetype plugin indent on

let mapleader = " "

nnoremap <leader>e :Ex<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

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

if 1
     if empty(glob('~/.vim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
     endif

     call plug#begin('~/.vim/plugged')
     Plug 'airblade/vim-gitgutter'
     Plug 'morhetz/gruvbox'
     Plug 'preservim/tagbar'
     Plug 'sheerun/vim-polyglot'
     Plug 'tpope/vim-fugitive'
     call plug#end()

     colorscheme gruvbox
     nnoremap <leader>t :TagbarToggle<CR>
     nnoremap <leader>g :Git<CR>
endif

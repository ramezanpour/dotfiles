set history=700
set title
set wildmenu
set ruler
set hlsearch
set showmatch
set noerrorbells
set novisualbell
set nocompatible
set exrc
set secure
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set encoding=utf8
set nobackup
set noswapfile
set nowb
set autoread
set ignorecase
set smartcase
set timeoutlen=2000
set background=dark
set backspace=2
set smarttab
set showcmd
set scrolloff=3
set ttyfast

set wildmenu


colorscheme evening

set ai
set si
set wrap
set number 

let mapleader=','

map <C-t> :tabnew<CR> 
map <S-Tab> :tabn<CR>

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'edsono/vim-matchit'
Plugin 'tpope/vim-fugitive'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'davidhalter/jedi-vim'
call vundle#end()

syntax on
filetype on
filetype indent on
filetype plugin indent on

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

cmap Wq wq
cmap WQ wq
cmap wQ wq

nnoremap <F12> :YcmCompleter GoTo<CR>

let g:ctrlp_map = '<c-p>'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

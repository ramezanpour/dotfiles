" Setting the leader
let mapleader=','

" General settings
set mouse=a
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
set ai
set si
set wrap
set number 

" Tabs
map <C-t> :tabnew<CR> 
map <S-Tab> :tabn<CR>

" Vungle
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
Plugin 'chankaward/vim-railscasts-theme'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
call vundle#end()

" Color and syntax highlighting
colorscheme railscasts 
syntax on
filetype on
filetype indent on
filetype plugin indent on

" Split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Fix unexpected typos
cmap Wq wq
cmap WQ wq
cmap wQ wq

" Jump to definition wit F12
nnoremap <F12> :YcmCompleter GoTo<CR>

" Plugin settings
let g:ctrlp_map = '<c-p>' " Ctrl-P toggle
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' " Default YCM config path
let g:cpp_class_scope_highlight = 1 " CPP enhanced highlighting config for scope highlighting
let g:cpp_experimental_template_highlight = 1 " CPP enhanced for template highlighting
"let g:airline#extensions#tabline#enabled = 1 " Airline tab toggle
let g:airline_theme = 'dark' " Airline theme
let g:airline_powerline_fonts = 1 " Airline powerline symbols
set laststatus=2 " Show Airline powerline all the time

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>


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
set cursorline

" Tabs instead of spaces.
set noet ci pi sts=0 sw=4 ts=4

" Tabs
map <C-t> :tabnew<CR> 
map <S-Tab> :tabn<CR>

" Vungle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Bundle 'vim-ruby/vim-ruby'
call vundle#end()

" Color and syntax highlighting
colorscheme default
syntax on
filetype on
filetype indent on
filetype plugin on
"filetype plugin indent on " I have disabled this feature because some plugins had their own tab/space indention policies

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
"
" Nerd Tree
map <C-n> :NERDTreeToggle<CR>


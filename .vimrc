" Setting the leader
let mapleader=','

set nocompatible

" General settings
set title
set wildmenu
set ruler
set hlsearch
set showmatch
" No sound on errors
set noerrorbells
set novisualbell

set t_vb=
set tm=500
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set noswapfile
set autoread
set smartcase
set incsearch
set timeoutlen=2000
set backspace=2
set scrolloff=3
set ttyfast
set ai
set si
set wrap
set number 
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set background=dark


" Show invisible chars
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabn<cr>
map <leader>tp :tabp<cr>

" Vungle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'tell-k/vim-autopep8'
Plugin 'fatih/vim-go'
Plugin 'prettier/vim-prettier'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
call vundle#end()

" Color and syntax highlighting
filetype plugin indent on
syntax on
colorscheme Tomorrow-Night

" Split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Ctrl-P
let g:ctrlp_map = '<c-p>' 

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>
set secure

" YCM
"let g:ycm_extra_conf_globlist = ['~/projects/*']
"let g:ycm_autoclose_preview_window_after_completion = 1

" Autopep8
let g:autopep8_disable_show_diff = 1
let g:autopep8_on_save = 1
let g:airline_theme='tomorrow'


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

set tm=500
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set noswapfile " Do not create the swap file.
set autoread " Reread the file if it's modified outside the vim.
set ignorecase
set smartcase " Works only if ignorecase is set. ignores the case if all written in lowercase otherwise searches for case-sensitive options.
set incsearch " Shows search results as typing in search mode.
set backspace=2
set scrolloff=3 " Minimum number of screen lines to keep above and below the cursor.
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

" Show invisible chars
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabn<cr>
map <leader>tp :tabp<cr>

" Vungle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" The Vindle itself
Plugin 'VundleVim/Vundle.vim'
" Fuzzy search by pressing Ctrl-P
Plugin 'kien/ctrlp.vim'
" Comment/Uncomment tool
Plugin 'scrooloose/nerdcommenter'
" Switch to the begining and the end of a block by pressing %
Plugin 'tmhedberg/matchit'
" A Tree-like side bar for better navigation
Plugin 'scrooloose/nerdtree'
" A cool status bar
Plugin 'vim-airline/vim-airline'
" Airline themes
Plugin 'vim-airline/vim-airline-themes'
" Code auto-completion plugin
Plugin 'Valloric/YouCompleteMe'
" A collection of themes for vim
Plugin 'flazz/vim-colorschemes'
" Standardize Python code library for vim
Plugin 'tell-k/vim-autopep8'
" The Golang plugin
Plugin 'fatih/vim-go'
" Better syntax-highlighting for filetypes in vim
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

" Clipboard
set clipboard=unnamed

" YCM
"let g:ycm_extra_conf_globlist = ['~/projects/*']
let g:ycm_autoclose_preview_window_after_completion = 1

" Autopep8
let g:autopep8_disable_show_diff = 1
let g:autopep8_on_save = 1

" Airline
let g:airline_theme='tomorrow'


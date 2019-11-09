" Setting the leader
let mapleader=','

" General settings
set history=700
set colorcolumn=80
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
set nocompatible
set exrc
set secure
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set noswapfile
set nowb
set autoread
set ignorecase
set incsearch
set timeoutlen=2000
set background=dark
set backspace=2
set showcmd
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

" Show invisible chars
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

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
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
call vundle#end()

" Color and syntax highlighting
filetype plugin indent on
syntax on
colorscheme evening

" Split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Plugin settings
let g:ctrlp_map = '<c-p>' " Ctrl-P toggle

" YCM settings"
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' " Default YCM config path
let g:cpp_class_scope_highlight = 1 " CPP enhanced highlighting config for scope highlighting
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_python_binary_path = 'python3'
let g:ycm_min_num_of_chars_for_completion = 1

" Jedi VIM
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" Airline settings
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
" Airline
set laststatus=2 " Show Airline powerline all the time
" Nerd Tree
map <C-n> :NERDTreeToggle<CR>


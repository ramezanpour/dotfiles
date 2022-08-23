" Setting the leader
let mapleader=','

" General settings
set title
set wildmenu
set ruler
set hlsearch
set showmatch
" No sound on errors
set noerrorbells
set novisualbell

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
set colorcolumn=120
set mouse=a " Enable mouse for all modes.

" Show invisible chars
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Useful mappings for managing tabs
map <leader>te :tabedit<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabn<cr>
map <leader>tp :tabp<cr>

call plug#begin('~/.config/nvim/plugged')

Plug 'kien/ctrlp.vim'
" Comment/Uncomment tool
Plug 'scrooloose/nerdcommenter'
" A Tree-like side bar for better navigation
Plug 'scrooloose/nerdtree'
" A cool status bar
Plug 'vim-airline/vim-airline'
" Airline themes
Plug 'vim-airline/vim-airline-themes'
" The Golang plugin
Plug 'fatih/vim-go'
" Better syntax-highlighting for filetypes in vim
Plug 'sheerun/vim-polyglot'
" Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Git integration
Plug 'tpope/vim-fugitive'
" Auto-close braces and scopes
Plug 'jiangmiao/auto-pairs'
" Remove distraction from the screen when activated
Plug 'junegunn/goyo.vim'
" Show Git blame under the cursor
Plug 'rhysd/git-messenger.vim'
" Fuzzy search capability
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Better syntax highlighting for different programming languages
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Distraction-free writing
Plug 'junegunn/goyo.vim'
" Markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Nord theme
Plug 'arcticicestudio/nord-vim'
" Some fancy nerd icons 
Plug 'ryanoasis/vim-devicons'
Plug 'jasonccox/vim-wayland-clipboard'
call plug#end()

" Color and syntax highlighting
filetype plugin indent on
syntax on
set background=dark
colorscheme nord

" Split windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Ctrl-P
let g:ctrlp_map = '<c-p>' 

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " Show hidden files in NerdTree buffer.
set secure

" Clipboard
set clipboard+=unnamedplus

" Airline
let g:airline_theme='nord'
" User powerline symbols in Airline
let g:airline_powerline_fonts = 1



"COC

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Code action on <leader>a
vmap <leader>a <Plug>(coc-codeaction-selected)<CR>
nmap <leader>a <Plug>(coc-codeaction-selected)<CR>

" coc-related configuration
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>L
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd BufNewFile,BufRead *.tpl set filetype=yaml
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" go-vim
let g:go_imports_autosave = 1 " Auto add imports on save for Golang files.

let g:coc_global_extensions = [
  \ 'coc-spell-checker',
  \ 'coc-prettier',
  \ 'coc-git',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-markdownlint',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-go',
  \ 'coc-docker',
  \ 'coc-css',
  \ 'coc-clangd',
  \ 'coc-yaml'
  \ ]

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" FZF shortcuts
nnoremap <silent> <Leader>f :Ag<CR>

" Goyo configurations
let g:goyo_width = 120
" Vim Markdown
let g:vim_markdown_folding_disabled = 1

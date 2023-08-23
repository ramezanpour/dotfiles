" Setting the leader
let mapleader=','

set wrap
set mouse=a
set colorcolumn=120
set clipboard+=unnamedplus
set noswapfile
set autoread
set nobackup
set smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=2
set number
set noerrorbells
set novisualbell
set termguicolors
set cursorline

call plug#begin('~/.config/nvim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rhysd/git-messenger.vim'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nordtheme/vim'

call plug#end()

filetype plugin indent on
syntax on
colorscheme nord


"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
"set list



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

" go-vim
let g:go_imports_autosave = 1 " Auto add imports on save for Golang files.

" FZF shortcuts
nnoremap <silent> <Leader>f :Ag<CR>

" Coc configuration
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gv :vsplit<CR><Plug>(coc-definition)<C-W>L

" Code action on <leader>a
vmap <leader>a <Plug>(coc-codeaction-selected)<CR>
nmap <leader>a <Plug>(coc-codeaction-selected)<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Airline
let g:airline_theme='nord'
" User powerline symbols in Airline
let g:airline_powerline_fonts = 1

" Nord theme specific configs
let g:nord_cursor_line_number_background = 1
let g:nord_italic = 1
set background=dark

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
  \ 'coc-yaml',
  \ 'coc-sh',
  \ 'coc-highlight',
  \ ]

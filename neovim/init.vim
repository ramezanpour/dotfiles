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
set cursorline
set signcolumn=yes

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
call plug#end()

filetype plugin indent on
syntax on
set background=dark
colorscheme nord


set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list



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

" Coc configuration
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>L
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

vmap <leader>a <Plug>(coc-codeaction-selected)<CR>
nmap <leader>a <Plug>(coc-codeaction-selected)<CR>



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

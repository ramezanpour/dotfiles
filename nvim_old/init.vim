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

Plug 'ryanoasis/vim-devicons'

Plug 'rhysd/git-messenger.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nordtheme/vim'
Plug 'romainl/vim-cool'
Plug 'ap/vim-css-color'
Plug 'arcticicestudio/nord-vim'
call plug#end()

filetype plugin indent on
syntax on

" Nord theme specific configs
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_italic_comments = 1
set background=dark
colorscheme nord

" Split windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " Show hidden files in NerdTree buffer.

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1
    \ && exists('b:NERDTree') && b:NERDTree.isTabTree() | q | endif

" kill tab if only NERDTree is left
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree')
    \ && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+'
    \ && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() |
    \ buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

set secure

" Nerd commenter
let g:NERDCompactSexyComs = 1


" FZF shortcuts
nnoremap <silent> <Leader>f :Ag<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader><Space> :BLines<cr>


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
autocmd VimEnter * TSEnable highlight
" Treesitter settings
lua << EOF
require("nvim-treesitter.configs").setup({
    ensure_installed = { "javascript", "typescript", "lua", "vim", "json", "html", "go", "tsx", "python", "vimdoc" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
})
EOF


" Airline
let g:airline_theme='nord'

" User powerline symbols in Airline
let g:airline_powerline_fonts = 1


let g:coc_global_extensions = [
  \ 'coc-prettier',
  \ 'coc-git',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-markdownlint',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-docker',
  \ 'coc-css',
  \ 'coc-yaml',
  \ 'coc-sh',
  \ 'coc-highlight',
  \ ]

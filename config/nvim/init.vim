set nocompatible

syntax on
filetype plugin indent on

set ignorecase
set smartcase

set confirm
set noshowmode

set wildmenu
set wildignore=**/node_modues/**
set path+=**
set hidden

set number
set relativenumber
set nowrap

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set incsearch
set nohlsearch

set updatetime=50

set cmdheight=2

set noswapfile
set nobackup
set undodir=~/.config/.nvim/undodir
set undofile



call plug#begin('~/.config/.nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'

Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'gruvbox-community/gruvbox'

call plug#end()


set background=dark

"let g:solarized_termcolors=256
"colorscheme solarized

"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

colorscheme onedark

let mapleader=' '
let g:netrw_browse_split=0
let g:netrw_banner=0
let g:netrw_winsize=15
let g:netrw_liststyle=3

nnoremap Y y$

nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

nnoremap <leader>b :Lexplore<CR>

nnoremap <leader>ga :G<CR>
nnoremap <leader>gc :Gcommit<CR>



inoremap <silent><expr> <c-space> coc#refresh()


set nocompatible

syntax on
filetype plugin indent on
set termguicolors

set confirm
set noshowmode

set wildmenu
set hidden

set scrolloff=7
set number
set relativenumber
set nowrap

set colorcolumn=80

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set incsearch
set nohlsearch

set list
set listchars=tab:->,trail:·

set updatetime=50

set cmdheight=2

set noswapfile
set nobackup
let &undodir=stdpath('cache') . '/undodir'
set undofile


call plug#begin(stdpath('cache') . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

Plug 'baskerville/vim-sxhkdrc'

Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'

call plug#end()


"set background=dark
"colorscheme onedark

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox



lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.r_language_server.setup{}
lua require'lspconfig'.bashls.setup{}
lua require'lspconfig'.html.setup{}
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.clangd.setup{}


luafile ~/.config/nvim/lua/compe-config.lua


let mapleader=' '
let g:netrw_browse_split=0
let g:netrw_banner=0
let g:netrw_winsize=15
let g:netrw_liststyle=3
let g:netrw_dirhistmax=0


nnoremap Y y$

nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

nnoremap <leader>b :Lexplore<CR>

nnoremap <leader>g :G<CR>

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-space> <cmd>lua vim.lsp.buf.signature_help()<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

autocmd BufWritePre * %s/\s\+$//e

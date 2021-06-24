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

set textwidth=80
set colorcolumn=80

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set incsearch
set ignorecase
set smartcase
set nohlsearch

set list
set listchars=tab:>>,trail:·

set updatetime=50

set shortmess+=c

set cmdheight=1

set noswapfile
set nobackup
let &undodir=stdpath('cache') . '/undodir'
set undofile


call plug#begin(stdpath('cache') . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'hoob3rt/lualine.nvim'

Plug 'tpope/vim-fugitive'
"Plug 'lewis6991/gitsigns.nvim'

Plug 'skywind3000/asyncrun.vim'

Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'folke/tokyonight.nvim'

call plug#end()


"set background=dark
"colorscheme onedark

"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

colorscheme tokyonight


lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.r_language_server.setup{}
lua require'lspconfig'.bashls.setup{}
lua require'lspconfig'.html.setup{}
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.clangd.setup{}


luafile ~/.config/nvim/lua/compe-config.lua
luafile ~/.config/nvim/lua/telescope-config.lua
luafile ~/.config/nvim/lua/lualine-config.lua
luafile ~/.config/nvim/lua/treesitter-config.lua


let g:nvim_tree_indent_markers = 1
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }


let mapleader=' '

"let g:netrw_browse_split=0
"let g:netrw_banner=0
"let g:netrw_winsize=15
"let g:netrw_liststyle=3
"let g:netrw_dirhistmax=0


nnoremap Y y$

nnoremap <leader>y "+y
vnoremap <leader>y "+y

nnoremap <leader>p "+p
vnoremap <leader>p "+p

nnoremap <C-j> <cmd>cnext<CR>
nnoremap <C-k> <cmd>cprev<CR>

nnoremap <leader>b <cmd>NvimTreeToggle<CR>

nnoremap <leader>gs <cmd>Git<CR>
nnoremap <leader>gf <cmd>diffget //2<CR>
nnoremap <leader>gj <cmd>diffget //3<CR>

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> <C-Space> <cmd>lua vim.lsp.buf.signature_help()<CR>


inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

nnoremap <leader><C-m> <cmd>Telescope git_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

autocmd BufWritePre * %s/\s\+$//e

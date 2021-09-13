" general settings
set nocompatible
set termguicolors

" filetype settings
syntax on
filetype plugin indent on

" command mode settings
set cmdheight=1
set confirm
set noshowmode
set wildmenu

" buffer settings
set hidden

" line number settings
set scrolloff=7
set number
set relativenumber

" column settings
set nowrap
set textwidth=80
set colorcolumn=80

" indentation settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" search settings
set incsearch
set ignorecase
set smartcase
set nohlsearch

" show whitespace characters
set list
set listchars=tab:>>,trail:·

" lower cursorhover time
set updatetime=50


" disable autocomplete error message
set shortmess+=c

" use undofile instead of swapfile
set noswapfile
set nobackup
let &undodir=stdpath('cache') . '/undodir'
set undofile


call plug#begin(stdpath('cache') . '/plugged')

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'

    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'


    " fuzzy finder
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'


    " file tree
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'

    " status line
    Plug 'hoob3rt/lualine.nvim'

    " git tools
    Plug 'tpope/vim-fugitive'
    "Plug 'lewis6991/gitsigns.nvim'

    "Plug 'skywind3000/asyncrun.vim'

    " treesitter for better syntax highlighting
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " colorschemes
    Plug 'joshdick/onedark.vim'
    Plug 'gruvbox-community/gruvbox'
    Plug 'folke/tokyonight.nvim'

call plug#end()


"set background=dark
"colorscheme onedark

"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

colorscheme tokyonight


" set up language servers
lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.r_language_server.setup{}
lua require'lspconfig'.bashls.setup{}
lua require'lspconfig'.html.setup{}
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.clangd.setup{}


" plugin config
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


" make Y act move like D and C
nnoremap Y                  y$

" copy and paste from system clipboard
nnoremap <leader>y          "+y
vnoremap <leader>y          "+y

nnoremap <leader>p          "+p
vnoremap <leader>p          "+p

" quick fix list binds
nnoremap <C-j>              <cmd>cnext<CR>
nnoremap <C-k>              <cmd>cprev<CR>

" file tree bind
nnoremap <leader>b          <cmd>NvimTreeToggle<CR>

" git binds
nnoremap <leader>gs         <cmd>Git<CR>
nnoremap <leader>gf         <cmd>diffget //2<CR>
nnoremap <leader>gj         <cmd>diffget //3<CR>

" LSP binds
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD        <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> <C-Space> <cmd>lua vim.lsp.buf.signature_help()<CR>

" completion binds
inoremap <silent><expr>     <C-Space> compe#complete()
inoremap <silent><expr>     <CR>      compe#confirm('<CR>')
inoremap <silent><expr>     <C-e>     compe#close('<C-e>')

" fuzzy finder binds
nnoremap <leader><C-m>      <cmd>Telescope git_files<cr>
nnoremap <leader>ff         <cmd>Telescope find_files find_command=rg,--hidden,--files<cr>
nnoremap <leader>fg         <cmd>Telescope live_grep<cr>
nnoremap <leader>fb         <cmd>Telescope buffers<cr>
nnoremap <leader>fh         <cmd>Telescope help_tags<cr>

" trim trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

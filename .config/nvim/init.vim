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
set splitright

" line number settings
set scrolloff=7
set number
set relativenumber

" column settings
set nowrap
set textwidth=80
set colorcolumn=80

" indentation settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" search settings
set incsearch
set ignorecase
set smartcase
"set nohlsearch

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
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-vsnip'

    Plug 'ErichDonGubler/lsp_lines.nvim'

    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'


    " fuzzy finder
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope-file-browser.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'

    " file explorer
    Plug 'stevearc/oil.nvim'


    " icons
    Plug 'kyazdani42/nvim-web-devicons'

    " status line
    Plug 'nvim-lualine/lualine.nvim'

    " line indent marker
    Plug 'lukas-reineke/indent-blankline.nvim'

    " git tools
    Plug 'tpope/vim-fugitive'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'sindrets/diffview.nvim'

    Plug 'folke/trouble.nvim'
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
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
lua require('lspconfig').tsserver.setup{}
lua require('lspconfig').csharp_ls.setup{}
" lua require('lspconfig').r_language_server.setup{}
" lua require('lspconfig').bashls.setup{}
" lua require('lspconfig').html.setup{}
" lua require('lspconfig').pyright.setup{}
" lua require('lspconfig').clangd.setup{}

" set up gitsigns
lua require('gitsigns').setup()
lua require("oil").setup()

lua require("trouble").setup{}
lua require("lsp_lines").setup{}

" lua require("toggleterm").setup{ open_mapping=' t', direction='vertical', size=vim.o.columns *  0.4}

" plugin config
luafile ~/.config/nvim/lua/cmp-config.lua
luafile ~/.config/nvim/lua/telescope-config.lua
luafile ~/.config/nvim/lua/lualine-config.lua
luafile ~/.config/nvim/lua/treesitter-config.lua



let mapleader=' '

"let g:netrw_browse_split=0
"let g:netrw_banner=0
"let g:netrw_winsize=15
"let g:netrw_liststyle=3
"let g:netrw_dirhistmax=0


" copy and paste from system clipboard
nnoremap <leader>y          "+y
vnoremap <leader>y          "+y

nnoremap <leader>p          "+p
vnoremap <leader>p          "+p

" json format
nnoremap <leader>jq         <cmd>%!jq<CR>

" quick fix list binds
nnoremap <C-j>              <cmd>cnext<CR>
nnoremap <C-k>              <cmd>cprev<CR>

" file tree bind
nnoremap <leader>b          <cmd>Telescope file_browser<CR>

" git binds
nnoremap <leader>gs         <cmd>Git<CR>

" LSP binds
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD        <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>r         <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>l         <cmd>lua require('lsp_lines').toggle()<CR>
" nnoremap <silent> <C-Space> <cmd>lua vim.lsp.buf.signature_help()<CR>


" fuzzy finder binds
nnoremap <leader><CR>       <cmd>Telescope git_files<cr>
nnoremap <leader>ff         <cmd>Telescope find_files find_command=rg,--hidden,--files<cr>
nnoremap <leader>fg         <cmd>Telescope live_grep<cr>
nnoremap <leader>fb         <cmd>Telescope buffers<cr>
"nnoremap <leader>b          <cmd>Telescope file_browser<cr>
nnoremap <leader>b          <cmd>Oil<cr>
nnoremap <leader>fh         <cmd>Telescope help_tags<cr>
nnoremap <leader>gb         <cmd>Telescope git_branches<cr>

" trim trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

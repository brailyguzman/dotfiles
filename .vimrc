" ==============================================
" Plugin manager (vim-plug) setup
" ==============================================
call plug#begin('~/.vim/plugged')

" Modern colorscheme - OneDark
Plug 'joshdick/onedark.vim'

" Status bar plugin
Plug 'itchyny/lightline.vim'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Other useful plugins can be added here

call plug#end()

" ==============================================
" General Settings
" ==============================================
" Enable syntax highlighting
syntax on

" Enable term colors (true colors)
set termguicolors

" Show line numbers and relative line numbers
set number
set relativenumber

" Tabs and indentation
set tabstop=4
set shiftwidth=4
set expandtab

" Indentation settings
set autoindent
set smartindent
set cindent

" Search settings
set ignorecase        " Ignore case in search
set smartcase         " Override ignorecase if search contains capital letters
set nohlsearch        " Don't highlight search results after search is done
set incsearch         " Highlight matches while typing

" Disable swap file and backups
set noswapfile
set nobackup

" Scrolling settings
set scrolloff=8       " Keep 8 lines visible when scrolling

" Clipboard: use system clipboard
set clipboard=unnamedplus

" Whitespace settings: automatically remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Better command completion
set wildmenu

" Folding: enable code folding based on syntax
set foldmethod=syntax
set foldlevelstart=99  " Start with folds open by default

" ==============================================
" UI Enhancements
" ==============================================
" Use the OneDark colorscheme
colorscheme onedark

" Status bar: Enable lightline for better visibility
set laststatus=2
set noshowmode   " Don't display mode, lightline does it
let g:lightline = { 'colorscheme': 'onedark' }

" ==============================================
" Performance Tweaks
" ==============================================
" Faster redraw
set lazyredraw

" Reduce timeout for mapped sequences
set timeoutlen=300

" ==============================================
" Additional Optional Settings
" ==============================================
" Mouse support
set mouse=a           " Enable mouse in all modes

" Prevent bad line breaks
set linebreak

" Transparent .vimrc
highlight Normal guibg=NONE ctermbg=NONE

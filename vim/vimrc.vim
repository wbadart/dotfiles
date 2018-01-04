"""
" vimrc.vim
"
" Primary vim configuration.
"
" Will Badart <wbadart@live.com>
" created: DEC 2017
"""

call plug#begin()
Plug 'tomasr/molokai'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme molokai

set hlsearch
set nocompatible
set noswapfile
set number
set relativenumber
set wildmenu

set expandtab
set shiftwidth=4
set smarttab
set tabstop=4

inoremap jk <esc>
nnoremap J 5j
nnoremap K 5k

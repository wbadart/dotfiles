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

set nocompatible
set number
set relativenumber
set wildmenu
set hlsearch

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

inoremap jk <esc>
nnoremap J 5j
nnoremap K 5k

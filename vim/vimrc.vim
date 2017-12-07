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
call plug#end()

colorscheme molokai

set nocompatible
set number
set relativenumber
set wildmenu

inoremap jk <esc>
nnoremap J 5j
nnoremap K 5k

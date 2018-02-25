"""
" vimrc.vim
"
" Primary vim configuration.
"
" Will Badart <wbadart@live.com>
" created: DEC 2017
"""

call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'tomasr/molokai'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
call plug#end()

source $HOME/.vim/resources/plugin.conf.vim


colorscheme molokai
let mapleader = ','

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

set scrolloff=5

inoremap jk <esc>
nnoremap J 5j
nnoremap K 5k
nnoremap s :set spell!<cr>

nnoremap <leader>html :read $HOME/.vim/snippets/html5.html<cr>ggdd5jwcit

highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+\(\%#\)\@!$/
function! StripTailingWhitespace()
    normal! mm
    %s/\s\+$//e
    normal! `m
endfunction
command! StripTailingWhitespace call StripTailingWhitespace()

autocmd BufWritePre * StripTailingWhitespace
autocmd BufNewFile,BufReadPost *.py set colorcolumn=79

command! WW w !sudo tee %
abbreviate pydebug from pudb import set_trace<cr>set_trace()

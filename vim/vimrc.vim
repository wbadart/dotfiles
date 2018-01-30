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
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
call plug#end()

colorscheme molokai
let mapleader = ','
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

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

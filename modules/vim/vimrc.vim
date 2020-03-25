"""
" vimrc.vim
"
" Primary vim configuration.
"
" Will Badart <wbadart@live.com>
" created: DEC 2017
"""

" =======
" Plugins
" =======

call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/gv.vim'
Plug 'kien/ctrlp.vim'
Plug 'lervag/vimtex'
Plug 'mattn/emmet-vim'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
call plug#end()


" ================
" General settings
" ================

set cursorline
set foldlevel=99
set hlsearch
set ignorecase
set incsearch
set linebreak
set nocompatible
set noswapfile
set number
set relativenumber
set scrolloff=5
set smartcase
set wildmenu

set expandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4


" ==============
" Theme & colors
" ==============

colorscheme molokai
highlight Folded ctermbg=None
highlight LineNr ctermbg=None ctermfg=238

highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+\(\%#\)\@!$/
function! StripTailingWhitespace()
    normal! mm
    %s/\s\+$//e
    normal! `m
endfunction


" ============================
" Key bindings & abbreviations
" ============================

let mapleader = ','

" Navigation
inoremap jk <esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Misc
nnoremap s :set spell!<cr>
nnoremap <leader>go :Goyo 83<cr>:set number relativenumber<cr>
nnoremap <space> za
abbreviate pydebug from pudb import set_trace<cr>set_trace()


" =======================
" Auto- & custom commands
" =======================

autocmd BufWritePre * call StripTailingWhitespace()
autocmd BufNewFile,BufReadPost *.py set fileformat=unix foldmethod=indent
autocmd BufNewFile,BufReadPost *.{md,tex} set colorcolumn=69 tw=69 spell
autocmd BufNewFile,BufReadPost *.{py,hs} set colorcolumn=79
autocmd BufNewFile,BufReadPost *.y{a,}ml set tabstop=2 shiftwidth=2
autocmd BufNewFile,BufReadPost COMMIT_EDITMSG set spell
autocmd BufNewFile,BufReadPost Jenkinsfile set filetype=groovy

command! WW w !sudo tee %


" ====================
" Plugin customization
" ====================

" w0rp/ale
nnoremap <leader>n :ALENextWrap<cr>
nnoremap <leader>p :ALEPreviousWrap<cr>

" kien/ctrlp.vim
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set t_Co=256

" vimtex
 let g:vimtex_view_method = 'skim'

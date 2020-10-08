colorscheme molokai
set expandtab
set hidden nobackup nowritebackup noswapfile
set number relativenumber scrolloff=5
set ignorecase smartcase hlsearch incsearch wildmenu
autocmd BufNewFile,BufReadPost *.{md,tex} set colorcolumn=79 tw=79 spell
autocmd BufNewFile,BufReadPost *.{hs} set colorcolumn=100 ts=2 sw=2
autocmd BufNewFile,BufReadPost, *.{sh,bash} set ts=2 sw=2
autocmd BufNewFile,BufReadPost COMMIT_EDITMSG set spell
let g:netrw_liststyle=3  " tree
let mapleader = ','
let g:tex_flavor = 'latex'
inoremap jk <Esc>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <Leader><Leader> :G<CR>
nnoremap <C-P> :GFiles<CR>
nnoremap <C-T> :BTags<CR>

function! StripTrailingWhitespace()
    let l:winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(l:winview)
endfunction
autocmd BufWritePre * call StripTrailingWhitespace()

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
colorscheme molokai

set expandtab
set hidden nobackup nowritebackup noswapfile
set number relativenumber scrolloff=5
set ignorecase smartcase hlsearch incsearch wildmenu
autocmd BufNewFile,BufReadPost *.{md,tex,rst} set colorcolumn=79 tw=79 spell
autocmd BufNewFile,BufReadPost *.{hs} set colorcolumn=100 ts=2 sw=2
autocmd BufNewFile,BufReadPost *.{sh,bash} set ts=2 sw=2
autocmd BufNewFile,BufReadPost COMMIT_EDITMSG set spell
autocmd BufNewFile,BufReadPost *.stan set filetype=stan
let mapleader = ','
let g:netrw_liststyle=3  " tree
let g:tex_flavor = 'latex'
let g:neuron_dir = '~/Documents/zettelkasten'
inoremap jk <Esc>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <Leader><Leader> :G<CR>
nnoremap <C-P> :GFiles<CR>
nnoremap <C-T> :BTags<CR>
cmap w!! w !sudo tee > /dev/null %

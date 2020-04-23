call plug#begin()
Plug 'edkolev/tmuxline.vim'
Plug 'vito-c/jq.vim'
Plug 'hashivim/vim-terraform'
Plug 'airblade/vim-gitgutter'
Plug 'dag/vim-fish'
Plug 'flazz/vim-colorschemes'
Plug 'https://github.com/alok/notational-fzf-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim'
Plug 'kien/ctrlp.vim'
Plug 'lervag/vimtex'
Plug 'lnl7/vim-nix'
Plug 'michal-h21/vim-zettel'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovimhaskell/haskell-vim'
Plug 'psf/black'
Plug 'raichoo/purescript-vim'
" Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'vmchale/dhall-vim'
call plug#end()

set expandtab shiftwidth=0 tabstop=4
set hidden
set hlsearch incsearch
set noswapfile
set number relativenumber
set scrolloff=5
set smartcase
" set statusline^=%{coc#status()}
set wildmenu

colorscheme molokai
let g:airline_theme='minimalist'
let g:netrw_liststyle=3  " tree
let g:vimtex_view_method='skim'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
let localleader='\'
let maplocalleader = ","

inoremap jk <Esc>
inoremap jj <Esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>go :Goyo<cr>

autocmd BufNewFile,BufReadPost *.py set fileformat=unix foldmethod=indent
autocmd BufNewFile,BufReadPost *.{md,tex} set colorcolumn=79 tw=79 spell
autocmd BufNewFile,BufReadPost *.{py,hs} set colorcolumn=79
autocmd BufNewFile,BufReadPost *.{y{a,}ml,{ba,z,}sh,hs} set tabstop=2
autocmd BufNewFile,BufReadPost .dockerignore set filetype=conf
autocmd BufNewFile,BufReadPost COMMIT_EDITMSG set spell
autocmd BufNewFile,BufReadPost Dockerfile{.,-,_}* set filetype=dockerfile
autocmd BufNewFile,BufReadPost Jenkinsfile set filetype=groovy
autocmd BufNewFile,BufReadPost Vagrantfile set filetype=ruby

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

nnoremap  K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:zettel_format = "%y%V%u%file_no-%title"
let g:vimwiki_list = [ {'path':'~/Documents/Kasten/','ext':'.md','syntax':'markdown' } ]
let g:nv_search_paths = [ '~/Documents/Kasten' ]
nnoremap <silent> <c-s> :NV<CR>

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }
" let g:tmuxline_preset = 'lightline'

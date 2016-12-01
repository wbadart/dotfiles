"""
" .vimrc
"
" Plugins and configuration for this user's
" Vim distribution.
"
" Will Badart
" SEP 2014
"""

" If you're behind an HTTP proxy, you may need to add --insecure option to the
" curl command. In that case, you also need to set $GIT_SSL_NO_VERIFY to true.
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin("~/.vim/bundle")

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'bling/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'tomasr/molokai'
Plug 'othree/html5.vim'
Plug 'shougo/vimproc.vim', {'do': 'make'} | Plug 'shougo/vimshell.vim'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-indent'

call plug#end()

set nocompatible
set wildmenu
set showcmd
set incsearch
set hlsearch
set complete+=kspell
set path+=**
set tags+=./.tags,.tags

set number
set relativenumber
hi LineNr ctermfg=darkgray
colorscheme molokai

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set laststatus=2
set scrolloff=5

imap jk <Esc>
nmap H <Home>
nmap J 5j
nmap K 5k
nmap L <End>

nmap <leader>rl :source %<cr>:noh<cr>
nmap ,html :-1read $HOME/.vim/snippets/html5.html<cr>3jwf>a
command! MakeTags !ctags -f ".tags" -R .

highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+\(\%#\)\@!$/
function! StripTailingWhitespace()
    normal! mm
    %s/\s\+$//e
    normal! `m
endfunction
command! StripTailingWhitespace call StripTailingWhitespace()
autocmd BufWritePost * StripTailingWhitespace

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.rb set sw=2 sts=2 et
autocmd BufNewFile,BufReadPost *.{md,html} set spell

nmap <leader>gd :Gdiff<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit -v<cr>

nmap <leader>n :NERDTreeTabsToggle<cr>
nmap <leader>` :VimShellPop<cr>


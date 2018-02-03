"""
" vim/resources/plugin.conf.vim
"
" Plugin-specific configuration options.
"
" Will Badart <wbadart@live.com>
" created: FEB 2018
"""


" ===============
" kien/ctrlp.vim
" ===============

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


" ==========
" powerline
" ==========

set rtp+=~/.local/lib/python3.6/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256

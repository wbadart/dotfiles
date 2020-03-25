#!/bin/sh

test -f ~/.vim/autoload/plug.vim || curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf "$PWD/vimrc.vim" "$HOME/.vimrc" || exit 1
ln -sf "$PWD/resources" "$HOME/.vim"
vim -c PlugInstall -c q -c q

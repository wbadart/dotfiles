#!/bin/sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf $PWD/vimrc.vim $HOME/.vimrc || exit 1
vim -c PlugInstall -c q -c q

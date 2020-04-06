#!/bin/sh

test -f ~/.vim/autoload/plug.vim || curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p $HOME/.config/nvim
ln -sf "$PWD/init.vim" "$HOME/.config/nvim/init.vim" || exit 1
vim -c PlugInstall -c q -c q

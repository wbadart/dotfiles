#!/bin/sh

ln -sf $PWD/zshrc.zsh $HOME/.zshrc || exit 1
ln -sf $PWD/resources $HOME/.config/zsh || exit 1

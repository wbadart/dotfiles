#!/bin/sh

ln -sf $PWD/zshrc.zsh $HOME/.zshrc || exit 1
ln -sf $PWD/zshresources $HOME/.config/zsh || exit 1

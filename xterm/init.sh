#!/bin/sh

ln -sf $PWD/Xresources $HOME/.Xresources || exit 1
xrdb -merge $HOME/.Xresources

#!/bin/sh

if [ -d $HOME/.bin ]; then exit 1; fi
ln -sf $PWD/programs $HOME/.bin

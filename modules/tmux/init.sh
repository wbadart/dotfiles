#!/bin/sh

CONFDIR="$HOME/.config/tmux"
test -d "$CONFDIR" || mkdir -p "$CONFDIR"
ln -sf $PWD/tmux.conf $CONFDIR/tmux.conf || exit 1

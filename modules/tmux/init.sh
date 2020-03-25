#!/bin/sh

CONFDIR="$HOME/.config/tmux"
MAIN='tmux.conf'
test -d "$CONFDIR" || mkdir -p "$CONFDIR"

ln -sf "$PWD/$MAIN" "$HOME/.tmux.conf" || exit 1

for conf in `ls *.tmux.conf | grep -v "^$MAIN$"`; do
    ln -sf "$PWD/$conf" "$CONFDIR"
done

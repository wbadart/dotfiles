#!/bin/sh

CONFDIR="$HOME/.config/i3"
test -d $CONFDIR || mkdir $CONFDIR
ln -sf $PWD/i3.config $CONFDIR/config || exit 1
ln -sf $PWD/status.config $CONFDIR || exit 1

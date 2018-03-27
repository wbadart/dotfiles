#!/bin/sh

##
# init.sh
#
# Initialize subsystems specified by command line args.
#
# Will Badart <wbadart@live.com>
# created: JAN 2018
##

dir=`dirname $0`

if [ -z "$DOTFILE_DIR" -a ! -z "$ZSH_DIR" ]; then
    echo "export DOTFILE_DIR='`pwd`'" >> "$ZSH_DIR/env.zsh"
fi

for dir in "$@"; do
    test -d $dir || continue
    echo "Initializing '$dir'..."
    cd $dir
    ./init.sh || echo "Couldn't initialize $dir"
    cd ..
done

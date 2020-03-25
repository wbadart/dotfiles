#!/bin/sh

##
# init.sh
#
# Initialize subsystems specified by command line args.
#
# Will Badart <wbadart@live.com>
# created: JAN 2018
##

if [ -z "$DOTFILE_DIR" -a ! -z "$ZSH_DIR" ]; then
    echo "export DOTFILE_DIR='`pwd`'" >> "$ZSH_DIR/env.local.zsh"
fi

for module in "$@"; do
    dir="modules/$module"
    test -d $dir || continue
    echo "Initializing '$dir'..."
    pushd $dir > /dev/null
    ./init.sh || echo "Couldn't initialize $dir"
    popd > /dev/null
done

#!/bin/sh

##
# init.sh
#
# Initialize subsystems specified by command line args.
#
# Will Badart <wbadart@live.com>
# created: JAN 2018
##


for dir in "$@"; do
    test -d $dir || continue
    echo "Initializing '$dir'..."
    cd $dir
    ./init.sh || echo "Couldn't initialize $dir"
    cd ..
done

#!/bin/sh

##
# init.sh
#
# Initialize all subsystems.
#
# Will Badart <wbadart@live.com>
# created: JAN 2018
##


for dir in "$@"; do
    test -d $dir || continue
    cd $dir
    ./init.sh || echo "Couldn't initialize $dir"
    cd ..
done

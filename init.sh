#!/bin/sh

##
# init.sh
#
# Initialize all subsystems.
#
# Will Badart <wbadart@live.com>
# created: JAN 2018
##

for dir in `ls`; do
    cd $dir
    ./init.sh || echo "Couldn't initialize $dir"
    cd ..
done

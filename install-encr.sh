#!/bin/sh

ENCR=${ENCR:-/encr/$(id -un)}

EXISTS="$(tput setaf 1)EXISTS$(tput sgr0)"
OK="$(tput setaf 2)OK$(tput sgr0)"

for dir in \
    .ssh mail
do
    if [ -e $HOME/$dir ]; then
        echo "$EXISTS $HOME/$dir"
    else
        mkdir -p $ENCR/$dir || exit 1
        ln -s $ENCR/$dir $HOME/$dir || exit 1
        echo "$OK $HOME/$dir"
    fi
done

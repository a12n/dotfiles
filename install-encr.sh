#!/bin/sh

ENCR=${ENCR:-/encr/$(id -un)}

EXISTS="$(tput setaf 1)EXISTS$(tput sgr0)"
OK="$(tput setaf 2)OK$(tput sgr0)"

for dir in \
    .ssh mail
do
    if [ -e ~/$dir ]; then
        echo "$EXISTS ~/$dir"
    else
        mkdir -p $ENCR/$dir || exit 1
        ln -s $ENCR/$dir ~/$dir || exit 1
        echo "$OK ~/$dir"
    fi
done

#!/bin/sh

cd $(dirname $0)
for x in \
    XCompose \
    Xresources \
    gitconfig \
    hgrc \
    kshrc \
    muttrc \
    muttrc-solarized \
    profile \
    xinitrc
do
    if [ -e $HOME/.$x ]; then
        echo "File $HOME/.$x exists"
    else
        ln -s $PWD/$x $HOME/.$x
    fi
done

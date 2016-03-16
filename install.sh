#!/bin/sh

cd $(dirname $0)
for x in \
    XCompose \
    Xresources \
    Xresources-solarized \
    gdbinit \
    gitconfig \
    hgrc \
    kshrc \
    mplayer \
    ocamlinit \
    offlineimaprc \
    profile \
    xinitrc
do
    if [ -e $HOME/.$x ]; then
        echo "File $HOME/.$x exists"
    else
        ln -s $PWD/$x $HOME/.$x
    fi
done

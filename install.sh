#!/bin/sh

EXISTS="$(tput setaf 1)EXISTS$(tput sgr0)"
LINKED="$(tput setaf 2)LINKED$(tput sgr0)"

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
        echo "$EXISTS $HOME/.$x"
    else
        ln -s $PWD/$x $HOME/.$x || exit 1
        echo "$LINKED $HOME/.$x"
    fi
done

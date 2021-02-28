#!/bin/sh

EXISTS="\x1b[38;5;1mEXISTS\x1b[m"
LINKED="\x1b[38;5;2mLINKED\x1b[m"

cd $(dirname $0)

for x in \
    XCompose \
    Xresources \
    gdbinit \
    gitconfig \
    hgrc \
    latexmkrc \
    ocamlinit \
    offlineimaprc \
    xinitrc \
    zlogin \
    zshrc
do
    src=$PWD/$x
    dest=~/.$x
    destdir=$(dirname $dest)
    if [ -e $dest ]; then
        printf "$EXISTS $dest\n"
    else
        if [ ! -d $destdir ]; then
            mkdir -p $destdir || exit 1
        fi
        ln -s $src $dest || exit 1
        printf "$LINKED $dest\n"
    fi
done

for d in \
    ~/.config/dunst/dunstrc
do
    if [ -e $d ]; then
        printf "$EXISTS $d\n"
    else
        mkdir -p $(dirname $d) || exit 1
        ln -s $PWD/$(basename $d) $d || exit 1
        printf "$LINKED $d\n"
    fi
done

mkdir -p \
      ~/.local/bin ~/proj

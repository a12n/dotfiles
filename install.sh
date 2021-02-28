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
    if [ -e ~/.$x ]; then
        echo "$EXISTS ~/.$x"
    else
        ln -s $PWD/$x ~/.$x || exit 1
        echo "$LINKED ~/.$x"
    fi
done

mkdir -p \
      ~/.local/bin ~/proj

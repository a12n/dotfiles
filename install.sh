#!/bin/sh

EXISTS="$(tput setaf 1)EXISTS$(tput sgr0)"
LINKED="$(tput setaf 2)LINKED$(tput sgr0)"

cd $(dirname $0)
for x in \
    XCompose \
    Xresources \
    gdbinit \
    gitconfig \
    hgrc \
    kshrc \
    latexmkrc \
    ocamlinit \
    offlineimaprc \
    profile \
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

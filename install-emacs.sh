#!/bin/sh

ENCR=${ENCR:-/encr/$(id -un)}

if [ ! -e $HOME/.emacs.d ]; then
    BASE_URL=https://bitbucket.org/a12n
    hg clone $BASE_URL/.emacs.d $HOME/.emacs.d || exit 1
fi

for f in \
    backup secret.el xmpp
do
    ln -s $ENCR/emacs-$f $HOME/.emacs.d/$f || exit 1
    echo "OK $HOME/.emacs.d/$f"
done

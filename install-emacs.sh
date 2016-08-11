#!/bin/sh

ENCR=${ENCR:-/encr/$(id -un)}

if [ ! -e ~/.emacs.d ]; then
    BASE_URL=https://bitbucket.org/a12n
    hg clone $BASE_URL/.emacs.d ~/.emacs.d || exit 1
fi

for f in \
    backup jabber-history secret.el
do
    ln -s $ENCR/emacs-$f ~/.emacs.d/$f || exit 1
    echo "OK ~/.emacs.d/$f"
done

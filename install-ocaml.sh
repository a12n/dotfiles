#!/bin/sh

OCAML_VSN=4.03.0

if [ ! -d ~/.opam ]; then
    if which ocaml > /dev/null; then
        opam init || exit 1
    else
        opam init --comp=$OCAML_VSN || exit 1
    fi
fi

opam install -y \
     batteries merlin ocp-indent qtest utop \
    || exit 1

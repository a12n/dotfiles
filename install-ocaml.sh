#!/bin/sh

OCAML_VSN=4.02.3

if [ ! -d ~/.opam ]; then
    if which ocaml > /dev/null; then
        opam init || exit 1
    else
        opam init --comp=$OCAML_VSN || exit 1
    fi
fi

opam install -y \
     batteries merlin ocp-indent ounit \
    || exit 1

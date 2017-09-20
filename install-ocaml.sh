#!/bin/sh

OCAML_VSN=4.05.0

if [ ! -d ~/.opam ]; then
    if which ocaml > /dev/null; then
        opam init || exit 1
    else
        opam init --comp=$OCAML_VSN || exit 1
    fi
fi

opam install -y \
     batteries menhir merlin ocp-indent patdiff qtest utop \
    || exit 1

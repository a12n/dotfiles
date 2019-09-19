#!/bin/sh

opam init -n || exit 1
opam install -y \
     batteries \
     menhir \
     merlin \
     num \
     ocamlbuild \
     ocp-indent \
     qtest \
     utop \
     zarith \
    || exit 1

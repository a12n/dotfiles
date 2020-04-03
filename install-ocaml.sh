#!/bin/sh

opam init -n -c 4.10.0 || exit 1
opam install -y \
     base \
     batteries \
     core_bench \
     menhir \
     merlin \
     num \
     ocamlbuild \
     ocp-indent \
     qtest \
     stdio \
     utop \
     zarith \
    || exit 1

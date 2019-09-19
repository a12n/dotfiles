#!/bin/sh

opam init -n || exit 1
opam install -y \
     batteries menhir merlin ocp-indent qtest utop \
    || exit 1

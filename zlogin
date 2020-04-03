# -*- mode: sh; sh-shell: zsh -*-

ulimit -c 0
ulimit -d $(( 1024 * 1024 ))               # 1 GiB

. ~/.opam/opam-init/init.sh

eval $(ssh-agent)

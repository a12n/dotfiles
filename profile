# -*- mode: sh -*-

export ENV=~/.kshrc
export PATH=~/.local/bin:$PATH
if [ -d /usr/lib/ccache ]; then
    export PATH=/usr/lib/ccache:$PATH
fi

ulimit -c 0
ulimit -d $(( 1024 * 1024 ))               # 1 GiB

. ~/.opam/opam-init/init.sh

eval $(ssh-agent)

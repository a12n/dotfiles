# -*- mode: sh -*-

export ENV=$HOME/.kshrc
export PATH=$HOME/.local/bin:$PATH
if [ -d /usr/lib/ccache ]; then
    export PATH=/usr/lib/ccache:$PATH
fi

ulimit -c 0
ulimit -d $(( 1024 * 1024 ))               # 1 GiB

eval $(opam config env)

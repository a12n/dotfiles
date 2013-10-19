# -*- mode: sh -*-

export ENV=$HOME/.kshrc
export PATH=$HOME/.local/bin:$PATH

ulimit -c $(( (128 * 1024 * 1024) / 512 ))
ulimit -d $(( 1024 * 1024 ))

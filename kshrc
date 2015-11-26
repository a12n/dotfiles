# -*- mode: sh -*-

HISTFILE=$HOME/.kshhst
HISTSIZE=512

export EDITOR=emacsclient
export EMAIL=arn@bestmx.ru
export GTK_IM_MODULE=xim
export LANG=ru_RU.UTF-8
export LESS=RX
export LESSHISTFILE=/dev/null
export LESSSECURE=1
export MANPAGER=less

alias cporig="mkorig 'cp -Rip'"
alias ec='emacsclient'
alias h='history'
alias j='jobs -l'
alias mvorig="mkorig 'mv -i'"
alias tjt='tar -vtjf'
alias tzt='tar -vtzf'
alias xjt='tar -vxjf'
alias xzt='tar -vxzf'

alias -d e="/encr/$USER"

set -o emacs
set -o notify

case $(uname -s) in
    Linux)
        PS1='$? $(tput setaf 2)${PWD/$HOME/~}$(tput sgr0) '
        alias ls='ls -aF --color=auto'
        ;;
    OpenBSD)
        export LOCALBASE=/usr/local
        if [ "$TERM" == "vt220" ]; then
            TERM=wsvt25
        fi
        PS1='$? \[$(tput setaf 2)\]\w\[$(tput sgr0) '
        if [ -x $LOCALBASE/bin/colorls ]; then
            alias ls='$LOCALBASE/bin/colorls -aFG'
        else
            alias ls='ls -aF'
        fi
        bind '[7~'=beginning-of-line
        bind '[8~'=end-of-line
        ;;
esac

ecp() {
    TMP=$(mktemp) && cat > $TMP && emacsclient $TMP
    rm -f $TMP
}

findorig() {
    dir=$1
    if [ -z "$dir" ]; then
        dir=.
    fi
    find $dir -name \*.orig
}

mkorig() {
    cmd=$1
    shift
    for x in "$@"; do
        x=$(readlink -f $x)
        $cmd "$x" "$x.orig"
    done
}

ncd() {
    mkdir "$1" && cd "$1"
}

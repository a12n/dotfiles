# -*- mode: sh -*-

HISTFILE=$HOME/.kshhst
HISTSIZE=512

export CVS_RSH=ssh
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
alias kssh='ssh-agent ksh'
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
        PS1='$(date +%T) $(tput setaf 1)${SSH_AGENT_PID:+s }$(tput setaf 2)$PWD$(tput sgr0) $? '
        alias ls='ls -aF --color=auto'
        ;;
    OpenBSD)
        export LOCALBASE=/usr/local
        if [ "$TERM" == "vt220" ]; then
            TERM=wsvt25
        fi
        PS1='\t $(tput setaf 1)${SSH_AGENT_PID:+s }$(tput setaf 2)\w$(tput sgr0) $? '
        if [ -x $LOCALBASE/bin/colorls ]; then
            alias ls='$LOCALBASE/bin/colorls -aFG'
        else
            alias ls='ls -aF'
        fi
        ;;
esac

ecp() {
    TMP=$(mktemp) && cat > $TMP && emacsclient $TMP
    rm -f $TMP
}

mkorig() {
    cmd=$1
    shift
    for x in "$@"; do
        x=$(realpath $x)
        $cmd "$x" "$x.orig"
    done
}

ncd() {
    mkdir "$1" && cd "$1"
}

mpdnotify() {
    mpc idleloop player | while read -r EVENT; do
        if [ "$EVENT" = "player" ]; then
            IFS='
'
            set -- $(mpc status | sed '1p;s/.*\[\(.*\)\].*/\1/p;d')
            unset IFS
            if [ "$2" = "playing" ]; then
                notify-send "$2" "$1"
            fi
        fi
    done
}

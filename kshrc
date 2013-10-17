# -*- mode: sh -*-

HISTFILE=$HOME/.kshhst
HISTSIZE=512

export CVS_RSH=ssh
export EDITOR=emacsclient
export GTK_IM_MODULE=xim
export LANG=ru_RU.UTF-8
export LESS=Xr
export LESSHISTFILE=/dev/null
export LESSSECURE=1
export MANPAGER=less

alias ec='emacsclient'
alias h='history'
alias j='jobs -l'
alias tjt='tar -vtjf'
alias tzt='tar -vtzf'
alias xjt='tar -vxjf'
alias xzt='tar -vxzf'

set -o emacs
set -o notify

case $(uname -s) in
    OpenBSD)
        PS1='$? \u@\h $(tput setaf 2)\w$(tput sgr0) \$ '
        # TODO: colorls, gls
        alias ls='ls -aF'
        ;;
    *)
        PS1='$(tput setaf $(($? ? 1 : 11)))$?$(tput sgr0) \
${USER:=$(id -u -n)}@${HOST:=$(uname -n)} \
$(tput setaf 2)${PWD/$HOME/~}$(tput sgr0) $ '
        alias ls='ls -aF --color=auto'
        ;;
esac

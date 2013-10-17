# -*- mode: sh -*-

HISTFILE=$HOME/.kshhst
HISTSIZE=512
PS1='$(tput setaf $(($? ? 1 : 11)))$?$(tput sgr0) \
${USER:=$(id -u -n)}@${HOST:=$(uname -n)} \
$(tput setaf 2)${PWD/$HOME/~}$(tput sgr0) $ '

export CVS_RSH=ssh
export EDITOR=emacsclient
export GTK_IM_MODULE=xim
export LANG=ru_RU.UTF-8
export LESS=X
export LESSHISTFILE=/dev/null
export LESSSECURE=1
export MANPAGER=less

alias ec='emacsclient'
alias h='history'
alias j='jobs -l'
alias ls='ls --color=auto -F -a'
alias tjt='tar -vtjf'
alias tzt='tar -vtzf'
alias xjt='tar -vxjf'
alias xzt='tar -vxzf'

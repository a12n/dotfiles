# -*- mode: sh; sh-shell: zsh -*-

setopt NO_AUTO_MENU
setopt NO_BEEP
setopt NO_MENU_COMPLETE
setopt PROMPT_SUBST

typeset -U path
path=(~/.local/bin $path)

autoload -U colors
colors

autoload -U select-word-style
select-word-style bash

# VCS info

autoload -U vcs_info
zstyle ':vcs_info:*' actionformats '%s %{%F{yellow}%}%b%{%f%} %{%F{red}%}%a%{%f%}'
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' formats '%s %{%F{yellow}%}%b%{%f%}'

precmd() {
    vcs_info
}

# Shell parameters

PS1="%(?..%{%F{red}%}%?%{%f%} )%(1j.%{%F{blue}%}%j%{%f%} .)${SSH_CONNECTION:+%n@%m }%{%F{green}%}%~%{%f%} "
RPS1="\${vcs_info_msg_0_}"

HISTFILE=~/.zhist
HISTSIZE=1000
SAVEHIST=1000

# Aliases

alias cal='ncal -b'
alias ec='emacsclient'
alias grep='grep --color=auto'
alias j='jobs -l'
alias ls='ls -aF --color=auto'
alias tjt='tar -vtjf'
alias tzt='tar -vtzf'
alias xjt='tar -vxjf'
alias xzt='tar -vxzf'

# Env variables

export EDITOR=emacsclient
export EMAIL=arn@bestmx.net
export ERL_AFLAGS="-kernel shell_history enabled"
export GTK_IM_MODULE=xim
export LANG=ru_RU.UTF-8
export LESS=FRX
export LESSHISTFILE=/dev/null
export LESSSECURE=1
export MANPAGER=less
export _JAVA_AWT_WM_NONREPARENTING=1

# Functions

ecp() {
    emacsclient =(cat)
}

fngrep() {
    grep -IR "$@" | cut -d : -f 1 | sort -u
}

ncd() {
    mkdir -p "$@" && cd "$1"
}

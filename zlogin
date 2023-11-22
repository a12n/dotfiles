# -*- mode: sh; sh-shell: zsh -*-

ulimit -c 0

gpgconf --launch gpg-agent

if [[ ! -v DISPLAY && $(tty) == /dev/tty1 ]]; then
    exec startx
fi

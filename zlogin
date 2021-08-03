# -*- mode: sh; sh-shell: zsh -*-

ulimit -c 0
ulimit -d $(( 1024 * 1024 ))               # 1 GiB

gpgconf --launch gpg-agent

if [ -z "$DISPLAY" -a "$(tty)" = "/dev/tty1" ]; then
    exec startx
fi

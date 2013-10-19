# -*- mode: sh -*-

setxkbmap -option 'compose:ralt,ctrl:nocaps,grp:rctrl_toggle' -layout 'us,ru(typewriter),epo,gr(bare)'
xrdb ~/.Xresources
xset -b r rate 256 32
xsetroot -cursor_name left_ptr
xsetroot -solid '#002b36'

case $(uname -s) in
    OpenBSD)
        xset fp+ $LOCALBASE/lib/X11/fonts/terminus/
        ;;
esac

~/.local/bin/dwmstatus &

exec ~/.local/bin/dwm

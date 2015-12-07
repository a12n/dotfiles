# -*- mode: sh -*-

setxkbmap -option 'compose:ralt,ctrl:nocaps,grp:rctrl_toggle' \
          -layout 'us,ru(typewriter),epo,gr(bare)'
wmname LG3D
xrdb ~/.Xresources
xset -b r rate 256 32
xsetroot -cursor_name left_ptr
xsetroot -solid '#002b36'

case $(uname -s) in
    OpenBSD)
        find $LOCALBASE/share/fonts \
            -type d \
            -mindepth 1 \
            -maxdepth 1 \
            -exec xset fp+ {} \;
        if [ -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
	        eval $($LOCALBASE/bin/dbus-launch --sh-syntax --exit-with-session)
        fi
        ;;
esac

export RXVT_SOCKET=$(mktemp -d -t urxvt-XXXXXXXXXXX)/urxvtd
urxvtd --fork --opendisplay

redshift &
~/.local/bin/dwmstatus &

exec ~/.local/bin/dwm

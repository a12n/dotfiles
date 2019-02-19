# -*- mode: sh -*-

setxkbmap -option 'compose:ralt,ctrl:nocaps,grp:rctrl_toggle' \
          -layout 'us,ru(typewriter),epo,gr(bare)'
wmname LG3D
xrdb ~/.Xresources
xset -b r rate 200 35
xsetroot -cursor_name left_ptr
xsetroot -solid '#3c3836'

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

cat<<EOF | ~/.local/bin/dwmstatus &
loadavg 5
cputemp 3
battery 5
maildir 90 "${HOME}/mail/${EMAIL}/INBOX" "${HOME}/mail/${EMAIL}/Work"
utime 1
EOF

exec ~/.local/bin/dwm

# -*- mode: sh -*-

setxkbmap -option 'compose:ralt,ctrl:nocaps,grp:rctrl_toggle' \
          -layout 'us,ru(typewriter),epo,gr(bare)'
wmname LG3D
xrdb ~/.Xresources
xset -b r rate 200 35 s 600
xsetroot -cursor_name left_ptr -solid '#3c3836'
if [ -f ~/.config/wallpaper ]; then
    display -gravity center -crop 16:9 -window root ~/.config/wallpaper
fi

# T480s, L14
for TRACKPOINT in "Elan TrackPoint" "TPPS/2 Elan TrackPoint"; do
    xinput --set-prop "$TRACKPOINT" "libinput Accel Speed" -0.67
done

export RXVT_SOCKET=$(mktemp -d -t urxvt-XXXXXXXXXXX)/urxvtd
urxvtd --fork --opendisplay

redshift &
xss-lock slock &

~/.local/bin/dwmstatus &
exec ~/.local/bin/dwm

# -*- mode: sh -*-

setxkbmap -option 'compose:ralt,ctrl:nocaps,grp:rctrl_toggle' \
          -layout 'us,ru(typewriter),epo,gr'
wmname LG3D
xrdb ~/.Xresources
xset -b r rate 200 35 s 600
xsetroot -cursor_name left_ptr -solid '#3c3836'
if [ -f ~/.config/wallpaper ]; then
    display -gravity center -crop 16:9 -window root ~/.config/wallpaper
fi

# T480s
xinput set-prop 'Elan TrackPoint' 'libinput Accel Speed' -0.67

# T14
xinput set-button-map 'ELAN0676:00 04F3:3195 Touchpad' \
       0 0 0 \
       4 5 \
       6 7 \
       0 0 0 0 0 0 0 0
xinput set-prop 'ELAN0676:00 04F3:3195 Touchpad' 'Coordinate Transformation Matrix' \
       0 0 0 \
       0 0 0 \
       0 0 1

redshift &
xss-lock slock &

~/.local/bin/dwmstatus &
exec ~/.local/bin/dwm

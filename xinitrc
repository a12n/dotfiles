# -*- mode: sh -*-

setxkbmap -option 'compose:ralt,ctrl:nocaps,grp:rctrl_toggle' \
          -layout 'us,ru(typewriter),epo,gr(bare)'
wmname LG3D
xrdb ~/.Xresources
xset -b r rate 200 35
xsetroot -cursor_name left_ptr
xsetroot -solid '#3c3836'

# T480s
xinput --set-prop 'Elan TrackPoint' 'libinput Accel Speed' -1

export RXVT_SOCKET=$(mktemp -d -t urxvt-XXXXXXXXXXX)/urxvtd
urxvtd --fork --opendisplay

redshift &
xss-lock slock &

cat<<EOF | ~/.local/bin/dwmstatus &
loadavg 5
cputemp 3
battery 5
maildir 90 $HOME/Maildir/bestmx/INBOX/ $HOME/Maildir/intabs/INBOX/ $HOME/Maildir/local/INBOX/
utime 1
EOF

exec ~/.local/bin/dwm

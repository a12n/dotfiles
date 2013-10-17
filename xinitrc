setxkbmap -option 'compose:ralt,ctrl:nocaps,grp:rctrl_toggle' -layout 'us,ru(typewriter),epo,gr(bare)'
xrdb ~/.Xresources
xset -b r rate 256 32
xsetroot -cursor_name left_ptr
xsetroot -solid '#002b36'

~/.local/bin/dwmstatus &

exec ~/.local/bin/dwm

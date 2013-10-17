/usr/bin/setxkbmap -option 'compose:ralt,ctrl:nocaps,grp:rctrl_toggle' -layout 'us,ru(typewriter),epo,gr(bare)'
/usr/bin/xrdb ~/.Xresources
/usr/bin/xset -b
/usr/bin/xsetroot -cursor_name left_ptr
/usr/bin/xsetroot -solid '#002b36'

~/.local/bin/dwmstatus &

exec ~/.local/bin/dwm

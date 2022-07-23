/usr/lib/xfce-polkit/xfce-polkit&
xrandr --output DP-0 --mode 2560x1440 --rate 240 --output HDMI-0 --off
nitrogen --restore &
xsetroot -cursor_name left_ptr
setxkbmap us &
picom -f &
wal -R
source $HOME/.cache/wal/mycolors.sh
exec bspwm

touch $HOME/testfajl
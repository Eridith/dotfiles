#!/bin/bash

hyprctl setcursor Qogir-cursors 24

# Wallpaper init
awww-daemon &
awww img /home/Josh/.cache/wal/cache &
wal -R &

# Utilities
/usr/local/bin/hypridle &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
thunar --daemon &
wl-paste --watch cliphist store &
waybar &
dunst &
jamesdsp -t &
gsr-ui launch-daemon &
#openrgb --startminimized &

# File cleanup
CORE=$HOME/core.*
UPDATE=$HOME/.config/hypr/updateflag.txt
if [ -e $CORE ]; then
    rm $CORE
fi
if [ -e $UPDATE ]; then
    rm $UPDATE
    kitty --hold sh -c "hyprpm update"
    pkill -15 kitty
    hyprpm reload -n
fi
exit 0

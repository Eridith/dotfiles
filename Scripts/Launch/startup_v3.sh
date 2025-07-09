#!/bin/bash

# Wallpaper init
swww-daemon &
swww img /home/Josh/.cache/swww/cache &
wal -R &

# Sound System
pipewire &
wireplumber &
pipewire-pulse &

# Utilities
/usr/local/bin/hypridle &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
syncthing serve &
thunar --daemon &
wl-paste --watch cliphist store &
waybar &
dunst &

# Applications
gsr-ui launch-daemon &
jamesdsp -t &

#notify-send "Error" "Hyprpanel failed to initialize, falling back to waybar config" &

# File cleanup
CORE=$HOME/core.*
UPDATE=$HOME/.config/hypr/updateflag.txt
if [ -e $CORE ]; then
    cd
    rm $CORE
fi
if [ -e $UPDATE ]; then
    rm $UPDATE
    kitty --hold sh -c "hyprpm update"
    pkill -15 kitty
    hyprpm reload -n
fi
exit 0

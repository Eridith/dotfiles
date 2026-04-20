#!/bin/bash

#Save to folder by game
#name=$(hyprctl activewindow | grep title | awk '{print $2}' | tail -1)
#window_name="$(echo "$name" | tr -d '/\\™' | tr -s "[:blank:]")"

killall gpu-screen-recorder
notify-send "Replay" "Recording initialized" -i ~/.config/dunst/video2.png
gpu-screen-recorder \
    -w DP-1 \
    -f 60 \
    -r 30 \
    -restart-replay-on-save yes \
    -c mp4 \
    -k av1 \
    -a "$(pactl get-default-sink).monitor" \
    -a "alsa_output.usb-Focusrite_Scarlett_Solo_USB-00.HiFi__Line1__sink.monitor" \
    -a "app-inverse:Chromium" \
    -q ultra \
    -o "$HOME/Videos/Replays"

    # Note: Chromium is the appname that is shown for when tidal-hifi is playing. This is subject to change whenever tidal gets a native linux application port

#!/bin/bash

# Save to folder by game
window_name=$(hyprctl activewindow | grep title | awk '{print $2}' | tail -1 | tr -d '/\\™' | tr -s "[:blank:]")

# Save the Video
mkdir -p ~/Videos/Replays/$window_name
notify-send "Replay" "Recording Saved in Videos" -i /home/Josh/.config/dunst/video2.png
killall -SIGUSR1 gpu-screen-recorder
sleep 0.1
mv "$(find ~/Videos/Replays -maxdepth 1 -type f -exec ls -t {} + | head -1)" ~/Videos/Replays/$window_name/$(date +"Replay_%Y-%m-%d_%H-%M-%S.mp4")

#!/bin/bash

# Spawn main player window Slide in from top
#hyprctl --batch dispatch -- "exec spotify --enable-features=UseOzonePlatform --ozone-platform=wayland --uri=%U &"
hyprctl dispatch "exec [float] tidal-hifi" &
sleep .25
kitty --hold sh -c "cava" &

# Spawn 3 Cava sub-windows, each window slides in from the side it borders - Bottom, left, then right
#kitty --hold sh -c "cava" &
#kitty --hold sh -c "cava" &

#hyprctl --batch dispatch -- "exec kitty --hold sh -c "cava" ; dispatch tagwindow playerleft" #dispatch setfloating ; dispatch size 1922 411"
#hyprctl --batch dispatch -- "exec kitty --hold sh -c "cava" ; dispatch tagwindow playerbottom" #dispatch setfloating ; dispatch size 280 1352"
#hyprctl --batch dispatch -- "exec kitty --hold sh -c "cava" ; dispatch tagwindow playerright" #dispatch setfloating ; dispatch size 280 1352"

#hyprctl --batch dispatch -- "exec [float; size 1940 280 ; move 2870 1140] kitty --hold sh -c "cava"" #tagwindow +code ^(foot)$, left"
#hyprctl --batch dispatch -- "exec [float ; size 280 1352 ; move 2574 74] kitty --hold sh -c "cava""
#hyprctl --batch dispatch -- "exec [float ; size 280 1352 ; move 4826 74] kitty --hold sh -c "cava""
exit 0

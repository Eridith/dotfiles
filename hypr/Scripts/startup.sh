#!/bin/bash
dbus-update-activation-environment --all
/usr/bin/waybar &
/usr/bin/dunst &
/usr/bin/pipewire &
/usr/bin/wireplumber &
/usr/bin/pipewire-pulse &
/usr/bin/xwaylandvideobridge &
/usr/lib/polkit-kde-authentication-agent-1 &
/usr/bin/ckb-next & 
/usr/lib/ckb-next-animations/gradient --ckb-run & 
/usr/lib/ckb-next-animations/gradient --ckb-run &
#wl-paste --watch cliphist store &
wl-paste --type text --watch cliphist store
wl-paste --type image --watch cliphist store
ratbagd &
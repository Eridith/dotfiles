#!/bin/bash
CORE=$HOME/core.*
UPDATE=$HOME/.config/hypr/updateflag.txt
cd
if [ -e $CORE ]; then
    rm $CORE
fi
if [ -e $UPDATE ]; then
    kitty --hold sh -c "hyprpm update"
    rm $UPDATE
    sleep 2
    pkill -9 kitty
fi
    hyprpm reload -n
exit 0

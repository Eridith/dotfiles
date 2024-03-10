#!/bin/bash
CORE=$HOME/core.*
UPDATE=$HOME/.config/hypr/updated.txt
cd
if [ -e $CORE ]; then
    rm $CORE
fi
if [ -e $UPDATE ]; then
    kitty --hold sh -c "hyprpm update"
    rm $UPDATE
else
    hyprpm reload -n
fi
exit 0
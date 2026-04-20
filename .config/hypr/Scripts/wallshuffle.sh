#!/bin/bash
DIR=/home/Josh/Pictures/Wallpapers
PICS=($(ls ${DIR}))
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

#cache=$(</home/Josh/.cache/awww/*DP-1)
cache=$(readlink -f "/home/Josh/.cache/wal/cache")
WALL0=/home/Josh/.cache/wal/cache

awwwVAR1="--transition-fps 144 \
    --transition-type grow \
    --transition-pos 200,1400 \
    --transition-bezier 0.16,1,0.3,1.1"

awwwVAR2="--transition-fps 144 \
    --transition-type fade \
    --transition-bezier 0.16,1,0.3,1.1"

ln -sf ${DIR}/${RANDOMPICS} ${WALL0}
awww img ${WALL0} $awwwVAR2
wal -i /home/Josh/.cache/wal/cache -nte

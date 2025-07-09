#!/bin/bash
DIR=/home/Josh/Pictures/Wallpapers
PICS=($(ls ${DIR}))
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

#cache=$(</home/Josh/.cache/swww/*DP-1)
cache=$(readlink -f "/home/Josh/.cache/swww/cache")
WALL0=/home/Josh/.cache/swww/cache

swwwVAR1="--transition-fps 144 \
    --transition-type grow \
    --transition-pos 200,1400 \
    --transition-bezier 0.16,1,0.3,1.1"

swwwVAR2="--transition-fps 144 \
    --transition-type fade \
    --transition-bezier 0.16,1,0.3,1.1"

ln -sf ${DIR}/${RANDOMPICS} $WALL0
swww img ${WALL0} $swwwVAR2
wal -i ${cache} -n -t -e

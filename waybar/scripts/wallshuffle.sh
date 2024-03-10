#!/bin/bash
DIR=/home/Josh/Pictures/Wallpapers
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]} 

WALL0=/home/Josh/.cache/swww/cache.png
swwwVAR="--transition-fps 144 --transition-type grow --transition-pos 200,1400 --transition-bezier 0.16,1,0.3,1.1"
CACHE=/home/Josh/.cache/swww/cache.png

swww img ${DIR}/${RANDOMPICS} $swwwVAR & cp ${DIR}/${RANDOMPICS} ${CACHE} & sleep 3 && wal -i ${WALL0} -n

#!/bin/bash
cache=$(</home/Josh/.cache/swww/*DP-1)

swww init &
swww img $cache &
wal -R &

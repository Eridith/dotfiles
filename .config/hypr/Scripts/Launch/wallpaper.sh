#!/bin/bash
#cache=$(</home/Josh/.cache/awww/*DP-1)
che=$(</home/Josh/.cache/wal/cache)

awww init &
awww img $cache &
wal -R &

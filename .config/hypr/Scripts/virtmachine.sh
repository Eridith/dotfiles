#!/bin/bash

virsh --connect qemu:///system start "win10"
sleep 1
looking-glass-client -F

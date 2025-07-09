#!/bin/bash

virsh --connect qemu:///system start "Win10"
sleep 1
looking-glass-client -F

#!/bin/bash
cd
git clone https://github.com/hyprwm/hyprwayland-scanner && cd hyprwayland-scanner
cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build -j `nproc`
sudo cmake --install build
rm -rf ../hyprwayland-scanner
exit 0

#!/bin/bash
cd
git clone https://github.com/hyprwm/hypridle
cd hypridle
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hypridle -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install build
rm -rf ../hypridle
exit 0
#!/bin/bash

# Update Aquamarine
cd
git clone https://github.com/hyprwm/aquamarine/releases/tag/v0.4.3
cd aquamarine
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
rm -rf ../aquamarine

# Update hyprscanner
cd
git clone https://github.com/hyprwm/hyprwayland-scanner
cd hyprwayland-scanner
cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build -j `nproc`
sudo cmake --install ./build
rm -rf ../hyprwayland-scanner

# Update hyprutils
cd
git clone https://github.com/hyprwm/hyprutils
cd hyprutils
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install ./build
rm -rf ../hyprutils

# Update hyprgraphics
#cd
#git clone https://github.com/hyprwm/hyprgraphics
#cd hyprgraphics
#cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
#cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
#sudo cmake --install ./build
#rm -rf ../hyprgraphics

# Downgrade Hyprland [ No Systemd ]
DIRECTORY=$HOME/Hyprland
VERSION=v0.50.0
cd
echo "Looking for existing Hyprland files"
if [ -d $DIRECTORY ]; then
    echo "Removing existing repository..."
    rm -rf Hyprland
fi
echo "Cloning Hyprland repositories..."
git clone --recursive https://github.com/hyprwm/Hyprland/releases/tag/$VERSION
cd Hyprland
mkdir -p build && cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DNO_SYSTEMD:STRING=true -B build -G Ninja
cmake --build ./build --config Release --target all #-j $(nproc)
sudo cmake --install ./build
rm -rf ../Hyprland

# Create a flag for startup script to find and update hyprpm at first launch
touch $HOME/.config/hypr/updateflag.txt

echo "Successfully updated Hyprland!"
sleep 1

exit 0
